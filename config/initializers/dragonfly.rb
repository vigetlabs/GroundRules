require 'dragonfly'
require 'dragonfly/s3_data_store'

include ActionView::Helpers::NumberHelper

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret Rails.application.secrets.dragonfly_secret

  secret "4535d2f3eae9919e9d3c642ba751205abe26f096367cd4611daadb50af749fc2"

  url_format "/media/:job/:name"

  SimplestPhoto::UrlHelper.install(self)

  if Rails.env.production? || Rails.env.staging? || Rails.env.integration?
    datastore :s3,
      bucket_name:       Rails.application.secrets.s3_bucket_name,
      access_key_id:     Rails.application.secrets.s3_access_key_id,
      secret_access_key: Rails.application.secrets.s3_secret_access_key,
      url_scheme:        'https'
  else
    datastore :file,
      root_path:   Rails.root.join('public/uploads', Rails.env),
      server_root: Rails.root.join('public')
  end

  define_url do |app, job, opts|
    cropping = PhotoCropping.find_by(signature: job.signature)

    if job.process_steps.empty?
      # No processing to perform, link to the original
      app.datastore.url_for(job.uid)

    elsif cropping
      # A cropping already exists, link to it
      app.datastore.url_for(cropping.uid)

    else
      # Link to the job
      app.server.url_for(job)
    end
  end
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
