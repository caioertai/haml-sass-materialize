# GEMFILE
########################################
run 'rm Gemfile'
file 'Gemfile', <<-RUBY
  source 'https://rubygems.org'
  ruby '#{RUBY_VERSION}'

  git_source(:github) do |repo_name|
    repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
    "https://github.com/#{repo_name}.git"
  end

  gem 'rails', '~> 5.1.5'
  gem 'sqlite3'
  gem 'puma', '~> 3.7'
  gem 'sass-rails', '~> 5.0'
  gem 'uglifier', '>= 1.3.0'

  gem 'turbolinks', '~> 5'
  gem 'jbuilder', '~> 2.5'

  gem 'haml-rails'
  gem 'materialize-sass'

  group :development, :test do
    gem 'capybara', '~> 2.13'
    gem 'faker'
    gem 'pry-byebug'
    gem 'selenium-webdriver'
  end

  group :development do
    gem 'web-console', '>= 3.3.0'
    gem 'listen', '>= 3.0.5', '< 3.2'
    gem 'spring'
    gem 'spring-watcher-listen', '~> 2.0.0'
  end

  gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
RUBY

# Assets
########################################
run 'rm app/assets/javascripts/application.js'
file 'app/assets/javascripts/application.js', <<-JS
  //= require rails-ujs
  //= require_tree .
JS

run 'rm app/assets/stylesheets/application.css'
file 'app/assets/javascripts/application.css.sass', <<-SASS
  // External libraries
  @import "materialize-sass"
  @import "font-awesome-sprockets"
  @import "font-awesome"

  // CSS partials
  @import "layouts/index";
SASS

run 'rake haml:erb2haml'
run 'bundle'
