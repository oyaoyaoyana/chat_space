source 'https://rubygems.org'


# Default gems
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'   # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'mysql2', '~> 0.4.4'                # Use mysql as the database for Active Record
gem 'puma', '~> 3.0'                    # Use Puma as the app server
gem 'sass-rails', '~> 5.0'              # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'              # Use Uglifier as compressor for JavaScript assets
gem 'turbolinks', '~> 5'
gem 'coffee-rails', '~> 4.2'            # Use CoffeeScript for .coffee assets and views
gem 'jquery-rails'                      # Use jquery as the JavaScript library
gem 'jbuilder', '~> 2.5'                # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rake', '< 11.0'

# Windows does not include zoneinfo files, so bundle the tzinfo-data ge

# Front side
gem 'erb2haml'
gem 'haml-rails'

# User session
gem 'devise'
gem 'devise-i18n'
gem 'carrierwave'
gem 'fog'

group :development, :test do
  gem 'byebug', platform: :mri          # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 3.5.0.beta'
  gem 'factory_girl_rails', "~> 4.4.1"
  gem 'faker'
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem "rails-controller-testing"
end

group :development do
  gem 'web-console'                      # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'listen', '~> 3.0.5'               # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem 'unicorn'
end
