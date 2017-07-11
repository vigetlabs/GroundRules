#GroundRules
===========+
A responsive web application powered by a custom rails Content Management System
(CMS) that will provide access to informative coffee-based content to interested
coffee drinkers.

## Development Setup

Ensure you have `rbenv` installed on your machine.

    $ brew install rbenv

Ensure you have Ruby `2.4.1` installed on your machine.

    $ rbenv install 2.4.1

Install Bundler

    $ gem install bundler

To get the application running, first install gem dependencies with Bundler:

    $ bundle install

Copy the example environment dotfile and fill out:

    $ cp secrets.example.yml secrets.yml

Copy the sample database configuration file and fill out:

    $ cp config/database.example.yml config/database.yml

Create, migrate and seed the database:

    $ rake db:create db:migrate db:seed

Start the server:

        $ rails s

Now the application will be available at `localhost:3000`.

## Deploying Changes

Submit pull request with proposed changes

Merge pull request after receiving approvals from two different developers on the project
