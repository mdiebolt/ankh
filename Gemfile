source "https://rubygems.org"

# ruby file: ".ruby-version"

gem "rails", github: "rails/rails", branch: "main"

gem "propshaft"

gem "sqlite3", "~> 1.4"

gem "puma"

gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"

gem "tailwindcss-rails"

gem "slim"

gem "bootsnap", require: false

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

group :development, :test do
  gem "debug"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "rails_live_reload"
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
