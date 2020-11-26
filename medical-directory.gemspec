require_relative 'lib/medical/directory/version'

Gem::Specification.new do |spec|
  spec.name          = "medical-directory"
  spec.version       = Medical::Directory::VERSION
  spec.authors       = ["Pranava S Balugari"]
  spec.email         = ["stalin.pranava@gmail.com"]

  spec.summary       = %q{Lookup and reporting of patients data.}
  spec.description   = %q{Lookup and reporting of patients data.}
  spec.homepage      = "https://github.com/elitenomad/medical-directory"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/elitenomad/medical-directory"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "smarter_csv", "~> 1.2.6"
end
