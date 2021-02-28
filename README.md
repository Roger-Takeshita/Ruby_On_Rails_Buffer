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
      - [Routes](#routes-1)
      - [Controller](#controller)
      - [Views](#views-1)
    - [Main Route](#main-route)
      - [Routes](#routes-2)
      - [Controller](#controller-1)
      - [Views](#views-2)

# SCHEDULE TWEETS - BUFFER CLONE

## Links

[Go Back to Contents](#table-of-contents)

- [Go Rails - Buffer Clone](https://gorails.com/episodes/rails-for-beginners-part-1-installing-ruby-on-rails?autoplay=1)

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

#### Routes

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

#### Controller

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

#### Views

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

### Main Route

#### Routes

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

#### Controller

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

#### Views

[Go Back to Contents](#table-of-contents)

Create the `index.html.erb`

In `app/views/main/index.html.erb`

- Add a simple message

  ```Html
    <h1>Welcome to Scheduled Tweets</h1>
  ```

  ![](https://i.imgur.com/lf5FyrS.png)
