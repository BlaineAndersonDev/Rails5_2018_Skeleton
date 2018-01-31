# Rails 5 Skeleton
#### Built using "[Railstutorial.org](https://www.railstutorial.org/book/static_pages)" as a reference base.
##### The tutorial uses some variations or procedures I don't personally use. All changes in my code is referenced in the readme per tutorial section.

###### ------------------------------------------------------------------
#### Easily forgettable commands & amazing resources for using Rails:
###### Help Commands:
  * `rake -T`/`rails -T`: A useful command list

###### Local Database:
  * `rails db:drop`
  * `rails db:create`
  * `rails db:migrate`
  * `rails db:seed`
  * `rails db:migrate:reset`
  * `rails console` :Covered in-depth in it's own section.

###### Rails Console:
  * There are **many** SQL commands, but I will cover some of the more common ones and provide examples for each:
    * `Object.new` : Creates a new 'Object' with nil fields.
    * `Object.new(field: 'filler')` : Creates a new 'Object' filled with provided fields.
    * `Object.valid?` : Checks if the 'Object' is valid and returns a boolean.
    * `Object.[field]` : Returns the specified field from that specific 'Object'
    * `Object.created_at` : Returns the timestamp for when the 'Object' was created.
    * `Object.updated_at` : Returns the timestamp for when the 'Object' was last updated.
    * `Object.save` : Saves the 'Object' into the database as long as its 'valid'.
    * `Object.save!` : Saves the 'Object' into the database as long as its 'valid' else it returns an error. (Only use during debugging).
    * `Object.create` : Creates and saves the 'Object' into the database as long as its 'valid' and returns the 'Object'.
    * `Object.create!` : Creates and saves the 'Object' into the database as long as its 'valid' and returns the 'Object' else it returns an error. (Only use during debugging).
    * `Object.find(integer)` : Searches the database for the index (integer) of that 'Object' and returns it if it exists.
    * `Object.find_by(field: "field_entry")` : Searches the database for the field & field_entry of that 'Object' and returns the 'Object' if it exists.
    * `Object.first` : Searches the database returns the first indexed 'Object' if it exists.
    * `Object.all` : Searches the database returns every 'Object' if any exists.

    * These examples assume there is a "User" model with "Name" & "Email" fields:
    ~~~~
        >> User.new
        => #<User id: nil, name: nil, email: nil, created_at: nil, updated_at: nil>

        >> user = User.new(name: "Michael Hartl", email: "mhartl@example.com")
        => #<User id: nil, name: "Michael Hartl", email: "mhartl@example.com", created_at: nil, updated_at: nil>

        >> user.valid? #Returns a boolean value of true if valid.
        => #true

        >> user.save #Saves the user to the database provided the user is valid, and provides a boolean on success or failure.
         (0.1ms)  SAVEPOINT active_record_1
         SQL (0.8ms)  INSERT INTO "users" ("name", "email", "created_at",
         "updated_at") VALUES (?, ?, ?, ?)  [["name", "Michael Hartl"],
         ["email", "mhartl@example.com"], ["created_at", 2016-05-23 19:05:58 UTC],
         ["updated_at", 2016-05-23 19:05:58 UTC]]
         (0.1ms)  RELEASE SAVEPOINT active_record_1
        => true

        >> user.name #Returns the variable "user"'s name.
        => "Michael Hartl"

        >> user.email #Returns the variable "user"'s email.
        => "mhartl@example.com"

        >> user.updated_at #Returns the variable "user"'s updated_at timestamp.
        => Mon, 23 May 2016 19:05:58 UTC +00:00

        >> User.create(name: "A Nother", email: "another@example.org")
        #<User id: 2, name: "A Nother", email: "another@example.org", created_at: "2016-05-23 19:18:46", updated_at: "2016-05-23 19:18:46">

        >> foo = User.create(name: "Foo", email: "foo@bar.com")
        #<User id: 3, name: "Foo", email: "foo@bar.com", created_at: "2016-05-23 19:19:06", updated_at: "2016-05-23 19:19:06">

        >> User.find(1)
        => #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com", created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

        >> User.find(3)
        ActiveRecord::RecordNotFound: Couldn't find User with ID=3

        >> User.find_by(email: "mhartl@example.com")
        => #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
        created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

        >> User.first
        => #<User id: 1, name: "Michael Hartl", email: "mhartl@example.com",
        created_at: "2016-05-23 19:05:58", updated_at: "2016-05-23 19:05:58">

        >> User.all
        => #<ActiveRecord::Relation [#<User id: 1, name: "Michael Hartl",
        email: "mhartl@example.com", created_at: "2016-05-23 19:05:58",
        updated_at: "2016-05-23 19:05:58">, #<User id: 2, name: "A Nother",
        email: "another@example.org", created_at: "2016-05-23 19:18:46",
        updated_at: "2016-05-23 19:18:46">]>
    ~~~~

    * Manipulating/Updating "Objects" in database:
      * Keep in mind you **must** user `Object.save` when finished or the changes won't be permanently made to the "Object".
      * `Object.[field] = "new_field_value"` : Updates the specified field from that specific 'Object' to the "new_field_value".
      * `Object.update_attribute(name: "The Dude")` : Update a single value.
      * `Object.update_attributes(name: "The Dude", email: "dude@abides.org")` : Update multiple values at once.
      * `Object.errors.full_messages` : If the "Object" is invalid, this will provide a full error messages regarding why.
      ~~~~
          >> user.email = "mhartl@example.net"
          => "mhartl@example.net"
          >> user.save
          => true

          >> user.update_attribute(:name, "El Duderino")
          => true
          >> user.name
          => "El Duderino"

          >> user.update_attributes(name: "The Dude", email: "dude@abides.org")
          => true
          >> user.name
          => "The Dude"
          >> user.email
          => "dude@abides.org"

          >> user.errors.full_messages
          => ["Name can't be blank"]
      ~~~~

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
  * [RSpec Matcher Guide](https://relishapp.com/rspec/rspec-expectations/v/3-7/docs/built-in-matchers)
  * Use `gem install rspec-rails` in the CLI or place `gem 'rspec-rails'` into the gemfile manually. The use `bundle install.`.
  * `rails g rspec:install`: Install RSpec via the Command Line AFTER implementing the gem using `bundle install`.
  * `be rspec -fd`: Runs the RSpec tests. `rspec` will also work but may prompt an error. `-fd` generates a more in-depth report.
  * `be rspec spec/[folder/filename] -fd`: Allows you to specify what folder or file you want to test individually.
  * [Rspec Spec Generator Guide](https://relishapp.com/rspec/rspec-rails/docs/generators)
    * `rails generate rspec:model [model name]`
    * `rails generate rspec:controller [controller name]`
  * [Rspec Model Test Guide](https://semaphoreci.com/community/tutorials/how-to-test-rails-models-with-rspec)
    * [**Ex**]: `let(:object) { User.new(name: => "Jane Doe", :email => "jane@doe.com", :password => "pw1234", :password_confirmation => "pw1234") }`
  * [Rspec View Test Guide](http://ruby-journal.com/how-to-write-rails-view-test-with-rspec/)
  * [Rspec Controller Test Guide](https://everydayrails.com/2012/04/07/testing-series-rspec-controllers.html)
  * [Rspec Route Test Guide](http://geekhmer.github.io/blog/2014/07/30/test-routes-with-rspec-in-ruby-on-rails/)

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
  * Model Validations:
    * [RoR Validation Guide](http://guides.rubyonrails.org/active_record_validations.html)
    * [In-Depth Regex Email Validations](https://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address)
    * If your "User" model has the fields "name" & "email" you can add required validations to ensure they are formatted properly.
    * `validates :[field]`: This is the simplest validation. It requires only that the field is not `nil`. (So `blank` is fine.)
    * `validates :[field], presence: [true/false]`: Requires that the field is not `blank`
    * `validates :[field], length: { maximum: 50 }`: Requires that the field be under the provided maximum length of characters.
    * `validates :[field]format: { with: [Regex_Formula] }`: Requires that the field successfully pass the Regex format.
    * `validates :[field]uniqueness: [true/false]`: Requires that the field be one of a kind.
    * `validates :[field]uniqueness: { case_sensitive: [true/false] }`: Allows you to set case_sensitive uniqueness. It is true by default.

    * User Migration Example:
    ~~~~
        class CreateUsers < ActiveRecord::Migration[5.1]
          def change
            create_table :users do |t|
              t.string :name
              t.string :email

              t.timestamps
            end
          end
        end
    ~~~~
    * User Model Example:
    ~~~~
        class User < ApplicationRecord
          validates :name,  presence: true, length: { maximum: 50 }
          validates :email, presence: true, length: { maximum: 255 }
        end
    ~~~~

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
  * [**Error**]:The error should now be: `StaticPagesController#about is missing a template for this request format and variant.`
  * [**Solve**]: Now create a view for the controller route: `touch app/views/static_pages/about.html.erb`
  * [**Side Note**]: While the controller is complete, you should also create a spec file for testing the view later in `spec/views/static_pages/about.html.erb_spec.rb`
  * [**Complete**]: The test should now be passing and you have a new route in your controller!


###### ------------------------------------------------------------------
#### Rails Helpers & Routing:
###### **Named** Route Examples:
~~~~
  Page	     URL	     Named route
  Home	     /	         root_path
  About	     /about	     about_path
  Help	     /help	     help_path
  Contact	 /contact	 contact_path
  Sign up	 /signup	 signup_path
  Log in	 /login	     login_path

  Using "resources :users" will provide:
  get "/users" # -- index on your controller
  get "/users/:id" # -- show on your controller
  get "/users/new" # -- new method on your controller
  post "/users" # -- create on your controller
  get "/users/:id/edit" # -- edit method on your controller
  put "/users/:id" # -- update on your controller
  patch "/users/:id" # -- update on your controller
  delete "/users/:id" # -- destroy on your controller
~~~~

##### Routing:
* [RESTful Routing](https://richonrails.com/articles/understanding-rails-routing)
* All routes are defined in `config/routes.rb`.
* `_path` is the normal route to use when using Rails Helpers.
* `_url` is generally only used for redirects with no exchange of information.
* The difference between `_path` & `_url` is the url version includes the entire url instead of a relative route.

  * **Root Route**
    * The root is a special route and therefore is slightly different than regular routes using "root" instead of "get" etc.
    * [**Normal Route**]: `get 'root 'static_pages#home'`.
    * [**Ex**]: `root_path -> '/'` - `root_url  -> 'http://www.example.com/'`
    * [**Rails Helper**] The root can be accessed as the route `root_path`. Ex: `<%= link_to "Home", root_path %>`
    * [**Rails Helper**] It can also be accessed as a route with `root_url`. Ex: `<%= link_to "Home", root_url %>`
    * [**HTML**] It can also be accessed as an HTML route `'/'`. Ex: `<a href="/">Home</a>`

  * **Normal Routes**
    * [**Normal Route**]: `get 'static_pages/help'`.
    * [**Ex**]: `help_path -> '/help'` - `help_url  -> 'http://www.example.com/static_pages/help'`
    * [**Rails Helper**] This route can be accessed with `help_path`. Ex: `<%= link_to "Help", help_path %>`
    * [**Rails Helper**] It can also be accessed with `help_url`. Ex: `<%= link_to "Help", help_url %>`
    * [**HTML**] It can also be accessed using HTML `'/static_pages/help'`. Ex: `<a href="/static_pages/help">Help</a>`

  * **Custom Routes**
    * Sometimes we want a page to be accessed via a different route than RESTful. You would then need a custom route.
    * Let's change our "Normal" route to a "Custom" route. This will change the `_path` & `_url`.
    * [**Normal Route**]: `get 'static_pages/help'` is originally access using:
      * `<%= link_to "Help", help_path %>`
      * `<a href="/static_pages/help">Help</a>`
    * [**Custom Route**]: `get  '/help', to: 'static_pages#help'` is now accessed using:
      * `<%= link_to "Help", help_path %>`
      * `<a href="/help">Help</a>`
      * [**Ex**]: `help_path -> '/help'` - `help_url  -> 'http://www.example.com/help'`


##### Rails Helpers:
  * **Link_To**:
    * [RoR link_to Guide](http://guides.rubyonrails.org/getting_started.html)
    * Creating a Link:
      * [**Rails Example**]: `<%= link_to "About", about_path %>`
      * [**HTML Example**]: `<a href="/static_pages/about">About</a>`
      * [**Rails Helper**]: `<%= link_to 'LinkName', http://LinkToPlace.org %>`
      * [**Rails Helper**]: `<%= link_to 'LinkName', any_routes_path %>`
      * [**Raw HTML**]: `<a href="http://LinkToPlace.org">LinkName</a>`
      * [**Raw HTML**]: `<a href="/ViewFolder/View">LinkName</a>`

    * Creating an Image as a Link:
      * [**Example**]: `<%= link_to image_tag("rails.png", alt: "Rails logo"), 'http://rubyonrails.org/' %>`
      * [**Rails Helper**]: `<%= link_to image_tag("ImageName.Extension", alt: "AlternateName"), 'http://LinkToPlace.org' %>`
      * [**Raw HTML**]: `<a href="http://LinkToPlace.org"><img alt="AlternateName" src="/ViewFolder/ImageName.Extension" /></a>`
      *

  * **Form_For**:
    * Creating a Form:
    * [Tutorial: Chapter 7.2 Signup form](https://www.railstutorial.org/book/sign_up#sec-signup_form)
    * [RoR form_for Guide](http://guides.rubyonrails.org/form_helpers.html)
    ~~~~
        <h1>Sign up</h1>

        <div class="row">
            <%= form_for(@user) do |f| %>
              <%= f.label :name %>
              <%= f.text_field :name %>

              <%= f.label :email %>
              <%= f.email_field :email %>

              <%= f.label :password %>
              <%= f.password_field :password %>

              <%= f.label :password_confirmation, "Confirmation" %>
              <%= f.password_field :password_confirmation %>

              <%= f.submit "Create my account", class: "btn btn-primary" %>
            <% end %>
        </div>
    ~~~~
      * `<%= form_for(@user) do |f| %>` The "@user" implies to Rails that we want to create namespaced data using "user[field]"
      * [**Ex**]: `<%= f.text_field :name %>` - NameSpaced: user[name]
      * [**Ex**]: `<%= f.email_field :name %>` - NameSpaced: user[email]
      * [**Ex**]: `<%= f.password_field :password %>` - NameSpaced: user[password]
      * [**Ex**]: `<%= f.password_field :password_confirmation %>` - NameSpaced: user[password_confirmation]
      * All these Namespaced fields together create a params hash: {name: user[name], email: user[email], password: user[password], password_confirmation: user[password_confirmation]}
      * The Rails Helper version VS. the HTML version:
      ~~~~
          #Rails:
            <%= f.label :name %>
            <%= f.text_field :name %>
          #html
            <label for="user_name">Name</label>
            <input id="user_name" name="user[name]" type="text" />
      ~~~~

##### Creating Sessions:
  * Sessions is the browser based "User ID" that allow a User to persistently be logged in on any given page of a website or program.
  * This requires you to already have a User database setup. The following steps provide a blueprint to expand on:
    * **Routes: `config/routes.rb`**:
      ~~~~
          get    '/login',   to: 'sessions#new'`
          post   '/login',   to: 'sessions#create'
          delete '/logout',  to: 'sessions#destroy'`
      ~~~~
    * **Sessions View: `app/views/sessions/new.html.erb`**
      ~~~~
          <h1>Log in</h1>

          <div class="row">
            <div class="col-md-6 col-md-offset-3">
              <%= form_for(:session, url: login_path) do |f| %>

                <%= f.label :email %>
                <%= f.email_field :email, class: 'form-control' %>

                <%= f.label :password %>
                <%= f.password_field :password, class: 'form-control' %>

                <%= f.submit "Log in", class: "btn btn-primary" %>
              <% end %>

              <p>New user? <%= link_to "Sign up now!", signup_path %></p>
            </div>
          </div>
      ~~~~
    * **Sessions Controller: `app/controllers/sessions_controller.rb`**
      ~~~~
          def new
          end

          def create
            user = User.find_by(email: params[:session][:email].downcase)
            if user && user.authenticate(params[:session][:password])
              # Log the user in and redirect to the user's show page.
            else
              # Create an error message.
              flash.now[:danger] = 'Invalid email/password combination'
              render 'new'
            end
          end

          def destroy
          end
      ~~~~
    * **FILLER**
      ~~~~
      ~~~~
    * **FILLER**
      ~~~~
      ~~~~

###### ------------------------------------------------------------------
#### Building your own Authentication System in Rails:
###### Basics:
  * Rails has a built in method called `has_secure_password` that when placed in a model (generally "User") provides the following:
    * The ability to save a securely hashed `password_digest` attribute to the database
    * A pair of virtual attributes (`password` and `password_confirmation`), including presence validations upon object creation and a validation requiring that they match
    * An authenticate method that returns the user when the `password` is correct (and false otherwise)
  * The only requirement for `has_secure_password` to work its magic is for the corresponding model (User) to have an attribute called `password_digest`.
  * You can generate a User model that includes it right off with the following command:
    * ``
  * Or you can add it to an already created User model by creating a new migration:
    * `rails generate migration add_password_digest_to_users password_digest:string`
    * This migration "`add_password_digest_to_users`" uses Rails methods to "`add_`" the "`password_digest_`" "`to_users`".
  * User Model


###### ------------------------------------------------------------------
#### Additional Resources:
###### Markdown:
  * [Markdown CheatSheet](https://en.support.wordpress.com/markdown-quick-reference/)
  * [Markdown Previewer](https://jbt.github.io/markdown-editor/)

###### CSS:
  * [Flexbox)](https://css-tricks.com/snippets/css/a-guide-to-flexbox/)
  * [Coolors.co](https://coolors.co/)
  * [Keep Footers Down](http://matthewjamestaylor.com/blog/keeping-footers-at-the-bottom-of-the-page)
  * []()

###### SASS:
  * [SASS Docs)](http://sass-lang.com/)
  * []()

###### Regex:
  * [Rublar)](http://www.rubular.com/)
  * []()

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
  * [3.4.2] You **must** use a `before(:each)` loop instead of the provided `def setup` example. Code for this is provided below:
  ~~~~
    RSpec.describe StaticPagesController, type: :controller do
      render_views

      before(:each) do
        @base_title = "Ruby on Rails Tutorial Sample App"
      end
  ~~~~
  * The final "root" test is actually a routing test. So we will create a routing test folder and two sets of routing specs.
  * [**Create**]: Generate the routing folder `mkdir spec/routing`
  * [**Create**]: Generate the root route spec `touch spec/routing/root_routing_spec.rb`
  * [**Create**]: Generate the static_pages route spec `touch spec/routing/static_pages_routing_spec.rb`
  * [**Edit**]: Make sure to include `require 'rails_helper'` in each spec file.
  * We currently only have 4 routes to test:
  ~~~~
    Prefix Verb URI Pattern                   Controller#Action
    root GET  /                             static_pages#home
    static_pages_home GET  /static_pages/home(.:format)  static_pages#home
    static_pages_help GET  /static_pages/help(.:format)  static_pages#help
    static_pages_about GET  /static_pages/about(.:format) static_pages#about
  ~~~~
  * The example below is for the root route:
  ~~~~
    require 'rails_helper'

    RSpec.describe "Root Route", :type => :routing do
      it "#root" do
        expect(get("/")).
        to route_to('static_pages#home')
      end
    end
  ~~~~
  * The example below is for the static_pages#home route:
  ~~~~
    require 'rails_helper'

    RSpec.describe "StaticPagesRoutes", :type => :routing do
      it "#home" do
        expect(get("/static_pages/home")).
        to route_to('static_pages#home')
      end
    end
  ~~~~
  * Thats all I changed for this chapter. **Be aware that chapter 4 is review of basic Rails concepts to DBC Graduates**. If your one I recommend skipping it.

###### [Tutorial: 5.3.2 "Rails Routes"](https://www.railstutorial.org/book/filling_in_the_layout#sec-rails_routes)
  * Tests work a bit differently here. Due to RSpec we dont need to change anything in the static_pages_controller_spec tests.
  * We do, however, need to alter the static_pages_routing_spec. We need to remove the `/static_pages` from each `expect` line.

###### [Tutorial: 5.3.4 "Layout link tests"](https://www.railstutorial.org/book/filling_in_the_layout#sec-layout_link_tests)
  * This is testing our routes, which we have already updated. Move on to the next section.

###### [Tutorial: 6.2.1 "A validity test"](https://www.railstutorial.org/book/modeling_users#sec-a_validity_test)
  * Here we are setting up Rspec tests for our new User model. When you used `rails generate model User name:string email:string` it would have automatically generated the RSpec file as well. Located at `spec/models/user_spec.rb`.
  * In the RSpec we'll need to add a "user" to test as well as the validity tests themselves:
  ~~~~
      require 'rails_helper'

      RSpec.describe User, type: :model do
        let(:user) { User.new(:name => "Blaine", :email => "BlaineEmail123@gmail.com") }

        it "is valid with all attributes" do
          expect(user).to be_valid
        end

        it "is not valid without a name" do
          user.name = nil
          expect(user).to_not be_valid
        end

        it "is not valid without an email" do
          user.email = nil
          expect(user).to_not be_valid
        end

      end
  ~~~~
  * We also need to setup validity for both "name" & "email" in our User model:
  ~~~~
      class User < ApplicationRecord
        validates :name,  presence: true
        validates :email, presence: true
      end
  ~~~~
  * At this point all your tests should pass.

###### [Tutorial: 6.2.3 "Length Validation"](https://www.railstutorial.org/book/modeling_users#sec-length_validation)
  * Here we are updating both the User model and the model tests to reflect a character limit on "name" and "email" fields.
  * Updated user_spec.rb:
  ~~~~
      it "is invalid if name > 50 characters" do
        user.name = "a" * 51
        expect(user).to_not be_valid
      end

      it "is invalid if email > 255 characters" do
        user.email = "a" * 244 + "@example.com"
        expect(user).to_not be_valid
      end
  ~~~~
  * Updated User model:
  ~~~~
      validates :name,  presence: true, length: { maximum: 50 }
      validates :email, presence: true, length: { maximum: 255 }
  ~~~~
  * At this point all your tests should pass.

###### [Tutorial: 6.2.4 "Format validation"](https://www.railstutorial.org/book/modeling_users#sec-format_validation)
  * [In-Depth Regex Email Validations](https://stackoverflow.com/questions/201323/using-a-regular-expression-to-validate-an-email-address)
  * In this section we are adding format validations to the User model and User spec:
  * Updated user_spec.rb:
  ~~~~
      it "is invalid if email contains errors" do
        invalid_addresses = ["user@example,com", "user_at_foo.org", "user.name@example.foo@bar_baz.com", "foo@bar+baz.com"]
        invalid_addresses.each do |invalid_address|
          user.email = invalid_address
          expect(user).to_not be_valid
        end
      end
  ~~~~
  * Updated User model:
  ~~~~
      class User < ApplicationRecord
        validates :name,  presence: true, length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
      end
  ~~~~

###### [Tutorial: 6.2.5 "Uniqueness validation"](https://www.railstutorial.org/book/modeling_users#sec-uniqueness_validation)
  * In this section we are adding Uniqueness validations to the User model and User spec:
  * Updated user_spec.rb:
  ~~~~
      it "is invalid if email is duplicate" do
          duplicate_user = user.dup
          duplicate_user.save
          expect(duplicate_user).to_not be_valid
      end
  ~~~~
  * Updated User model:
  ~~~~
      class User < ApplicationRecord
        validates :name,  presence: true, length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
        validates :email, presence: true, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
      end
  ~~~~
  * During this section you will create an index migration for email. Your tests will **NOT** be red as stated because we built them seperately in RSpec (as far as I understand it). This will likely be covered later on.

###### [Tutorial: 6.3.2 "User has secure password"](https://www.railstutorial.org/book/modeling_users#sec-has_secure_password)
  * We'll now need to update our RSpec to include the two virtual attributes "password" & "password_confirmation".
  * Updated user_spec.rb:
  ~~~~
      let(:user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }
  ~~~~

###### [Tutorial: 6.3.3 Minimum password standards](https://www.railstutorial.org/book/modeling_users#sec-minimum_password_standards)
  * Now we will update our User model with a minimum password requirement and create tests for it in RSpec.
  * Updated user_spec.rb:
  ~~~~
      let(:user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

      . . .

      it "is invalid if password <= 5 characters" do
        expect(user.password.length).to be > 5
      end

      it "is invalid if password_confirmation <= 5 characters" do
        expect(user.password_confirmation.length).to be > 5
      end

      it "is invalid if password & password_confirmation do not match" do
        expect(user.password).to eq (user.password_confirmation)
      end
  ~~~~
  * Updated User model:
  ~~~~
      class User < ApplicationRecord

        before_save { self.email = email.downcase }

        validates :name,  presence: true,
                          length: { maximum: 50 }
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
        validates :email, presence: true,
                          length: { maximum: 255 },
                          format: { with: VALID_EMAIL_REGEX },
                          uniqueness: { case_sensitive: false }

        has_secure_password
        validates :password, presence: true,
                             length: { minimum: 6 }
      end
  ~~~~

###### [Tutorial: 7.1.3 "Debugger"](https://www.railstutorial.org/book/sign_up#sec-debugger)
  * While this section works with the gem "byebug", I would rather use the debugger command and RSpec tests exclusively, and as such byebugs use is not represented in my codebase.

###### [Tutorial: 7.3.4 A test for invalid submission](https://www.railstutorial.org/book/sign_up#sec-a_test_for_invalid_submission)
  * The tutorials at this point require additional tests and gems to complete those tests. I decided to create the routes & RSpecs for each RESTful route even though they are not required at this point. I've provided these tests and the respective controller routes below as well as the steps to make them green.
  * At this point we will need to add a new gem to our gemfile to properly test the user_controller_spec.
  * Add `gem 'rails-controller-testing'` to your gemfile directly or user `gem install rails-controller-testing` in your CLI.
  * Updated user_controller_spec.rb:
  ~~~~
      require 'rails_helper'

      RSpec.describe UsersController, type: :controller do
        let!(:only_user) { User.create(:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome") }

        describe "GET user#index" do
          before { get :index }

          it "assigns @users" do
            expect(assigns(:users)).to eq([only_user])
          end

          it "renders the index template" do
            expect(response).to render_template("index")
          end
        end

        describe "GET user#show" do
          before { get :show, params: {id: only_user.id} }

          it "assigns @user" do
            expect(assigns(:user)).to eq(only_user)
          end

          it "renders the show template" do
            expect(response).to render_template("show")
          end
        end

        describe "GET 'new'" do
          before { get :new }

          it "assigns @user" do
            expect(assigns(:user)).to be_a_new(User)
          end

          it "renders the new template" do
            expect(response).to render_template("new")
          end
        end

        describe "POST 'create'" do
          before { get :create, params: {:user => {:name => "OtherBlaine", :email => "OtherBlaineEmail123@gmail.com", :password => "OtherBlainesAwesome", :password_confirmation => "OtherBlainesAwesome"} } }

          it "will redirect to root path" do
            expect(response).to redirect_to(root_path)
          end

          it "will create a new User" do
            expect{get :create, params: {:user => {:name => "OtherOtherBlaine", :email => "OtherOtherBlaineEmail123@gmail.com", :password => "OtherOtherBlainesAwesome", :password_confirmation => "OtherOtherBlainesAwesome"} }}.to change{User.count}.by(1)
          end
        end

        describe "GET 'edit'" do
          before { get :edit, params: {id: only_user.id} }

          it "assigns @post" do
            expect(assigns(:user)).to eq(only_user)
          end

          it "renders the edit template" do
            expect(response).to render_template("edit")
          end
        end

        describe "PUT 'update'" do
          context "upon success" do
            before { put :update, params: {id: only_user.id, user: {:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BlainesAwesome"} } }
            it "will redirect to root path" do
              expect(response).to redirect_to root_path
            end
          end
          context "upon failure" do
            before { put :update, params: {id: only_user.id, user: {:name => "Blaine", :email => "BlaineEmail123@gmail.com", :password => "BlainesAwesome", :password_confirmation => "BadPassword"} } }

            it "will render :edit template" do
              get :edit, params: { id: only_user.id }
              expect(response).to render_template("edit")
            end
          end
        end

        describe "DELETE 'destroy'" do
          before { get :destroy, params: {id: only_user.id} }

          it " will redirect to root path" do
            expect(response).to redirect_to root_path
          end
        end

      end
  ~~~~
  * Updated User Controller:
  ~~~~
      class UsersController < ApplicationController

        def index
          @users = User.all
        end

        def show
          @user = User.find(params[:id])
        end

        def new
          @user = User.new
        end

        def create
          @user = User.new(user_params)
          if @user.save
            redirect_to '/'
          else
            render new_user_path
          end
        end

        def edit
          @user = User.find(params[:id])
        end

        def update
          @user = User.find(params[:id])
          if @user.update_attributes(user_params)
            redirect_to root_path
          else
            redirect_to edit_user_path
          end
        end

        def destroy
          User.find(params[:id]).destroy
          redirect_to root_path
        end

        private

        def user_params
          params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end

      end
  ~~~~
