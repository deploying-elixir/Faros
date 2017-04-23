# Faros

[![CircleCI](https://circleci.com/gh/Maikon/Faros.svg?style=svg&circle-token=d426a2c064bb29bd83ff0ddfe106308e7c77d743)](https://circleci.com/gh/Maikon/Faros)

Welcome to the Faros Application.

# Running Locally

You need to have Elixir and postgres installed

Clone the repository
> git clone git@github.com:Maikon/Faros.git

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

Start the server locally
> mix phoenix.server

Navigate to a supported url
> https://localhost:4000/posts

# Services which require authentication

Before running the application:

Copy the `.env-example` to `.env`
> cp .env-example .env

Add the keys you require for the api you are using. Some example twitter keys are in place as an example.

Source the .env file
> source(.env)
