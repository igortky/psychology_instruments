## Prerequisites

Before you begin, ensure you have met the following requirements:

- You have installed a **Node Version Manager (nvm)**. If you don't have one, it is recommended to install it. Once installed, you can use the command `nvm use` within the project directory.
- You have installed a **Ruby version manager** such as **rbenv** or **rvm**. Once installed, you can use the command `rbenv local` within the project directory.

## Setting Up The Project

1. Copy the sample environment variables file with the command `cp .env.sample .env`.
2. Fill in the variables for the database and SMTP in the `.env` file.
3. Install the necessary Ruby gems with the command `bundle install`.

## Creating The Database

1. Create the database with the command `bin/rails db:create`.
2. Run the migrations with the command `bin/rails db:migrate`.
3. Seed the database with the command `bin/rails db:seed`.

## Running The Project

1. Start the Rails server with the command `rails s`.
2. Log in with the user created in the seed data.
