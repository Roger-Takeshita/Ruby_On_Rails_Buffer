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
