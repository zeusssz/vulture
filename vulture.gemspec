Gem::Specification.new do |spec|
  spec.name          = 'vulture'
  spec.version       = '1.0.0'
  spec.summary       = 'A CLI tool for automated visual regression testing by comparing screenshots of web pages.'
  spec.description   = 'Vulture captures and compares screenshots of web pages at multiple resolutions, highlighting visual differences.'
  spec.authors       = ['zeusssz']
  spec.files         = Dir['lib/**/*.rb'] + ['vulture.rb', 'config.yml', 'templates/report_template.html.erb']
  spec.bindir        = '.'
  spec.executables   = ['vulture.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'capybara', '~> 3.35'
  spec.add_dependency 'selenium-webdriver', '~> 4.0'
  spec.add_dependency 'chunky_png', '~> 1.4'
  spec.add_dependency 'erb', '~> 1.2'
  
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rspec', '~> 3.10'
end
