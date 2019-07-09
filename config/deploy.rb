require 'viget/deployment/rails'
set :application, 'groundrules'
set :user, "deploy"
set :default_stage, 'production'
set :branch, 'master'

# Install Node dependencies before precompiling assets
namespace :deploy do
  namespace :npm do
    task :install, :roles => :app do
      # Install NPM dependencies in development mode because the
      # build command gets invoked on the server
      run "cd #{release_path} && npm install"
    end
  end
end

# Run NPM install after assets:precompile
before "deploy:assets:precompile", "deploy:npm:install"
