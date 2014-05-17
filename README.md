# Ruby on Rails Tutorial: sample application

This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).


# 3 Mostly static pages
`$ cd ~/rails_projects`

`$ rails new sample_app --skip-test-unit`

``$ cd sample_app``

Listing 3.1: A Gemfile for the sample app.

````ruby
source 'https://rubygems.org'

 Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
 Use sqlite3 as the database for Active Record
gem 'sqlite3'
 Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
 Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
 Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
 See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby

 Use jquery as the JavaScript library
gem 'jquery-rails'
 Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
 Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
 bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

 Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end


````

``$ bundle install --without production``

``$ bundle update``

``$ bundle install``

``$ git init``

``$ git add .``

``$ git commit -m "Initial commit"``

``$ git mv README.rdoc README.md``

``$ git commit -am "Improve the README``

``$ git remote add origin https://github.com/connyboviken/sample_app.git``

``$ git push -u origin master``

## 3.1 Static pages
``$ git checkout -b static-pages``

``$ rails generate controller StaticPages home help --no-test-framework``

``$ git add .``

``$ git commit -m "Add a StaticPages controller"``

``$ git push --set-upstream origin static-pages``

``$ rails generate controller StaticPages home help``

## 3.2 Our first tests
### 3.2.1 Test-driven development
``$ rails generate integration_test static_pages``

Listing 3.9: Code to test the contents of the Home page.

*spec/requests/static_pages_spec.rb*

```ruby

 require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end
end
```

``$ bundle exec rspec spec/requests/static_pages_spec.rb``

### 3.2.2 Adding a page

Listing 3.14: Adding code to test the contents of the About page.

*spec/requests/static_pages_spec.rb*

```ruby

 require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end
  end

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end
  end

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end
  end
end

````

``$ bundle exec rspec spec/requests/static_pages_spec.rb``

No route matches [GET] "/static_pages/about"

``$ bundle exec rspec spec/requests/static_pages_spec.rb``

The action 'about' could not be found for StaticPagesController


``$ bundle exec rspec spec/requests/static_pages_spec.r``

Missing template static_pages/about

Running RSpec should now get us back to Green:

``$ bundle exec rspec spec/requests/static_pages_spec.rb``

``$ git add --all``

``$ git commit -m "Add home, help and about"``

``$ git push --set-upstream origin static-pages``

## 3.3 Slightly dynamic pages
### 3.3.1 Testing a title change
`$ mv app/views/layouts/application.html.erb foobar`

*spec/requests/static_pages_spec.rb*
````
  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
    end
  end
````
`$ bundle exec rspec spec/requests/static_pages_spec.rb`

