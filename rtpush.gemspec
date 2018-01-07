$LOAD_PATH.push File.expand_path('../lib', __FILE__)

Gem::Specification.new do |s|
  s.name          = 'rtpush'
  s.version       = '0.0.3'
  s.authors       = ['Mhd Sami AlMouhtaseb']
  s.email         = 'mssatnami@gmail.com'

  s.summary       = 'Ruby terminal push notification service.'
  s.description   = 'terminal push notification service for ruby.'
  s.homepage      = 'https://github.com/satnami/rtpush'
  s.license       = 'MIT'

  s.files         = `git ls-files -- lib bin README.md CHANGELOG.md LICENSE`.split("\n")
  s.test_files    = `git ls-files -- {spec}`.split("\n")
  s.executables   = %w[rtpush]
  s.require_paths = %w[lib spec]

  s.add_dependency 'dotenv', '~> 2.2', '>= 2.2.1'
  s.add_dependency 'fcm', '~> 0.0.2', '>= 0.0.2'
  s.add_dependency 'instapush-api', '~>0.1', '>=0.1.0'
  s.add_dependency 'redis', '~> 4.0', '>= 4.0.1'
  s.add_dependency 'rpush', '~> 3.0', '>= 3.0.1'
  s.add_dependency 'rpush-redis', '~> 0.4', '>= 0.4.1'
  s.add_dependency 'slack-notifier', '~> 2.3', '>= 2.3.1'
  s.add_dependency 'twilio-ruby', '~> 5.6', '>= 5.6.0'

  s.add_development_dependency 'rspec', '~> 0'
end
