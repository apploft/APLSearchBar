Pod::Spec.new do |s|

  s.name         = "APLSearchBar"
  s.version      = "0.0.1"
  s.summary      = "UISearchBar subclass with extended UISearchBarDelegate protocol"

  s.description  = <<-DESC
                   * can automatically resign first responder when search button or clear button is tapped
                   * asks it's delegate if the text should be cleared when clear button is tapped
                   DESC

  s.homepage     = "https://github.com/apploft/APLSearchBar"

  s.license      = { :type => 'MIT', :file => 'LICENSE' }
  
  s.author       = { "Michael Kamphausen" => "michael.kamphausen@apploft.de" }
  
  s.platform     = :ios

  s.source       = { :git => "https://github.com/apploft/APLSearchBar.git", :tag => s.version.to_s }

  s.source_files  = "Classes", "Classes/**/*.{h,m}"
  s.exclude_files = "Classes/Exclude"
  
  s.requires_arc = true

end
