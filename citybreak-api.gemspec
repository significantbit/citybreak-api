Gem::Specification.new do |s|
  s.name        = 'citybreak-api'
  s.version     = '0.0.0'
  s.date        = '2016-10-26'
  s.summary     = 'A ruby client for using the Citybreak API'
  s.description = 'Creates a client to be able to easily communicate with the Citybreak API'
  s.authors     = ['Ante Wall']
  s.email       = ['antewall@gmail.com']
  s.files       = `git ls-files`.split($/)
  s.test_files  = s.files.grep(%r{^(test|spec|features)/})
  s.homepage    = 'https://github.com/significantbit/citybreak-api'
  s.license     = 'MIT'
  s.require_paths = ['lib']

  s.add_runtime_dependency 'savon', '>= 2.11.0', '< 3.0.0'

  s.add_development_dependency 'rspec', '>= 3.5.0', '< 4.0.0'
  s.add_development_dependency 'simplecov', '>= 0.12.0', '< 1.0.0'
end
