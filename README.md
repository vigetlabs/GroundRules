# GroundRules

A responsive web application powered by a custom rails Content Management System
(CMS) that will provide access to informative coffee-based content to interested
coffee drinkers.

### Table of Contents

1. [Get the Repo](#get-the-repo)
2. [Dependencies](#dependencies)
3. [Configuration](#configuration)
4. [Start the Database](#start-the-database)
5. [Start the Server](#start-the-server)
6. [Running Tests](#running-tests)
7. [Deployment](#deployment)
6. [Domains](#domains)
7. [Continuous Integration](continuous-integration)

## Get the Repo

Make sure you have the project locally! Clone the repository onto your machine.
```
git clone git@github.com:vigetlabs/GroundRules.git
```

To run or do work on the project, make sure you're in the project directory.
```
cd GroundRules
```

## Dependencies

First, got that [Homebrew](http://brew.sh/)?  If not, install it!  We'll use Homebrew to install pretty much everything needed for this project.

Next up, what about [`rbenv`](https://github.com/rbenv/rbenv)(Ruby Version Manager)?  If you don't have it installed, run this:
```
$ brew update
$ brew install rbenv
```

This project is built on Ruby 2.4.1:
```
$ rbenv install 2.4.1
```

Make sure you have [Bundler](http://bundler.io/) installed for Ruby 2.4.1 as well!
```
$ gem install bundler
```

We'll be using [Postgres](http://www.postgresql.org/) (Version 9.6+) as our database:
```
$ brew install postgres
```

One of our Rails-installed dependencies, [Dragonfly](http://markevans.github.io/dragonfly/), uses ImageMagick for image processing, so we'll need that as well:
```
$ brew install imagemagick
```

That does it for system dependencies.  Now you'll just need to install the app dependencies for both Ruby and JS:
```
$ bundle install
$ npm install
```

## Configuration

To configure the project, first copy the example secrets file.
```
cp config/secrets.example.yml config/secrets.yml
```

Next, do the same with the database configuration file.
```
cp config/database.example.yml config/database.yml
```

Lastly, set up the database.
```
rake db:create db:migrate db:seed
```

## Start the Database

```
$ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start
```

I suggest opening your shell config and adding an alias (something like `pgstart`) so you don't have to type that whole command out.

## Start the Server

```
$ rails s
```

Now the application will be available at `localhost:3000`

## Running Tests

```
$ bundle exec rspec
```

## Deployment

This project is configured with CircleCI testing and deploy from the master branch. After finishing work on a new branch, submit your work via a Pull Request to master. Once master finishes building and passes all tests, the updated version will be automatically deployed.

## Domains

* [Production: https://www.GroundRules.co](https://www.groundrules.co)

## Continuous Integration

Continuous integration and deployment is run through [CircleCI](http://circleci.com/).  To receive notifications about build status, go to the [project page](https://circleci.com/gh/vigetlabs/GroundRules) and click on the 'follow the groundrules project'.
