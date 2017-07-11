require 'viget/deployment/rails'
set :application, 'groundrules'
set :user, "deploy"
set :default_stage, 'production'
set :branch, 'master'

# Enable slack notifications about deploy
set :slack_url,     'https://hooks.slack.com/services/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'
set :slack_channel, '#intern17-only'
set :slack_username, 'GroundRules Deploy'
set :slack_emoji, ':coffee:'
set :slack_app_url, 'http://www.groundrules.co/'
