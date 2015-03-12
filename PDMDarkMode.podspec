
Pod::Spec.new do |s|

  s.name         = "PDMDarkMode"
  s.version      = "0.0.1"
  s.summary      = "PDMDarkMode lets you change your application user interface easier."

  s.description  = <<-DESC
                   PDMDarkMode lets you change your application user interface easier.
                   You use PDMDarkMode control every User Interface Color & Bundle Image changes by Plist File.
                   We call PlistFile as StyleSheet File.
                   DESC

  s.homepage     = "https://github.com/duowan/PDMDarkMode"

  s.license      = "MIT"

  s.author             = { "PonyCui" => "cuiminghui@yy.com" }

  s.platform     = :ios, "6.0"

  s.source       = { :git => "https://github.com/duowan/PDMDarkMode.git", :tag => "0.0.1" }

  s.source_files  = "PDMDarkMode/Classes","PDMDarkMode/Classes/**",,"PDMDarkMode/Classes/**/**",,"PDMDarkMode/Classes/**/**/**"
  s.requires_arc = true

  s.dependency "ReactiveCocoa", "~> 2.4.7"

end
