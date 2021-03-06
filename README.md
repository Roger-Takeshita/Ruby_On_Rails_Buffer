<h1 id='table-of-contents'>TABLE OF CONTENTS</h1>

- [SCHEDULE TWEETS - BUFFER CLONE](#schedule-tweets---buffer-clone)
  - [Links](#links)
  - [Start New Project](#start-new-project)
    - [MVC Structure](#mvc-structure)
      - [Routes](#routes)
      - [Model](#model)
      - [Views](#views)
      - [Controllers](#controllers)
    - [About Page](#about-page)
      - [About Route](#about-route)
      - [About Controller](#about-controller)
      - [About View](#about-view)
    - [Main Page/Root](#main-pageroot)
      - [Main Route](#main-route)
      - [Main Controller](#main-controller)
      - [Main View](#main-view)
    - [Bootstrap](#bootstrap)
    - [Rendering Partials](#rendering-partials)
    - [Rails Helpers](#rails-helpers)
      - [link_to](#link_to)
    - [Flash Messages](#flash-messages)
      - [Flash Partial](#flash-partial)
    - [User Authentication](#user-authentication)
      - [Generate User Model](#generate-user-model)
      - [User Model](#user-model)
      - [Add User Using Rails Console](#add-user-using-rails-console)
    - [Validation](#validation)
      - [Validate Format And Message](#validate-format-and-message)
    - [Sign Up Page](#sign-up-page)
      - [Registration Route](#registration-route)
      - [Registration Controller - New Action](#registration-controller---new-action)
      - [Registration View](#registration-view)
        - [FORM](#form)
      - [Registration Controller - Create Action](#registration-controller---create-action)
    - [gitSession Cookie](#gitsession-cookie)
    - [Logout - Session Controllers](#logout---session-controllers)
      - [Session Route](#session-route)
      - [Session Controller](#session-controller)
    - [Sign In](#sign-in)
      - [Sign In Route](#sign-in-route)
      - [Sign In Controller](#sign-in-controller)
      - [Sign In View](#sign-in-view)
    - [Get Current User Anywhere - ApplicationController](#get-current-user-anywhere---applicationcontroller)
      - [Current Model](#current-model)
      - [Update Views](#update-views)
      - [Update Navbar](#update-navbar)
    - [Update Password](#update-password)
      - [Password Route](#password-route)
      - [Application Controller](#application-controller)
      - [Password Controller](#password-controller)
      - [Password Edit View](#password-edit-view)
      - [Update Navbar](#update-navbar-1)
    - [Reset Password](#reset-password)
      - [Password Reset Route](#password-reset-route)
      - [Password Reset Controller](#password-reset-controller)
        - [ACTIONMAILER](#actionmailer)
      - [Password Reset View](#password-reset-view)
      - [Update Sign In Form](#update-sign-in-form)
      - [Password Mailer](#password-mailer)
        - [RESET TOKEN](#reset-token)
        - [ROUTES](#routes-1)
        - [HTML CONTENT](#html-content)
        - [TEXT CONTENT](#text-content)
        - [DEVELOPMENT ENVIRONMENT](#development-environment)
        - [LOGS](#logs)
        - [RESET PASSWORD CONTROLLER](#reset-password-controller)
        - [RESET PASSWORD VIEW](#reset-password-view)
    - [Generate Environment Variables](#generate-environment-variables)
    - [Omniauth-Twitter](#omniauth-twitter)
      - [Initializers - Middleware](#initializers---middleware)
      - [OmniAuth Routes (Special Routes)](#omniauth-routes-special-routes)
      - [Index Page](#index-page)
      - [Twitter Callback Route](#twitter-callback-route)
      - [OmniAuth Controller](#omniauth-controller)
    - [Twitter Model](#twitter-model)
      - [Update OmniAuth Controller](#update-omniauth-controller)
    - [Twitter Accounts Page](#twitter-accounts-page)
      - [Twitter Accounts Routes - Resources](#twitter-accounts-routes---resources)
      - [Twitter Accounts Controller](#twitter-accounts-controller)
      - [Twitter Accounts View](#twitter-accounts-view)
      - [Update OmniAuth Controller](#update-omniauth-controller-1)
    - [before_action To Set Common Variables](#before_action-to-set-common-variables)
    - [Tweets](#tweets)
      - [Tweets Model](#tweets-model)
        - [User Model](#user-model-1)
        - [Twitter Account Model](#twitter-account-model)
      - [Tweets Routes](#tweets-routes)
      - [Tweets Controller](#tweets-controller)
      - [Tweets Index](#tweets-index)
      - [Update Navbar](#update-navbar-2)
      - [Tweets Model](#tweets-model-1)
      - [Tweets New](#tweets-new)

# SCHEDULE TWEETS - BUFFER CLONE

## Links

[Go Back to Contents](#table-of-contents)

- [Go Rails - Buffer Clone](https://gorails.com/episodes/rails-for-beginners-part-1-installing-ruby-on-rails?autoplay=1)
- [Bootstrap5](https://getbootstrap.com/docs/5.0/getting-started/introduction/)
- [Global ID Rails](https://github.com/rails/globalid)

## Start New Project

[Go Back to Contents](#table-of-contents)

```Bash
  rails new scheduled_tweets
```

### MVC Structure

GET /about HTTP/1.1
Host: 127.0.0.1

#### Routes

[Go Back to Contents](#table-of-contents)

Matches for the URL that is requested

GET for `/about`

I see you requested `/about`, we'll give that to the `AboutController` to handle

#### Model

[Go Back to Contents](#table-of-contents)

Database wrapper

User

- query for record
- wrap individual records

#### Views

[Go Back to Contents](#table-of-contents)

Your response body content

- HTML
- CSV
- PDF
- XML

This is what gets sent back to the browser and displayed

#### Controllers

[Go Back to Contents](#table-of-contents)

Decide how to process a request and define a response

### About Page

#### About Route

[Go Back to Contents](#table-of-contents)

First thing we need to do is to config our `routes.rb`

In `config/routes.rb`

```Ruby
  Rails.application.routes.draw do
    # GET /about
    get 'about', to: 'about#index'
  end
```

```Ruby
  get 'about', to: 'about#index'
  #     |             |     └── action (function)
  #     |             └── about controller
  #     └── /about route

  # this route will look for a controller about_controller (rails convention)
```

#### About Controller

[Go Back to Contents](#table-of-contents)

Create the `about` controller following rails convention

```Bash
  touch app/controllers/about_controller.rb
```

In `app/controllers/about_controller.rb`

- We need the define the `about` controller, but as a **Ruby Class** (Title case without underscores) and we need to inherit from `ApplicationController`.

  - We need to inherit from `ApplicationController` so we can have access to all functionality from rails.
  - Inside our class we can define a new `action/function` **index**. Right now this can be an empty `action`, because we are inheriting from the `ApplicationController` and if don't have anything defined inside our `action/function`, the `ApplicationController` has a default action to handle this case which is to serve an HTML file.

  ```Ruby
    class AboutController < ApplicationController
      def index
      end
    end
  ```

#### About View

[Go Back to Contents](#table-of-contents)

Create the `about` html file, by convention we rails will look for a folder called `about` in our `views` folder. And inside this folder for a file called `index.html.erb`

```Bash
  touch app/views/about/index.html.erb
```

In `app/views/about/index.html.erb`

- Add a simple `h1` tag

  ```HTML
    <h1>About Us</h1>
  ```

  ![](https://i.imgur.com/fhy0qeU.png)

We can defile only the part of the app that we want to create, later this code will be injected in our layout (`app/views/layouts/application.html.erb`).

The `layout` is a wrapper that will define all our `StyleSheets`, `JavaScripts`, `favicon`... All that are defined inside our `layout`.

The `layout` will `yield` and replace with our `view` content using erb/ruby tags.

```HTML
  <!DOCTYPE html>
  <html>
    <head>
      <title>ScheduledTweets</title>
      <meta name="viewport" content="width=device-width,initial-scale=1">
      <%= csrf_meta_tags %>
      <%= csp_meta_tag %>

      <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
      <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
    </head>

    <body>
      <%= yield %>
    </body>
  </html>
```

### Main Page/Root

#### Main Route

[Go Back to Contents](#table-of-contents)

For all our Rails app, we need to define the `root` controller.

In development mode, rails serve us with the default view that only works for development. It will throw an error if we deploy the production version without defining the `root route`

![](https://i.imgur.com/KiBeEjn.png)

In `config/routes.rb`

- We can define the main root as:

  ```Ruby
    get "", to: 'main#index'
  ```

- But because the root is special, we can define as:

  ```Ruby
    root to: 'main#index'
  ```

```Ruby
  Rails.application.routes.draw do
    # GEt /about
    get 'about', to: 'about#index'

    # get "", to: 'main#index'
    root to: 'main#index'
  end

```

#### Main Controller

[Go Back to Contents](#table-of-contents)

Create the `main` controller following rails convention

```Bash
  touch app/controllers/main_controller.rb
```

In `app/controllers/main_controller.rb`

```Ruby
  class MainController < ApplicationController
    def index
    end
  end
```

#### Main View

[Go Back to Contents](#table-of-contents)

Create the `index.html.erb`

In `app/views/main/index.html.erb`

- Add a simple message

  ```Html
    <h1>Welcome to Scheduled Tweets</h1>
  ```

  ![](https://i.imgur.com/lf5FyrS.png)

### Bootstrap

[Go Back to Contents](#table-of-contents)

- [Bootstrap](https://getbootstrap.com/docs/5.0/getting-started/introduction/)

  ```HTML
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
  ```

In `app/views/layouts/application.html.erb`

```HTML
  <!DOCTYPE html>
  <html>
      <head>
          <title>ScheduledTweets</title>
          <meta name="viewport" content="width=device-width,initial-scale=1">
          <%= csrf_meta_tags %>
          <%= csp_meta_tag %>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
          <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
          <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
      </head>
      <body>
          <%= yield %>
      </body>
  </html>
```

![](https://i.imgur.com/TBj3HIg.png)

In `app/views/main/index.html.erb`

```HTML
  <div class="d-flex align-items-center justify-content-center">
      <h1>Welcome to Scheduled Tweets</h1>
  </div>
```

![](https://i.imgur.com/VaobuO9.png)

### Rendering Partials

[Go Back to Contents](#table-of-contents)

Partial is parts of views that we can render inside our view. In this case the `application.html.erb` layout (base template)

In `app/views/shared/_navbar.html.erb`

- Paste the navbar that we copied from bootstrap website

  ```HTML
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="/">Navbar</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">About</a>
                    </li>
                </li>
            </ul>
        </div>
    </div>
    </nav>
  ```

In `app/views/layouts/application.html.erb`

- Inside our body, we can render our partial `navbar`
- And we can wrap our view content with a `container` class

  ```HTML
    <%= render partial: 'shared/navbar' %>
    <div class="container">
        <%= yield %>
    </div>
  ```

### Rails Helpers

#### link_to

[Go Back to Contents](#table-of-contents)

We can replace our hard coded `/about` with one that is more dynamic that will help us to change the route (if we want to) more easily in several pages

In `app/views/shared/_navbar.html.erb`

```HTML
  <!-- From -->
  <a class="nav-link" href="/about">About</a>

  <!-- To -->
  <%= link_to "About", about_path, class: "nav-link" %>
  <!--           |          |                 └── css class   -->
  <!--           |          └── href (/about)                 -->
  <!--           └── content (text)                           -->
```

- the `about_path` will generate `/about`

  ![](https://i.imgur.com/mNw8sOp.png)

- Update our navbar to use the `link_to` helper and `url helper`

  ```HTML
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <%= link_to "Navbar", root_path, class: "navbar-brand" %>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <%= link_to "Home", root_path, class: "nav-link active" %>
                    </li>
                    <li class="nav-item">
                        <%= link_to "About", about_path, class: "nav-link" %>
                    </li>
                </li>
            </ul>
        </div>
    </div>
    </nav>
  ```

Once we update our `navbar` partial, we can update our route to map to a custom route

In `config/routes.rb`

```Ruby
  # Old way (hard coded)
  get 'about', to: 'about#index'

  # custom route `about-us` using alias
  get 'about-us', to: 'about#index', as: :about
  #        |             |     |           └── alias
  #        |             |     └── action (function)
  #        |             └── about controller
  #        └── /about-us route (custom route)
```

### Flash Messages

[Go Back to Contents](#table-of-contents)

The `flash` method is inherit from `ApplicationController`, it's a feature of `controllers` and `views`.

We use `flash` as a **hash** (key/value pairs) in `Ruby`, and this is going to store the `value` into our **flash object**

The **flash object** can be assigned in the `controllers` but we need to print them out somewhere in our `views`

```Ruby
  flash[:notice] = "Logged in successfully"
  #  |     |                 └── value/message
  #  |     └── key/variable
  #  └── method
```

```Ruby
  flash.now[:notice] = "Logged in successfully"
  #  |   |      |                 └── value/message
  #  |   |      └── key/variable
  #  |   └── only display the flash message on the current page
  #  └── method
```

- when we add the `.now`, this tells Rails to display only for the current `page/view/controller`, it won't persist if we change to another page

Because the **flash object** is shared across our entire rails app, we are going to create a **shared/partial** for it

#### Flash Partial

[Go Back to Contents](#table-of-contents)

Create a new partial `_flash.html.erb`

```Bash
  touch app/views/shared/_flash.html.erb
```

In `app/views/shared/_flash.html.erb`

```HTML
  <%= flash[:notice] %>
  <%= flash[:alert] %>
```

In `app/views/layouts/application.html.erb`

- We we can add a new partial in our `<body>` tag

```HTML
  <body>
      <%= render partial: 'shared/navbar' %>
      <div class="container">
          <%= render partial: 'shared/flash' %>
          <%= yield %>
      </div>
  </body>
```

### User Authentication

#### Generate User Model

[Go Back to Contents](#table-of-contents)

We are going to create a `user` model to store `email` and `password` (digest - hashed)

- `rails g` = rails generate
- `model User` = `User` (Title case)
- `email` = type string
- `password` = hashed password

```Bash
  rails g model User email:string password_digest:string
  # invoke  active_record
  # create    db/migrate/20210228170124_create_users.rb
  # create    app/models/user.rb
  # invoke    test_unit
  # create      test/models/user_test.rb
  # create      test/fixtures/users.yml

  rails db:migrate
  # == 20210228170124 CreateUsers: migrating ======================================
  # -- create_table(:users)
  #    -> 0.0021s
  # == 20210228170124 CreateUsers: migrated (0.0021s) =============================
```

#### User Model

[Go Back to Contents](#table-of-contents)

In `app/models/user.rb`

- We need to add `has_secure_password`, the `has_secure_password` will use our `password_digest` to add a virtual `password` and `password confirmation` attributes to our user. It uses **bcrypt** to authenticate/save the use

  | attribute             | type   | description      |
  | --------------------- | ------ | ---------------- |
  | email                 | string | column in the db |
  | password_digest       | string | column in the db |
  |                       |        |                  |
  | password              | string | virtual          |
  | password_confirmation | string | virtual          |

  - we are never going to interact directly with `password_digest`, we'll always use the `password` and `password_confirmation`

  - We need to install **bcrypt** gem for that

```Ruby
  class User < ApplicationRecord
    has_secure_password
  end

```

#### Add User Using Rails Console

After installing **bcrypt**, we can create our first user using the `rails console`

```Bash
  rails c
  # Running via Spring preloader in process 8223
  # Loading development environment (Rails 6.1.3)

  User
  # => User (call 'User.connection' to establish a connection)

  User.all
  #   (0.4ms)  SELECT sqlite_version(*)
  #  User Load (0.1ms)  SELECT "users".* FROM "users" /* loading for inspect */ LIMIT ?  [["LIMIT", 11]]

  # => #<ActiveRecord::Relation []>

  User.create({email: "roger@email.com", password: "123", password_confirmation: "123"})
  # (0.5ms)  SELECT sqlite_version(*)
  #  TRANSACTION (0.1ms)  begin transaction
  #  User Create (0.3ms)  INSERT INTO "users" ("email", "password_digest", "created_at", "updated_at") VALUES (?, ?, ?, ?)  [["email", "roger@email.com"], ["password_digest", "$2a$12$W0lFDMCW.VXzvTAigQpBIuOv2MhomwPRcnjWGzcStNOKQqIwexB7e"], ["created_at", "2021-02-28 17:27:33.442553"], ["updated_at", "2021-02-28 17:27:33.442553"]]
  #  TRANSACTION (1.6ms)  commit transaction

  # => #<User id: 1, email: "roger@email.com", password_digest: [FILTERED], created_at: "2021-02-28 17:27:33.442553000 +0000", updated_at: "2021-02-28 17:27:33.442553000 +0000">

  User.first
  # User Load (0.2ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" ASC LIMIT ?  [["LIMIT", 1]]

  # => #<User id: 1, email: "roger@email.com", password_digest: [FILTERED], created_at: "2021-02-28 17:27:33.442553000 +0000", updated_at: "2021-02-28 17:27:33.442553000 +0000">
```

### Validation

[Go Back to Contents](#table-of-contents)

In `app/models/user.rb`

- We can use rails validation to check if a field is `presence`

  ```Ruby
    class User < ApplicationRecord
      has_secure_password
      validates :email, presence: true
    end
  ```

  - The `validates :email, presence: true` will check if an email is present before saving into the database.

Another way to validate the email, is by updating our migration file to require an email

In `db/migrate/20210228170124_create_users.rb`

- Add `, null: false` to our email field

  ```Ruby
    class CreateUsers < ActiveRecord::Migration[6.1]
      def change
        create_table :users do |t|
          t.string :email, null: false
          t.string :password_digest

          t.timestamps
        end
      end
    end
  ```

  - Because we changed our migration file, we need to undo our modification and then migrate again to apply the modifications to our database.

  ```Bash
    rails db:rollback
    # == 20210228170124 CreateUsers: reverting ======================================
    # -- drop_table(:users)
    #    -> 0.0018s
    # == 20210228170124

    rails db:migrate
    # == 20210228170124 CreateUsers: migrating ======================================
    # -- create_table(:users)
    #    -> 0.0016s
    # == 20210228170124 CreateUsers: migrated (0.0018s) ============================= CreateUsers: reverted (0.0121s) =============================

    # an alternative we could use a single command to do that
    rails db:migrate:redo
    # == 20210228170124 CreateUsers: reverting ======================================
    # -- drop_table(:users)
    #    -> 0.0016s
    # == 20210228170124 CreateUsers: reverted (0.0031s) =============================

    # == 20210228170124 CreateUsers: migrating ======================================
    # -- create_table(:users)
    #    -> 0.0015s
    # == 20210228170124 CreateUsers: migrated (0.0016s) =============================
  ```

On `Rails Console`, if we try to save an user without email we will get an User of `id: nil`, this means that this user wasn't saved in the database.

```Bash
  rails c

  User.create({password: "123", password_confirmation: "123"})
  # (0.4ms)  SELECT sqlite_version(*)
  # => #<User id: nil, email: nil, password_digest: [FILTERED], created_at: nil, updated_at: nil>
```

#### Validate Format And Message

[Go Back to Contents](#table-of-contents)

In `app/models/user.rb`

- We can add a regex to validate the format

  ```Ruby
    class User < ApplicationRecord
      has_secure_password
      validates :email, presence: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address" }
    end
  ```

  ```Bash
    rails c

    User.create({email: "A", password: "123", password_confirmation: "123"})
    #   (0.4ms)  SELECT sqlite_version(*)
    # => #<User id: nil, email: "A", password_digest: [FILTERED], created_at: nil, updated_at: nil>
  ```

### Sign Up Page

#### Registration Route

[Go Back to Contents](#table-of-contents)

In `config/routes.rb`

- Add the `sign_up` route and map to `registrations` controller > `new` action/function

  ```Ruby
    Rails.application.routes.draw do
      # GEt /about
      # get 'about', to: 'about#index'
      get 'about-us', to: 'about#index', as: :about
      get 'sign_up', to: 'registrations#new'
      root to: 'main#index'
    end
  ```

#### Registration Controller - New Action

[Go Back to Contents](#table-of-contents)

Create a the `registration_controller.rb`

```Bash
  touch app/controllers/registrations_controller.rb
```

In `app/controllers/registrations_controller.rb`

- We can create a new instance variable `@user`, when we create an **instance variable** this variable is available in our **views**

```Ruby
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end
  end
```

#### Registration View

[Go Back to Contents](#table-of-contents)

Crate the `registrations` > `new` view

```Bash
  touch app/views/registrations/new.html.erb
```

In `app/views/registrations/new.html.erb`

- We can use the `@user` instance to print on our view

  ```Ruby
    <h1>Sign Up</h1>
    <%= @user %>
  ```

##### FORM

[Go Back to Contents](#table-of-contents)

To work with forms we need to update our `routes.rb`

In `config/routes.rb`

- Add a `POST` route for `sign_up`

  ```Ruby
    Rails.application.routes.draw do
      get 'about-us', to: 'about#index', as: :about
      get 'sign_up', to: 'registrations#new'
      post 'sign_up', to: 'registrations#create'

      root to: 'main#index'
    end
  ```

In `app/views/registrations/new.html.erb`

- In rails we can generate a form using an instance variable/object to create all the necessary fields

  ```HTML
    <h1>Sign Up</h1>
    <%= form_with model: @user, url: sign_up_path do |form| %>
        <%= form.text_field :email %>
        <%= form.password_field :password %>
        <%= form.password_field :password_confirmation %>
    <% end %>
  ```

  ```Ruby
    form_with model: @user, url: sign_up_path do |form|
    #    |      |      |           └── /sign_up  (url)
    #    |      |      └── instance variable (User model)
    #    |      └── model
    #    └── create a form with
  ```

  ![](https://i.imgur.com/uwdjqUB.png)

  - 1. url
  - 2. type of request
  - 3. token (to validate the form, so our serve knows that is coming from our app)

- Display errors

  - We can add an `if statement` to check for errors

    ```HTML
      <% if @user.errors.any? %>
          <div class="alert alert-danger">
              <% @user.errors.full_messages.each do |message| %>
                  <div>
                      <%= message %>
                  </div>
              <% end %>
          </div>
      <% end %>
    ```

    ![](https://i.imgur.com/Xqw7Rx8.png)

```HTML
  <h1>Sign Up</h1>
  <%= form_with model: @user, url: sign_up_path do |form| %>
      <% if @user.errors.any? %>
          <div class="alert alert-danger">
              <% @user.errors.full_messages.each do |message| %>
                  <div>
                      <%= message %>
                  </div>
              <% end %>
          </div>
      <% end %>
      <div class="mb-3">
          <%= form.label :email%>
          <%= form.text_field :email, class: "form-control", placeholder: "your_email@email.com"%>
      </div>
      <div class="mb-3">
          <%= form.label :password%>
          <%= form.password_field :password, class: "form-control", placeholder: "password" %>
      </div>
      <div class="mb-3">
          <%= form.label :password_confirmation%>
          <%= form.password_field :password_confirmation, class: "form-control", placeholder: "password" %>
      </div>
      <div class="mb-3">
          <%= form.submit "Sign Up", class: "btn btn-primary"%>
      </div>
  <% end %>
```

#### Registration Controller - Create Action

[Go Back to Contents](#table-of-contents)

We can get all form information that we submitted using the `params`, this could be from the `query params` or from our `form` that has been added to the `params`

In `app/controllers/registrations_controller.rb`

- As an example we could send back to the user the form that he just submitted

  - In this case we are pulling out all the data that we added to `:user` param

  ```Ruby
    class RegistrationsController < ApplicationController
      def new
        @user = User.new
      end

      def create
        params
        # {"authenticity_token"=>"[FILTERED]", "user"=>{"email"=>"test", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}, "commit"=>"Sign Up"}
        params[:user]
        # "user"=>{"email"=>"test", "password"=>"[FILTERED]", "password_confirmation"=>"[FILTERED]"}
        render plain: params[:user]
      end
    end
  ```

  ![](https://i.imgur.com/3IWWgK2.png)

- Now we can create our `create` action using `params`

  - We could simply define as:

    ```Ruby
      def create
        @user = User.new(params[:user])
      end
    ```

    - but this is bad, because the user can inject other things such as an `admin` field as `true` (if you had one) and rail would save this new user as an admin

  - To fix that, we can create a **private** method to allow only certain fields

    ```Ruby
      private

      def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
        #           |            └── permit only these fields
        #           └── require a user (if not rails will throw an error)
      end
    ```

  - Then we could check if the user was successfully save in our database `@user.save`
    - If `yes`, redirect to the `root_path` and display the `flash[:notice]` msg
    - If `no`, redirect to the `:new` (`/sign_up` page)

```Ruby
  class RegistrationsController < ApplicationController
    def new
      @user = User.new
    end

    def create
      # @user = User.new(params[:user])
      @user = User.new(user_params)
      if @user.save
        redirect_to root_path, notice: 'Successfully create account'
      else
        render :new
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
```

### gitSession Cookie

[Go Back to Contents](#table-of-contents)

To sign in we are going to use **session cookie** is stored in the user's browser. The **session cookie** is encrypted and no one can read it or modify.

In `app/controllers/registrations_controller.rb`

- We are going to update the `create` action to store the `@user.id` in the **session cookie**

  ```Ruby
    def create
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        redirect_to root_path, notice: 'Successfully create account'
      else
        render :new
      end
    end
  ```

In `app/controllers/main_controller.rb`

- In our `index` function, we check if there is a cookie before querying the database.

  ```Ruby
    class MainController < ApplicationController
      def index
        if session[:user_id]
          @user = User.find(session[:user_id])
        end
      end
    end
  ```

  - If we use `User.find()`, and rails doesn't find a user, then I will throw an error (break the app).
  - A work around to this problem we can use `User.find_by(id: session[:user_id])` = `SELECT * FROM users WHERE id = user_id;`

    ```Ruby
      class MainController < ApplicationController
        def index
          if session[:user_id]
            @user = User.find_by(session[:user_id])
          end
        end
      end

      # Shorter version
      class MainController < ApplicationController
        def index
          @user = User.find_by(id: session[:user_id]) if session[:user_id]
        end
      end
    ```

In `app/views/main/index.html.erb`

- Then if we have a user, we can go to our `main` index

  ```HTML
    <div class="d-flex align-items-center justify-content-center">
        <h1>Welcome to Scheduled Tweets</h1>
        <% if @user %>
            Logged in as: <%= @user.email %>
        <% end %>
    </div>
  ```

We can check our cookie under `Application Tab`

![](https://i.imgur.com/vd63ic4.png)

- As we can see it's marked as `HttpOnly` this means that JavaScript cannot access it

### Logout - Session Controllers

[Go Back to Contents](#table-of-contents)

To logout from our app, we are going to create a new controller called `session_controller.rb`

#### Session Route

[Go Back to Contents](#table-of-contents)

Add a new route that maps a `DELETE` request to `sessions > destroy`

```Ruby
  Rails.application.routes.draw do
    get 'about-us', to: 'about#index', as: :about
    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'
    delete 'logout', to: 'sessions#destroy'

    root to: 'main#index'
  end
```

#### Session Controller

[Go Back to Contents](#table-of-contents)

Create a new controller:

```Bash
  touch app/controllers/sessions_controller.rb
```

In `app/controllers/sessions_controller.rb`

- Basically our `destroy` action will set the current `session[:user_id]` to `nil` then it will redirect to the home page.

  ```Ruby
    class SessionsController < ApplicationController
      def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out'
      end
    end
  ```

In `app/views/main/index.html.erb`

- We can logout using two ways:

  - link_to
  - button_to

- Both will work, but using `button_to` is the more appropriate way to logout, because `button_to` creates a hidden form that sends a `DELETE` method

  ```HTML
    <div class="d-flex align-items-center justify-content-center">
        <h1>Welcome to Scheduled Tweets</h1>
    </div>
    <% if @user %>
        Logged in as: <%= @user.email %>
        <%= link_to "Logout", logout_path, method: :delete %>
        <%= button_to "Logout", logout_path, method: :delete %>
    <% end %>
  ```

### Sign In

#### Sign In Route

[Go Back to Contents](#table-of-contents)

Create two new routes:

- One route to display the `sign in` page/view
- The other one to submit the `sign in` form

In `config/routes.rb`

```Ruby
  Rails.application.routes.draw do
    get 'about-us', to: 'about#index', as: :about

    get 'sign_up', to: 'registrations#new'
    post 'sign_up', to: 'registrations#create'

    get 'sign_in', to: 'sessions#new'
    post 'sign_in', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    root to: 'main#index'
  end
```

#### Sign In Controller

[Go Back to Contents](#table-of-contents)

In `app/controllers/sessions_controller.rb`

- Create the `new` and `create` actions

  - Because `new` action is only used to render the `new.html.erb` we don't need to pass anything to the view. We just need to create the form in our `new.html.erb`
  - The `create` action is used to validate the user
    - First we check if there is any user with the current email
    - Then we use the `authenticate` method to validate the user password (compare the hashed password with the hashed password in our database)
      - Just like the `password` and `password confirmation`, `password_digest` gives us another method to `authenticate` the user
      - If the passwords match, then we assign the `user.id` to our session cookie and redirect to the main page
      - if the passwords don't match, then we display a `flash` message and redirect again to the `new.html.erb` page

  ```Ruby
    class SessionsController < ApplicationController
      def new
      end

      def create
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
          session[:user_id]=user.id
          redirect_to root_path, notice: 'Logged in successfully'
        else
          flash[:alert] = 'Invalid email or password'
          render :new
        end
      end

      def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out'
      end
    end
  ```

#### Sign In View

[Go Back to Contents](#table-of-contents)

Create a new folder and file

```Bash
  touch app/views/sessions/new.html.erb
```

In `app/views/sessions/new.html.erb`

```HTML
  <h1>Sign In</h1>
  <%= form_with url: sign_in_path do |form| %>
      <div class="mb-3">
          <%= form.label :email%>
          <%= form.text_field :email, class: "form-control", placeholder: "your_email@email.com"%>
      </div>
      <div class="mb-3">
          <%= form.label :password%>
          <%= form.password_field :password, class: "form-control", placeholder: "password" %>
      </div>
      <div class="mb-3">
          <%= form.submit "Sign In", class: "btn btn-primary"%>
      </div>
  <% end%>
```

### Get Current User Anywhere - ApplicationController

[Go Back to Contents](#table-of-contents)

To use the current authenticated user in any controller/view, we just need to remove from the `main_controller` and add to our `application_controller`, because all the controllers inherit from the `application_controller`

In `app/controllers/main_controller.rb`

```Ruby
  class MainController < ApplicationController
  end
```

In `app/controllers/application_controller.rb`

- We can create a new method called `set_current_user` and set the `Current.user` (that we are going to create) to our query, instead of our instance variable `@user`
- Before any action we are going to run `set_current_user`

  ```Ruby
    class ApplicationController < ActionController::Base
      before_action :set_current_user

      def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
      end
    end
  ```

#### Current Model

[Go Back to Contents](#table-of-contents)

Create a new model called `current`

```Bash
  touch app/models/current.rb
```

Our `Current` class inherits from `ActiveSupport::CurrentAttributes`, and it will have only one `attribute` (`:user`)

The `ActiveSupport` helps us manage the `Current.user` from other sessions, this way we can have multiple `Current.user` without clashing/overriding other session user.

```Ruby
  class Current < ActiveSupport::CurrentAttributes
    attribute :user
  end
```

#### Update Views

[Go Back to Contents](#table-of-contents)

Now that we have configured the `Current.user`, we can refactor our views to use the `Current.user` instead of the instance `@user`

In `app/views/main/index.html.erb`

```HTML
  <div class="d-flex align-items-center justify-content-center">
      <h1>Welcome to Scheduled Tweets</h1>
  </div>
  <% if Current.user %>
      Logged in as: <%= Current.user.email %>
      <%= button_to "Logout", logout_path, method: :delete %>
  <% end %>
```

#### Update Navbar

[Go Back to Contents](#table-of-contents)

Update our navbar to display the current user and add `sign up` and `login` buttons

In `app/views/shared/_navbar.html.erb`

```HTML
  <nav class="navbar navbar-expand-lg navbar-light bg-light">
      <div class="container-fluid">
          <%= link_to "Navbar", root_path, class: "navbar-brand" %>
          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
          </button>
          <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                  <li class="nav-item">
                      <%= link_to "Home", root_path, class: "nav-link active" %>
                  </li>
                  <li class="nav-item">
                      <%= link_to "About", about_path, class: "nav-link" %>
                  </li>
              </li>
          </ul>
          <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
              <% if Current.user %>
                  <li class="nav-item">
                      <span class="navbar-text">
                          <%= Current.user.email %>
                      </span>
                  </li>
                  <li class="nav-item">
                      <%= button_to "Logout", logout_path, method: :delete, class: "btn btn-outline-secondary" %>
                  </li>
              <% else %>
                  <li class="nav-item">
                      <%= link_to "Sign Up", sign_up_path, class: "nav-link" %>
                  </li>
                  <li class="nav-item">
                      <%= link_to "Login", sign_in_path, class: "nav-link"%>
                  </li>
              <% end %>
          </ul>
      </div>
  </div>
  </nav>
```

### Update Password

#### Password Route

[Go Back to Contents](#table-of-contents)

Add two new routes to our `routes.rb`

In `config/routes.rb`

- give a new name to our path

  ```Ruby
    get 'password', to: 'passwords#edit', as: :edit_password
    patch 'password', to: 'passwords#update'
  ```

#### Application Controller

[Go Back to Contents](#table-of-contents)

Before we started coding the password controller, we need to define another "global" method `require_user_logged_in` so we can use this method before each private route.

In `app/controllers/application_controller.rb`

- Add the `require_user_logged_in` to check if the `Current.user` is `nil`. If `true`, redirect to `sign_in` page with an alert message

  ```Ruby
    class ApplicationController < ActionController::Base
      before_action :set_current_user

      def set_current_user
        Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
      end

      def require_user_logged_in
        return unless Current.user.nil?

        redirect_to sign_in_path,
                    alert: 'You must be signed in to do that.'
      end
    end
  ```

#### Password Controller

[Go Back to Contents](#table-of-contents)

Create a new controller

```Bash
  touch app/controllers/passwords_controller.rb
```

In `app/controllers/passwords_controller.rb`

- Create a private helper to require a `:user` andn only allow for `:password` and `:password_confirmation` to be edited

  ```Ruby
    class PasswordsController < ApplicationController
      before_action :require_user_logged_in

      def edit
      end

      def update
        if Current.user.update(password_params)
          redirect_to root_path, notice: 'Password updated successfully!'
        else
          render :edit
        end
      end

      private

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end
    end
  ```

#### Password Edit View

[Go Back to Contents](#table-of-contents)

Create a new view

```Bash
  touch app/views/passwords/edit.html.erb
```

In `app/views/passwords/edit.html.erb`

- Create a new form similar to the `sign up` form

  ```HTML
    <h1>Edit Password</h1>
    <%= form_with model: @user, url: edit_password_path do |form| %>
        <% if @user.errors.any? %>
            <div class="alert alert-danger">
                <% @user.errors.full_messages.each do |message| %>
                    <div>
                        <%= message %>
                    </div>
                <% end %>
            </div>
        <% end %>
        <div class="mb-3">
            <%= form.label :password%>
            <%= form.password_field :password, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.label :password_confirmation%>
            <%= form.password_field :password_confirmation, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.submit "Udpate Password", class: "btn btn-primary"%>
        </div>
    <% end %>
  ```

#### Update Navbar

[Go Back to Contents](#table-of-contents)

In `app/views/shared/_navbar.html.erb`

- Update our navbar to add a link to `edit_password` path

  ```HTML
    <li class="nav-item">
        <%= link_to Current.user.email, edit_password_path, class: "nav-link" %>
    </li>
  ```

### Reset Password

#### Password Reset Route

[Go Back to Contents](#table-of-contents)

Create two new routes to `display` (`GET`) the form, and another route to `submit` (`POST`) the form.

In `config/routes.rb`

```Ruby
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
```

#### Password Reset Controller

[Go Back to Contents](#table-of-contents)

Create a new controller

```Bash
  touch app/controllers/password_resets_controller.rb
```

In `app/controllers/password_resets_controller.rb`

- Create `new` action to render our form (`new.html.erb`)
- Create `create` action to receive the form

  - Call our `PasswordMailer`, set some params (`user:`) and call the `reset` method to send a reset email. Chain a `deliver_later` method to run in the background (`async`)
    - Another option would be `deliver_now`, but this will make our app a little slower

```Ruby
  class PasswordResetsController < ApplicationController
    def new
    end

    def create
      @user = User.find_by(email: params[:email])
      return unless @user.present?

      PasswordMailer.with(user: @user).reset.deliver_later
      redirect_to root_path,
                  notice: 'If an account with that email was found, we have sent a link to reset your password.'
    end
  end
```

##### ACTIONMAILER

[Go Back to Contents](#table-of-contents)

We are going to use the CLI to create a mailer (a builtin rails mailer)

```Bash
  rails g mailer Password reset
  #     |    |      |       └── email
  #     |    |      └── Password Mailer
  #     |    └── mailer
  #     └── generator

  # Running via Spring preloader in process 12749
  #     create  app/mailers/password_mailer.rb
  #     invoke  erb
  #     create    app/views/password_mailer
  #     create    app/views/password_mailer/reset.text.erb
  #     create    app/views/password_mailer/reset.html.erb
  #     invoke  test_unit
  #     create    test/mailers/password_mailer_test.rb
  #     create    test/mailers/previews/password_mailer_preview.rb
```

- As we can see rails created `app/mailers/password_mailer.rb` for us
- And also created two formats for us
  - `app/views/password_mailer/reset.text.erb` (text)
  - `app/views/password_mailer/reset.html.erb` (html)

#### Password Reset View

[Go Back to Contents](#table-of-contents)

Crate a new view

```Bash
  touch app/views/password_resets/new.html.erb
```

In `app/views/password_resets/new.html.erb`

```HTML
  <h1>Forgot your password?</h1>
  <%= form_with url: password_reset_path do |form| %>
      <div class="mb-3">
          <%= form.label :email%>
          <%= form.text_field :email, class: "form-control", placeholder: "your_email@email.com"%>
      </div>
      <div class="mb-3">
          <%= form.submit "Reset Password", class: "btn btn-primary"%>
      </div>
  <% end %>

```

#### Update Sign In Form

[Go Back to Contents](#table-of-contents)

In `app/views/sessions/new.html.erb`

- Add a new `link_to`

  ```HTML
    <div class="mb-3">
        <%= form.label :password%>
        <%= form.password_field :password, class: "form-control", placeholder: "password" %>
        <%= link_to "Forgot your password?", password_reset_path %>
    </div>
  ```

#### Password Mailer

[Go Back to Contents](#table-of-contents)

- [Global ID Rails](https://github.com/rails/globalid)

The `Password Mailer` is similar to any other controller. We can access the `params[:user]` that we passing through our controller (`PasswordMailer.with(user: @user)`)

In `app/mailers/password_mailer.rb`

```Ruby
  class PasswordMailer < ApplicationMailer
    def reset
      @token = params[:user].signed_id(
        purpose: 'password_reset',
        expires_in: 15.minutes
      )

      mail to: params[:user].email
    end
  end
```

---

##### RESET TOKEN

[Go Back to Contents](#table-of-contents)

In rails we have a builtin function that can generate a random token for us, we just need to reference a user from our database.

We can also have expiration data in our tokens

```Bash
  rails c
  # Running via Spring preloader in process 68865
  # Loading development environment (Rails 6.1.3)
  user = User.last
  #   (0.5ms)  SELECT sqlite_version(*)
  #  User Load (0.1ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
  # => #<User id: 5, email: "your_email@gmail.com", password_digest: [FILTERED], created_at: "2021-03-03 00:4...

  user.signed_id
  # => "eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOm51bGwsInB1ciI6InVzZXIifX0=--61bd3be1c2303e3825bf7824712d781b310906370fb5e04af921ae3759f35313"

  user.to_global_id
  #<GlobalID:0x00007fb158ad15b8 @uri=#<URI::GID gid://scheduled-tweets/User/5>>

  user.to_global_id.to_s
  # => "gid://scheduled-tweets/User/5"
```

- The `signed_id` generates an encrypted token with our users information, in this case the `user.id` (`"gid://scheduled-tweets/User/5"`)
- We can also pass an expiration to our `signed_id`

```Bash
  user.signed_id(expires_in: 15.minutes)
  # => "eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOiIyMDIxLTAzLTA0VDAwOjE4OjU4LjI4MVoiLCJwdXIiOiJ1c2VyIn19--b35f3bbb8935db0396d1bcc72d500363ba823cd64cf7cfadcded30a38ec73abf"
```

- We can also specify a purpose for this token, so in our server we can specify to only accept a token that has the same purpose of the request

```Bash
  user.signed_id(expires_in: 15.minutes, purpose: "password_reset")
  # => "eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOiIyMDIxLTAzLTA0VDAwOjIwOjQxLjA3OFoiLCJwdXIiOiJ1c2VyL3Bhc3N3b3JkX3Jlc2V0In19--4b0b719794f414f8d73cff9e6ed66fccdb18982555a88c904fce836ac2ee4083"
```

---

##### ROUTES

[Go Back to Contents](#table-of-contents)

To reset our password, we need to create two new routes to handle the requests.

We are going to create a `GET` page to render the form, and a `PATCH` route to receive the form to update the password

```Ruby
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'
```

---

##### HTML CONTENT

[Go Back to Contents](#table-of-contents)

In `app/views/password_mailer/reset.html.erb`

- We are going to create a normal `erb` file adding the path to to our `edit` page
- Instead of using `password_reset_edit_path` we are going to use `password_reset_edit_url`

  - The `password_reset_edit_path` generates a relative path (`/something`)
  - The `password_reset_edit_url` generates the complete path (`www.yourwebsite.com/something`)
    - The `password_reset_edit_url` accepts a parameter `token` to attach to the `url` that we are sending in our email

  ```Ruby
    Hi <%= params[:user].email%>,

    Someone request a reset of your password.

    If this was you, click on the link to reset your password. The link will expire automatically in 15 minutes.

    <%= link_to "Click Here To Reset Password Your Password", password_reset_edit_url(token: @token) %>
  ```

---

##### TEXT CONTENT

[Go Back to Contents](#table-of-contents)

In `app/views/password_mailer/reset.text.erb`

```Ruby
  Hi <%= params[:user].email%>,
  Someone request a reset of your password.
  If this was you, click on the link to reset your password. The link will expire automatically in 15 minutes.
  <%= password_reset_edit_url(token: @token) %>
```

---

##### DEVELOPMENT ENVIRONMENT

[Go Back to Contents](#table-of-contents)

In **development** mode, we need to config our environment so rails can get the correct **host**

In `config/environments/development.rb`

- Add the following config

  ```Ruby
    config.action_mailer.default_url_options = { host: 'localhost:3000' }
  ```

---

##### LOGS

[Go Back to Contents](#table-of-contents)

In our rails logs, we can see that our email was successfully delivered

```Bash
  [ActiveJob] [ActionMailer::MailDeliveryJob] [fd9e3930-3bfd-4639-ae1f-5f538740765c] Delivered mail 604029fad2409_110b24164-3f7@Rogers-MBP.phub.net.cable.rogers.com.mail (53.0ms)
  [ActiveJob] [ActionMailer::MailDeliveryJob] [fd9e3930-3bfd-4639-ae1f-5f538740765c] Date: Wed, 03 Mar 2021 19:29:46 -0500
  From: from@example.com
  To: your_email@gmail.com
  Message-ID: <604029fad2409_110b24164-3f7@Rogers-MBP.phub.net.cable.rogers.com.mail>
  Subject: Reset
  Mime-Version: 1.0
  Content-Type: multipart/alternative;
   boundary="--==_mimepart_604029facbb82_110b24164-4b3";
   charset=UTF-8
  Content-Transfer-Encoding: 7bit


  ----==_mimepart_604029facbb82_110b24164-4b3
  Content-Type: text/plain;
   charset=UTF-8
  Content-Transfer-Encoding: 7bit

  Hi your_email@gmail.com,
  Someone request a reset of your password.
  If this was you, click on the link to reset your password. The link will expire automatically in 15 minutes.
  http://localhost:3000/password/reset/edit?token=eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOiIyMDIxLTAzLTA0VDAwOjQ0OjQ2LjgyMFoiLCJwdXIiOiJ1c2VyL3Bhc3N3b3JkX3Jlc2V0In19--817cd5bba1257268efcc810b37077a608a66604ec0d058fd324a171543d7f726


  ----==_mimepart_604029facbb82_110b24164-4b3
  Content-Type: text/html;
   charset=UTF-8
  Content-Transfer-Encoding: 7bit

  <!DOCTYPE html>
  <html>
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <style>
        /* Email styles need to be inline */
      </style>
    </head>

    <body>
      Hi your_email@gmail.com,
  Someone request a reset of your password.
  If this was you, click on the link to reset your password. The link will expire automatically in 15 minutes.
  <a href="http://localhost:3000/password/reset/edit?token=eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOiIyMDIxLTAzLTA0VDAwOjQ0OjQ2LjgyMFoiLCJwdXIiOiJ1c2VyL3Bhc3N3b3JkX3Jlc2V0In19--817cd5bba1257268efcc810b37077a608a66604ec0d058fd324a171543d7f726">Click Here To Reset Password Your Password</a>

    </body>
  </html>

  ----==_mimepart_604029facbb82_110b24164-4b3--

    Rendered main/index.html.erb within layouts/application (Duration: 0.5ms | Allocations: 176)
  [ActiveJob] [ActionMailer::MailDeliveryJob] [fd9e3930-3bfd-4639-ae1f-5f538740765c] Performed ActionMailer::MailDeliveryJob (Job ID: fd9e3930-3bfd-4639-ae1f-5f538740765c) from Async(default) in 81.79ms
  [Webpacker] Everything's up-to-date. Nothing to do
    Rendered shared/_navbar.html.erb (Duration: 0.4ms | Allocations: 162)
    Rendered shared/_flash.html.erb (Duration: 0.1ms | Allocations: 59)
    Rendered layout layouts/application.html.erb (Duration: 32.5ms | Allocations: 4025)
  Completed 200 OK in 43ms (Views: 36.3ms | ActiveRecord: 0.0ms | Allocations: 6980)
```

- As we can see we have our `reset_url` in the middle of the logs

  ```Bash
    http://localhost:3000/password/reset/edit?token=eyJfcmFpbHMiOnsibWVzc2FnZSI6Ik5RPT0iLCJleHAiOiIyMDIxLTAzLTA0VDAwOjQ0OjQ2LjgyMFoiLCJwdXIiOiJ1c2VyL3Bhc3N3b3JkX3Jlc2V0In19--817cd5bba1257268efcc810b37077a608a66604ec0d058fd324a171543d7f726
  ```

---

##### RESET PASSWORD CONTROLLER

[Go Back to Contents](#table-of-contents)

We now need to build the action to `edit` and `update` the password

In `app/controllers/password_resets_controller.rb`

- **Edit Password**

  - We are going to use `find_signed` function instead of normal `find_by`
  - The `find_signed` checks if our token is still valid, and also gets the `user.id` from the token, and checks if the `purpose` is correct too

    ```Ruby
      def edit
        @user = User.find_signed(params[:token], purpose: 'password_reset')
      end
    ```

    - The `find_signed` method has another version that with an `!` mark (`find_signed!`) and this version throws an error if the token is expired
    - Lets refactor our action to handle the error

      ```Ruby
        def edit
          @user = User.find_signed!(params[:token], purpose: 'password_reset')
        rescue ActiveSupport::MessageVerifier::InvalidSignature
          redirect_to sign_in_path, alert: 'Your token has expired. Please try again'
        end
      ```

- **Update Password**

  - To update the password, we need to send the `@user` instance that we are sending to our view when we loaded the `edit` page
  - We need to do that, because we are going to create a private helper that `requires` a `user` so we can update the password

    ```Ruby
      def update
        @user = User.find_signed!(params[:token], purpose: 'password_reset')
        if @user.update(password_params)
          redirect_to sign_in_path,
                      notice: 'Your password has been reseted successfully. Please sign in again.'
        else
          render :edit
        end
      end

      private

      def password_params
        params.require(:user).permit(:password, :password_confirmation)
      end
    ```

---

##### RESET PASSWORD VIEW

[Go Back to Contents](#table-of-contents)

Create the `edit.html.erb`

```Bash
  touch app/views/password_resets/edit.html.erb
```

In `app/views/password_resets/edit.html.erb`

- Without sending the `@user` instance

  ```Ruby
    <h1>Reset your password</h1>
    <%= form_with url: password_reset_edit_path(token: params[:token]) do |form| %>
        <% if form.object.errors.any? %>
            <div class="alert alert-danger">
                <% form.object.errors.full_messages.each do |message| %>
                    <div>
                        <%= message %>
                    </div>
                <% end %>
            </div>
        <% end %>
        <div class="mb-3">
            <%= form.label :password%>
            <%= form.password_field :password, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.label :password_confirmation%>
            <%= form.password_field :password_confirmation, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.submit "Reset Password", class: "btn btn-primary"%>
        </div>
    <% end %>
  ```

- Sending the `@user` instance nested in our form (`model: @user`)

  ```Ruby
    <h1>Reset your password</h1>
    <%= form_with model: @user, url: password_reset_edit_path(token: params[:token]) do |form| %>
        <% if form.object.errors.any? %>
            <div class="alert alert-danger">
                <% form.object.errors.full_messages.each do |message| %>
                    <div>
                        <%= message %>
                    </div>
                <% end %>
            </div>
        <% end %>
        <div class="mb-3">
            <%= form.label :password%>
            <%= form.password_field :password, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.label :password_confirmation%>
            <%= form.password_field :password_confirmation, class: "form-control", placeholder: "password" %>
        </div>
        <div class="mb-3">
            <%= form.submit "Reset Password", class: "btn btn-primary"%>
        </div>
    <% end %>
  ```

### Generate Environment Variables

[Go Back to Contents](#table-of-contents)

Rails has a builtin environment system that can store and encrypt our environment variables

```Bash
  rails credentials:edit --environment=development

  # Adding config/credentials/development.key to store the encryption key: fasdfasdfasdfasdfasdfasdfasdfasdfa

  #  Save this in a password manager your team can access.

  #  If you lose the key, no one, including you, can access anything encrypted with it.

  #        create  config/credentials/development.key

  #  Ignoring config/credentials/development.key so it won't end up in Git history:

  #        append  .gitignore
```

- This will open a file so we can add our environment variables

In `2312312.development.yml`

- Add your twitter keys

  ```Yaml
    twitter:
        api_key: faljsdkfjaljsdfjlsoiifjo
        api_secret: fasdfasdg123123klkhkjhlafkhdflaksjdhflk
  ```

On `Terminal` we can get our api keys

```Bash
  rails c

  Rails.application.credentials.twitter

  # => {:api_key=>"faljsdkfjaljsdfjlsoiifjo", :api_secret=>"fasdfasdg123123klkhkjhlafkhdflaksjdhflk"}
```

- We can get an individual keys from the hash using `dig`

  ```Bash
    Rails.application.credentials.dig(:twitter, :api_key)
    # => "faljsdkfjaljsdfjlsoiifjo"
  ```

### Omniauth-Twitter

[Go Back to Contents](#table-of-contents)

Add the following gems

```Bash
  bundle add omniauth-twitter omniauth-rails_csrf_protection
```

- We need to add `omniauth-rails_csrf_protection` to be more secure, previously we had to make a `GET` request, now we do a `POST` request and send some information with the request

#### Initializers - Middleware

[Go Back to Contents](#table-of-contents)

Then in our `initializes` folder, we have to create a new file called `omniauth.rb`

```Bash
  touch config/initializers/omniauth.rb
```

In `config/initializers/omniauth.rb`

- Here we are going to setup our OmniAuth, to do so we need o call `Rails.application.config.middleware.use`.
- Then we pass the name of our application `OmniAuth::Builder`
- Then we specify the `provider` as `:twitter` (this will make rails look up for the twitter gem for us)

  ```Ruby
    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :twitter,
               Rails.application.credentials.dig(:twitter, :api_key),
               Rails.application.credentials.dig(:twitter, :api_secret)
    end
  ```

#### OmniAuth Routes (Special Routes)

[Go Back to Contents](#table-of-contents)

If we check our rails routes [http://localhost:3000/rails/info/routes] we won't see an `OmniAuth` route.

If we try to visit [http://localhost:3000/auth/twitter] we get the following error

> No route matches [GET] "/auth/twitter"

![](https://i.imgur.com/mNrdRrS.png)

This is because OmniAuth only accepts `POST` request

#### Index Page

[Go Back to Contents](#table-of-contents)

In `app/views/main/index.html.erb`

- Let's create a button so we can make a post request to our `/auth/twitter`

  ```Ruby
    <div class="d-flex align-items-center justify-content-center">
        <h1 class="mt-4">Welcome to Scheduled Tweets</h1>
    </div>
    <%= button_to "Connect Twitter", "/auth/twitter", method: :post, class: "btn btn-primary" %>
  ```

![](https://i.imgur.com/oW5yqo8.png)

After the user successfully connected his twitter account to our app, twitter will redirect to our callback route, with the `oauth_token` and `oauth_verifier` params

```Bash
  http://localhost:3000/auth/twitter/callback?oauth_token=QGoDzgAAAAABNU53AAABd_rvTH8&oauth_verifier=iw9nXvXqKhXnNg1QW9UWlKHQmUNp9qYZ
```

We now can create our new route `auth/twitter/callback` to get those params and save in our database to connect our twitter account

#### Twitter Callback Route

[Go Back to Contents](#table-of-contents)

In `config/routes.rb`

- Add our callback route

  ```Ruby
    get 'auth/twitter/callback', to: 'omniauth_callbacks#twitter'
  ```

#### OmniAuth Controller

[Go Back to Contents](#table-of-contents)

Create a new controller `omniauth_callbacks_controller.rb`

In `app/controllers/omniauth_callbacks_controller.rb`

```Ruby
  class OmniauthCallbacksController < ApplicationController
    def twitter
      render plain: 'Success!'
    end
  end
```

![](https://i.imgur.com/qCjvVsy.png)

### Twitter Model

[Go Back to Contents](#table-of-contents)

Generate a Twitter model

```Bash
  rails g model TwitterAccount user:belongs_to name username image token secret
  # Running via Spring preloader in process 76050
  #     invoke  active_record
  #     create    db/migrate/20210304034024_create_twitter_accounts.rb
  #     create    app/models/twitter_account.rb
  #     invoke    test_unit
  #     create      test/models/twitter_account_test.rb
  #     create      test/fixtures/twitter_accounts.yml

  rails db:migrate
  # == 20210304034024 CreateTwitterAccounts: migrating ============================
  # -- create_table(:twitter_accounts)
  #    -> 0.0030s
  # == 20210304034024 CreateTwitterAccounts: migrated (0.0031s) ===================
```

- `user:belongs_to`, each twitter account points to a user

In `app/models/twitter_account.rb`

- Rails generated for us

  ```Ruby
    class TwitterAccount < ApplicationRecord
      belongs_to :user
    end
  ```

In `app/models/user.rb`

- We can do the same thing to connect our `User` model with `TwitterAccount` model

  - **ATTENTION** the `:twitter_accounts` is plural
  - This connection allows us to `CRUD` our twitter account through the `User` model

  ```Ruby
    class User < ApplicationRecord
      has_many :twitter_accounts

      has_secure_password

      validates :email,
                presence: true,
                format: {
                  with: /\A[^@\s]+@[^@\s]+\z/,
                  message: 'must be a valid email address'
                }
    end
  ```

On `Terminal`

```Bash
  rails c

  User.last.twitter_accounts
  # (0.7ms)  SELECT sqlite_version(*)
  #  User Load (0.4ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
  #  TwitterAccount Load (0.4ms)  SELECT "twitter_accounts".* FROM "twitter_accounts" WHERE "twitter_accounts"."user_id" = ? /* loading for inspect */ LIMIT ?  [["user_id", 5], ["LIMIT", 11]]
  # => #<ActiveRecord::Associations::CollectionProxy []>
```

- This query will only get the twitter account for our current user

#### Update OmniAuth Controller

[Go Back to Contents](#table-of-contents)

In `app/controllers/omniauth_callbacks_controller.rb`

- We are going to create a new record in our `TwitterAccount` table
- We don't need to define the `user.id`, Rails already know because of our association

  ```Ruby
    Current.user.twitter_accounts.create()
  ```

- `OmniAuth` gives us a hash of all of the things that the API sends back

  - So we can create a method `auth` that can help us get all these values

    ```Ruby
      def auth
        request.env['omniauth.auth']
      end
    ```

```Ruby
  class OmniauthCallbacksController < ApplicationController
    def twitter
      # Prints all the values of the auth hash
      Rails.logger.info auth

      twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
      twitter_account.update(
        name: auth.info.name,
        username: auth.info.nickname,
        image: auth.info.image,
        token: auth.credentials.token,
        secret: auth.credentials.secret
      )
      redirect_to root_path, notice: 'Successfully connected your account'
    end

    def auth
      request.env['omniauth.auth']
    end
  end
```

- Instead of using `.create()` to add twitter info in the database. We can check if there is a `username` with this `nickname`, `.first_or_initialize` will use the `first` or `create` one if not found
- Then we can update de document

In `app/models/twitter_account.rb`

- We can update our model to validate the `:username` saving

  ```Ruby
    class TwitterAccount < ApplicationRecord
      belongs_to :user

      validates :username, uniqueness: true
    end
  ```

On `Terminal`

```Bash
  rails c

  User.last.twitter_accounts.count
  # User Load (0.1ms)  SELECT "users".* FROM "users" ORDER BY "users"."id" DESC LIMIT ?  [["LIMIT", 1]]
  #  (0.2ms)  SELECT COUNT(*) FROM "twitter_accounts" WHERE "twitter_accounts"."user_id" = ?  [["user_id", 5]]
  # => 1
```

### Twitter Accounts Page

#### Twitter Accounts Routes - Resources

[Go Back to Contents](#table-of-contents)

In `config/routes.rb`

- Add the `:twitter_accounts` resource
- The `resources` will generate all the `CRUD` operations routes for us
- And also adds automatically the `to:` to map to our twitter controller

  ```Ruby
    resources :twitter_accounts
    # get 'twitter_accounts/:id'
    # delete 'twitter_accounts/:id'
    # new, create, update
  ```

#### Twitter Accounts Controller

[Go Back to Contents](#table-of-contents)

Create a new controller

```Bash
  touch app/controllers/twitter_accounts_controller.rb
```

In `app/controllers/twitter_accounts_controller.rb`

```Ruby
  class TwitterAccountsController < ApplicationController
    before_action :require_user_logged_in

    def index
      @twitter_accounts = Current.user.twitter_accounts
    end

    def destroy
      @twitter_account = Current.user.twitter_accounts.find(params[:id])
      @twitter_account.destroy
      redirect_to twitter_accounts_path
    end
  end
```

- Add a `before_action` to require a `user` before executing anything

#### Twitter Accounts View

[Go Back to Contents](#table-of-contents)

Create the twitter account `index.html.erb`

```Bash
  touch app/views/twitter_accounts/index.html.erb
```

In `app/views/twitter_accounts/index.html.erb`

```HTML
  <div class="d-flex align-items-center justify-content-between">
      <h1>Twitter Accounts</h1>
      <%= link_to "Connect a Twitter Account", "/auth/twitter", method: :post, class: "btn btn-primary"%>
  </div>
  <% @twitter_accounts.each do |twitter_account| %>
      <div class="d-flex align-items-center mb-4">
          <div class="me-4">
              <%= image_tag twitter_account.image, class: "rounded-circle" %>
              <%= link_to "@#{twitter_account.username}", "https://twitter.com/#{twitter_account.username}", target: :_blank %>
          </div>
          <%= button_to "Disconnect", twitter_account, method: :delete, data: { confirm: "Are you sure?" } %>
      </div>
  <% end %>
```

- In rails, we don't need to provide the route to delete/disconnect our twitter account, we just need to pass the model `twitter_account` and rails will figure out to find the correct `user.id` to use ( `delete: 'twitter_accounts/:id'`)
- Then we can pass the `data` object, that will prompt the use to confirm

#### Update OmniAuth Controller

[Go Back to Contents](#table-of-contents)

Update our `twitter` callback action to redirect to our new route/page `twitter_accounts`

In `app/controllers/omniauth_callbacks_controller.rb`

```Ruby
  class OmniauthCallbacksController < ApplicationController
    def twitter
      # Prints all the values of the auth hash
      Rails.logger.info auth

      twitter_account = Current.user.twitter_accounts.where(username: auth.info.nickname).first_or_initialize
      twitter_account.update(
        name: auth.info.name,
        username: auth.info.nickname,
        image: auth.info.image,
        token: auth.credentials.token,
        secret: auth.credentials.secret
      )
      redirect_to twitter_accounts_path, notice: 'Successfully connected your account'
    end

    def auth
      request.env['omniauth.auth']
    end
  end
```

### before_action To Set Common Variables

[Go Back to Contents](#table-of-contents)

We can set a `before_action` to set a common variable across actions

In `app/controllers/twitter_accounts_controller.rb`

- Let's update our `destroy` action
- Create a private method `set_twitter_account`
- Require `before_action` for only the `destroy` action

  ```Ruby
    class TwitterAccountsController < ApplicationController
      before_action :require_user_logged_in
      before_action :set_twitter_account, only: [:destroy]

      def index
        @twitter_accounts = Current.user.twitter_accounts
      end

      def destroy
        @twitter_account.destroy
        redirect_to twitter_accounts_path,
                    notice: "Successfully disconnected @#{@twitter_account.username}"
      end

      private

      def set_twitter_account
        @twitter_account = Current.user.twitter_accounts.find(params[:id])
      end
    end
  ```

### Tweets

#### Tweets Model

[Go Back to Contents](#table-of-contents)

Generate a new `Tweet` model to schedule our tweets

```Bash
  rails g model Tweet user:belongs_to twitter_account:belongs_to body:text publish_at:datetime tweet_id:string
  # Running via Spring preloader in process 67929
  #     invoke  active_record
  #     create    db/migrate/20210306030431_create_tweets.rb
  #     create    app/models/tweet.rb
  #     invoke    test_unit
  #     create      test/models/tweet_test.rb
  #     create      test/fixtures/tweets.yml

  rails db:migrate
  # == 20210306030431 CreateTweets: migrating =====================================
  # -- create_table(:tweets)
  #    -> 0.0041s
  # == 20210306030431 CreateTweets: migrated (0.0044s) ============================
```

- `belongs_to` creates an association between `Tweet` and `User` and `twitter_account`
- In other words, a `tweet` belongs to a `user` and `twitter account`
- The `tweet_id` is going to be our confirmation that our tweet was sent

##### User Model

[Go Back to Contents](#table-of-contents)

In `app/models/user.rb`

- We need to make the connection with our `tweets` model
- To do so, add `has_many :tweets`

##### Twitter Account Model

[Go Back to Contents](#table-of-contents)

In `app/models/twitter_account.rb`

- We need to make the connection with our `tweets` model
- To do so, add `has_many :tweets`

#### Tweets Routes

[Go Back to Contents](#table-of-contents)

In `config/routes.rb`

- Add a the tweet resources

  ```Ruby
    resources :tweets
  ```

#### Tweets Controller

[Go Back to Contents](#table-of-contents)

Create a new controller

```Bash
  touch app/controllers/tweets_controller.rb
```

In `app/controllers/tweets_controller.rb`

```Ruby
  class TweetsController < ApplicationController
    before_action :require_user_logged_in

    def index
      @tweets = Current.user.tweets
    end

    def new
      @tweet = Tweet.new
    end

    def create
      @tweet = Current.user.tweets.create(tweet_params)
      if @tweet.save
        redirect_to tweets_path, notice: 'Tweet was schedule successfully'
      else
        render :new
      end
    end

    private

    def tweet_params
      params.require(:tweet).permit(:twitter_account_id, :body, :publish_at)
    end
  end
```

#### Tweets Index

[Go Back to Contents](#table-of-contents)

Create a new view

```Bash
  touch touch app/views/tweets/index.html.erb
```

In `app/views/tweets/index.html.erb`

```Ruby
  <div class="d-flex justify-content-between align-items-center">
      <h1>Tweets</h1>
      <% if Current.user.twitter_accounts.any? %>
          <%= link_to "Schedule a Tweet", new_tweet_path, class: "btn btn-primary" %>
      <% end %>
  </div>
  <% if Current.user.twitter_accounts.none? %>
      <%= link_to "Connect Your Twitter Account", "/auth/twitter", method: :post, class: "btn btn-primary"%>
  <% end %>
```

#### Update Navbar

[Go Back to Contents](#table-of-contents)

In `app/views/shared/_navbar.html.erb`

- Change our `Home` link to `Tweets`

  ```Ruby
    <li class="nav-item">
        <%= link_to "Tweets", tweets_path, class: "nav-link active" %>
    </li>
  ```

#### Tweets Model

[Go Back to Contents](#table-of-contents)

In `app/models/tweet.rb`

- Add a validation to our form
- We can also add something `after_initialize`, in this case it will check if the `publish_at` has already been set, otherwise, set the `datetime` for 24hrs from now

  ```Ruby
    class Tweet < ApplicationRecord
      belongs_to :user
      belongs_to :twitter_account

      validates :body, length: { minimum: 1, maximum: 280 }
      validates :publish_at, presence: true

      after_initialize do
        self.publish_at ||= 24.hours.from_now
      end
    end
  ```

#### Tweets New

[Go Back to Contents](#table-of-contents)

Create the new page

```Bash
  touch app/views/tweets/new.html.erb
  touch app/views/shared/_form_errors.html.erb
```

In `app/views/shared/_form_errors.html.erb`

- Create our shared error msg

  ```Ruby
    <% if form.object.errors.any? %>
        <div class="alert alert-danger">
            <% form.object.errors.full_messages.each do |message| %>
                <div>
                    <%= message %>
                </div>
            <% end %>
        </div>
    <% end %>
  ```

In `app/views/tweets/new.html.erb`

```Ruby
  <h1>Schedule a Tweet</h1>
  <%= form_with model: @tweet do |form| %>
      <div class="mb-3">
          <%= form.label :twitter_account_id %>
          <%= form.collection_select :twitter_account_id, Current.user.twitter_accounts, :id, :username, {}, { class: "form-control" } %>
          <%= link_to "Connect Your Twitter Account", "/auth/twitter" %>
      </div>
      <div class="mb-3">
          <%= form.label :body %>
          <%= form.text_area :body, class: "form-control" %>
      </div>
      <div class="mb-3">
          <%= form.label :publish_at %>
          <div class="form-control">
              <%= form.datetime_select :publish_at %>
          </div>
      </div>
      <%= form.button "Schedule", class: "btn btn-primary" %>
  <% end %>
```
