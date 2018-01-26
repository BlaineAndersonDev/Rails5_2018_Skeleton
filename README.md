# Rails 5 Skeleton
#### Built using "[Railstutorial.org](https://www.railstutorial.org/book/static_pages)" as a reference base.

###### ------------------------------------------------------------------
#### Easily forgettable git commands when using Rails:
###### Help Commands:
* `rake -T`/`rails -T`: A useful command list

###### Local Database:
  * `rails db:drop`
  * `rails db:create`
  * `rails db:migrate`
  * `rails db:seed`

###### Branch Control:
  * `git reset --hard HEAD`: Resets the branch to the last commit. Use with caution!
  * `git checkout -b [BRANCH-NAME]`: The `-b` allows the creation of a new branch. `co` can be used in place of `checkout`.

###### Connecting Local & Remote Repos:
  * `git remote add origin [LINK TO NEW GITHUB REPO]`: Connect a remote repo to your local repo.

###### Heroku:
  * `heroku create`: Creates a Heroku repo for you to use.
  * `git push heroku master`: uploads the MASTER branch to Heroku to be deployed live.
  * `https://ancient-retreat-50009.herokuapp.com/`: Once done the link to the live site should be similar to this.
  * `heroku logs`: Shows the console activity (and errors) on the Heroku web server.

###### Rspec Installation & Commands:
  * Use `gem install rspec-rails` in the CLI or place `gem 'rspec-rails'` into the gemfile manually. The use `bundle install.`.
  * `rails g rspec:install`: Install RSpec via the Command Line AFTER implementing the gem using `bundle install`.
  * `be rspec -fd`: Runs the RSpec tests. `rspec` will also work but may prompt an error. `-fd` generates a more in-depth report.
  * [Rspec Model Test Guide](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
  * [Rspec View Test Guide](http://ruby-journal.com/how-to-write-rails-view-test-with-rspec/)
  * [Rspec Controller Test Guide](https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html)

###### ------------------------------------------------------------------
#### Rails Generate Commands:
  * [RoR Generation Guide.](http://guides.rubyonrails.org/command_line.html#rails-generate)
  * `rails g` can be used as a shortcut command.
  * `rails d` can be used to destroy the generation if you need to redo it.

###### Controller Generation:
  * [Personal Preference Controller Generation Guide](https://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/)
  * `rails g controller [Name of object in CamelCase] [Routes to include with options]`
  * `rails g controller StaticPages home help`

###### Model Generation:
  * [Personal Preference Model Generation Guide 1](https://railsguides.net/advanced-rails-model-generators/)
  * [Personal Preference Model Generation Guide 2](https://richonrails.com/articles/rails-model-generator-shortcuts)
  * `rails g model [model name] [field:fieldtype]`
  * `rails g controller user username email:string age:integer`
  * Each `field` may be assigned a field type. This defaults to `(field):string`.
  * Available field types are: `integer` `primary_key` `decimal` `float` `boolean` `binary` `string` `text` `date` `time` `datetime` `timestamp`.

###### ------------------------------------------------------------------
#### Adding Models/Views/Controllers Manually(Including Tests)(No Generators):
###### Models:
  *

###### Views:
  *

###### Controllers:
  * Using TDD(Test Driven Development) we will create a failing RSpec test to start with.
  * Open the RSpec spec file `spec/controllers/static_pages_controller_spec.rb` and create a test:
    ~~~~
      describe "GET #about" do
        it "returns http success" do
          get :about
          expect(response).to have_http_status(:success)
        end
      end
    ~~~~
  * [**RSpec**]: Run Rspec in Terminal.
  * [**Error**]: The error should now be: `No route matches {:action=>"about", :controller=>"static_pages"}`.
  * [**Solve**]: Add `get  'static_pages/about'` to `config/routes.rb`.
  * [**RSpec**]: Run Rspec in Terminal.
  * [**Error**]: The error should now be: `The action 'about' could not be found for StaticPagesController`.
  * [**Solve**]: Now add the route into the controller: `app/controllers/static_pages_controller.rb`
    ~~~~
      def about
      end
    ~~~~
  * [**RSpec**]: Run Rspec in Terminal.
  * [**Error**] should now be: `StaticPagesController#about is missing a template for this request format and variant.`
  * [**Solve**]: Now create a view for the controller route: `touch app/views/static_pages/about.html.erb`
  * [**Side Note**]: While the controller is complete, you should also create a spec file for testing the view later in `spec/views/static_pages/about.html.erb_spec.rb`
  * [**Complete**]: The test should now be passing and you have a new route in your controller!





###### ------------------------------------------------------------------
####Additional Resources:
  * [Markdown CheatSheet](https://en.support.wordpress.com/markdown-quick-reference/)
  * [Markdown Previewer](https://jbt.github.io/markdown-editor/)

###### ------------------------------------------------------------------
#### Creation Steps, Notes & Tutorial Links:
###### [Tutorial: 3.1 "Sample App Setup"](https://www.railstutorial.org/book/static_pages#sec-sample_app_setup)
  * "Github" may be used in place of "Bitbucket".
  * "Postgresql" may be used instead of "SQLite3" for test databases.

###### [Tutorial: 3.3 "Getting Started With Testing"](https://www.railstutorial.org/book/static_pages#sec-getting_started_with_testing)
  * I chose to use "Rspec" instead of the built in test suite. If you missed any steps below PRIOR to generating the controller just use the `rails d` command to destroy the controller and `rails g` recreate it.
  * Make sure you have run the command `rails g rspec:install` if you are using the `gem 'rspec-rails'`.
  * Make sure you have removed the provided gem for controller testing: `gem 'rails-controller-testing'`.

###### [Tutorial: 3.4 "Slightly Dynamic Pages"](https://www.railstutorial.org/book/static_pages#sec-slightly_dynamic_pages)
  * The described tests in this section are considered "View" tests and should be input into the static_pages specs individually. While not recommend, this can be worked around by adding `render_views` just under `RSpec.describe StaticPagesController, type: :controller do` in the static_pages controller RSpec tests. That being said until we get further into the app view tests are not very useful. I chose to use the code below.
  ~~~~
    RSpec.describe StaticPagesController, type: :controller do
      render_views

      describe "GET #home" do
  ~~~~
