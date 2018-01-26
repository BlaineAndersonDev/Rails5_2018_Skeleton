# Rails 5 Skeleton

###### ------------------------------------------------------------------
#### Easily forgettable git commands when using Rails:
###### Help Commands:
* `rake -T`/`rails -T`: A useful command list

###### Local Database:
  * `rails db:create`
  * `rails db:migrate`
  * `rails db:seed`

###### Branch Control:
  * `git checkout -b [BRANCH-NAME]`: The `-b` allows the creation of a new branch. `co` can be used in place of `checkout`.

###### Connecting Local & Remote Repos:
  * `git remote add origin [LINK TO NEW GITHUB REPO]`: Connect a remote repo to your local repo.

###### Heroku:
  * `heroku create`: Creates a Heroku repo for you to use.
  * `git push heroku master`: uploads the MASTER branch to Heroku to be deployed live.
  * `https://ancient-retreat-50009.herokuapp.com/`: Once done the link to the live site should be similar to this.
  * `heroku logs`: Shows the console activity (and errors) on the Heroku web server.

###### ------------------------------------------------------------------
#### Rails Generate Commands:
  * [RoR Generation Guide.](http://guides.rubyonrails.org/command_line.html#rails-generate)
  * `rails g` can be used as a shortcut command.

###### Controller Generation:
  * [Personal Preference Controller Generation Guide](https://www.sitepoint.com/building-your-first-rails-application-views-and-controllers/)
  * `rails g controller [Name of object in CamelCase] [Routes to include with options]`
  * `rails g controller StaticPages home help`
  *

###### Model Generation:
  * [Personal Preference Model Generation Guide 1](https://railsguides.net/advanced-rails-model-generators/)
  * [Personal Preference Model Generation Guide 2](https://richonrails.com/articles/rails-model-generator-shortcuts)
  * `rails g model [model name] [field:fieldtype]`
  * `rails g controller user username email:string age:integer`
  * Each `field` may be assigned a field type. This defaults to `(field):string`.
  * Available field types are: `integer` `primary_key` `decimal` `float` `boolean` `binary` `string` `text` `date` `time` `datetime` `timestamp`.

###### View Generation:
  * `filler`: Personal Preference **View** Generation Guide.
  * `rails g controller [Name of object in CamelCase] [Routes to include with options]`
  * `rails g controller StaticPages home help`
  *

* `Blank`: Filler

###### ------------------------------------------------------------------
#### Creation Steps & Tutorial Links:
* [Tutorial: 3.1 "Sample App Setup"](https://www.railstutorial.org/book/static_pages#sec-sample_app_setup)
* "Github" may be used in place of "Bitbucket".
* "Postgresql" may be used instead of "SQLite3" for test databases.

* [Tutorial: 3.2 "Static Pages"](https://www.railstutorial.org/book/static_pages#sec-static_pages)
*
*
*
