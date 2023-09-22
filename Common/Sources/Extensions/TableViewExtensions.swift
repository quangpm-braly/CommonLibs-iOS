//
//  TableViewExtensions.swift
//  
//
//  Created by Braly Admin on 22/09/2023.
//

import UIKit

public extension UITableView {
    
    private func reuseIndentifier<T>(for type: T.Type) -> String {
        return String(describing: type)
    }

    func register<T: UITableViewCell>(cell: T.Type) {
        register(T.self, forCellReuseIdentifier: reuseIndentifier(for: cell))
    }

    func registerNib<T: UITableViewCell>(cell: T.Type, bundle: Bundle) {
        register(UINib(nibName: reuseIndentifier(for: cell), bundle: bundle), forCellReuseIdentifier: reuseIndentifier(for: cell))
    }

    func register<T: UITableViewHeaderFooterView>(headerFooterView: T.Type) {
        register(T.self, forHeaderFooterViewReuseIdentifier: reuseIndentifier(for: headerFooterView))
    }

    func registerNib<T: UITableViewHeaderFooterView>(headerFooterView: T.Type, bundle: Bundle) {
        register(UINib(nibName: reuseIndentifier(for: headerFooterView), bundle: bundle), forHeaderFooterViewReuseIdentifier: reuseIndentifier(for: headerFooterView))
    }

    func dequeueReusableCell<T: UITableViewCell>(for type: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: reuseIndentifier(for: type), for: indexPath) as? T else {
            fatalError("Failed to dequeue cell.")
        }

        return cell
    }

    func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>(for type: T.Type) -> T {
        guard let view = dequeueReusableHeaderFooterView(withIdentifier: reuseIndentifier(for: type)) as? T else {
            fatalError("Failed to dequeue footer view.")
        }

        return view
    }
}

// MARK: - Actions extension
public extension UITableView {
    func scrollToTop(animated: Bool = true) {
        setContentOffset(.zero, animated: animated)
    }

    func scrollToBottom(animated: Bool = true) {
        guard numberOfSections > 0 else { return }
        let lastRowNumber = numberOfRows(inSection: numberOfSections - 1)
        guard lastRowNumber > 0 else { return }
        let indexPath = IndexPath(row: lastRowNumber - 1, section: numberOfSections - 1)
        scrollToRow(at: indexPath, at: .top, animated: animated)
    }

    func safeScrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) {
        guard indexPath.section < numberOfSections else { return }
        guard indexPath.row < numberOfRows(inSection: indexPath.section) else { return }
        scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
    }

    func reloadCellAt(section: Int = 0, row: Int, animation: RowAnimation = .fade) {
        if let indexPath = validIndexPath(section: section, row: row) {
            reloadRows(at: [indexPath], with: animation)
        }
    }

    func reloadSectionAt(index: Int, animation: RowAnimation = .fade) {
        reloadSections(IndexSet(integer: index), with: animation)
    }
}

// MARK: - Private function helper
private extension UITableView {
    func validIndexPath(section: Int, row: Int) -> IndexPath? {
        guard section >= 0 && row >= 0 else { return nil }
        let rowCount = numberOfRows(inSection: section)
        guard rowCount > 0 && row < rowCount else { return nil }
        return IndexPath(row: row, section: section)
    }
}
