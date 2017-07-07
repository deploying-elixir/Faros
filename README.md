# Faros

[![CircleCI](https://circleci.com/gh/deploying-elixir/Faros/tree/master.svg?style=svg)](https://circleci.com/gh/deploying-elixir/Faros/tree/master)
Welcome to the Faros Application.

# Running Locally

You need to have Elixir and postgres installed. For the assets to render, Node and npm also need to be installed.

Clone the repository
> git clone git@github.com:deploying-elixir/Faros.git

Navigate to the root directory
> cd Faros

Install dependencies
> mix deps.get

Compile the code
> mix compile

Build the database (dev env)
> mix ecto.create
> mix ecto.migrate

Build the database (test env)
> MIX_ENV=test mix ecto.create

> MIX_ENV=test mix ecto.migrate

Run the tests
> mix test

Compile the assets
> cd apps/faros_frontend

> npm install

Start the server locally (dev env)
> MIX_ENV=dev mix ecto.create

> MIX_ENV=dev mix ecto.migrate

> MIX_ENV=dev mix phoenix.server

Navigate to the home page:
> https://localhost:4040

# Services which require authentication

Before running the application:

Copy the `.env-example` to `.env`
> cp .env-example .env

Add the keys you require for the api you are using. Some example twitter keys are in place as an example.

Source the .env file
> source(.env)
