# Ruby on Rails Tutorial: sample application

This is the sample application for
the [*Ruby on Rails Tutorial*](http://railstutorial.org/)
by [Michael Hartl](http://michaelhartl.com/).

$ git checkout -b static-pages
$ rails generate controller StaticPages home help --no-test-framework
$ git add .
$ git commit -m "Add a StaticPages controller"
$ git push --set-upstream origin static-pages
$ rails generate controller StaticPages home help
$ rails generate integration_test static_pages
$ bundle exec rspec spec/requests/static_pages_spec.rb
