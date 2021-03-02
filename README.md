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
    - [Session Cookie](#session-cookie)
    - [Logout - Session Controllers](#logout---session-controllers)
      - [Session Route](#session-route)
      - [Session Controller](#session-controller)

# SCHEDULE TWEETS - BUFFER CLONE

## Links

[Go Back to Contents](#table-of-contents)

- [Go Rails - Buffer Clone](https://gorails.com/episodes/rails-for-beginners-part-1-installing-ruby-on-rails?autoplay=1)
- [Bootstrap5](https://getbootstrap.com/docs/5.0/getting-started/introduction/)

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

### Session Cookie

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
