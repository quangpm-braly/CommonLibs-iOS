//
//  CollectionViewExtensions.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import UIKit

public extension UICollectionView {

    private func reuseIndentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }

    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(T.self, forCellWithReuseIdentifier: reuseIndentifier(for: cell))
    }

    func registerNib<T: UICollectionViewCell>(cell: T.Type, bundle: Bundle) {
        register(UINib(nibName: reuseIndentifier(for: cell), bundle: bundle), forCellWithReuseIdentifier: reuseIndentifier(for: cell))
    }

    func registerNibSupplementaryViewFor<T: UIView>(cell: T.Type, ofKind kind: String, bundle: Bundle) {
        register(UINib(nibName: reuseIndentifier(for: cell), bundle: bundle), forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIndentifier(for: cell))
    }

    func registerClassSupplementaryViewFor<T: UIView>(cell: T.Type, ofKind kind: String) {
        register(cell, forSupplementaryViewOfKind: kind, withReuseIdentifier: reuseIndentifier(for: cell))
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for type: T.Type, indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableCell(withReuseIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("make sure the cell is registered with collection view")
        }
        return cell
    }

    func dequeueReusableSupplementaryView<T: UIView>(type: T.Type, ofKind kind: String, indexPath: IndexPath) -> T? {
        guard let cell = dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: reuseIndentifier(for: type),
            for: indexPath) as? T else {
            fatalError(
                "Couldn't find UICollectionReusableView, make sure the view is registered with collection view")
        }
        return cell
    }
}

// MARK: - Actions extension
public extension UICollectionView {
    func scrollToTop(animated: Bool = true) {
        setContentOffset(.zero, animated: animated)
    }

    func scrollToBottom(animated: Bool = true) {
        guard numberOfSections > 0 else { return }
        let lastRowNumber = numberOfItems(inSection: numberOfSections - 1)
        guard lastRowNumber > 0 else { return }
        let indexPath = IndexPath(item: lastRowNumber - 1, section: numberOfSections - 1)
        scrollToItem(at: indexPath, at: .top, animated: animated)
    }

    func safeScrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) {
        guard indexPath.item >= 0,
              indexPath.section >= 0,
              indexPath.section < numberOfSections,
              indexPath.item < numberOfItems(inSection: indexPath.section) else {
            return
        }
        scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
    }

    func reloadCellAt(section: Int = 0, item: Int) {
        if let indexPath = validIndexPath(section: section, item: item) {
            reloadItems(at: [indexPath])
        }
    }

    func reloadSectionAt(index: Int) {
        reloadSections(IndexSet(integer: index))
    }
}

// MARK: - Private functions helper
private extension UICollectionView {
    func validIndexPath(section: Int, item: Int) -> IndexPath? {
        guard section >= 0 && item >= 0 else { return nil }
        let itemCount = numberOfItems(inSection: section)
        guard itemCount > 0 && item < itemCount else { return nil }
        return IndexPath(item: item, section: section)
    }
}
