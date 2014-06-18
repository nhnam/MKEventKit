
Pod::Spec.new do |s|
  s.name         = "MKEventKit"
  s.version      = "0.1.0"
  s.summary      = "Simplifies manipulation of iOS calendar events."
  s.homepage     = "https://github.com/michalkonturek/MKEventKit"
  s.license      = 'MIT'

  s.author       = { 
    "Michal Konturek" => "michal.konturek@gmail.com" 
  }

  s.ios.deployment_target = '7.0'

  s.social_media_url = 'https://twitter.com/michalkonturek'
  s.source       = { 
    :git => "https://github.com/michalkonturek/MKEventKit.git", 
    :tag => s.version.to_s
  }

  s.source_files = 'Source/**/*.{h,m}'
  s.requires_arc = true
  s.framework  = 'EventKit'
  s.dependency 'MKFoundationKit', '>= 1.2.0'
end