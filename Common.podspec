Pod::Spec.new do |spec|
  spec.name         = "Common"
  spec.version      = "1.0.0"
  spec.summary      = "Common Framework"
  spec.description  = <<-DESC
	Common	
DESC

  spec.homepage     = "https://www.bralyvn.com"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Quang Pham" => "quangpm@bralyvn.com" }

  spec.swift_version = '5.3'

  ios_deployment_target = '13.0'
  osx_deployment_target = '10.15'
  tvos_deployment_target = '13.0'
  watchos_deployment_target = '6.0'

  spec.ios.deployment_target = ios_deployment_target
  spec.osx.deployment_target = osx_deployment_target
  spec.tvos.deployment_target = tvos_deployment_target
  spec.watchos.deployment_target = watchos_deployment_target

  spec.source       = {
      :git => "https://github.com/quangpm-braly/CommonLibs-iOS.git",
      :tag => spec.version.to_s
      }

  spec.source_files = 'Common/Sources/**/*.{swift,h}'

end
