# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins "47.92.133.1:8080"
    resource "*",
             methods: [:get, :post, :delete, :patch, :options, :head],
             headers: :any,
             expose: ["*", "Authorization"],
             max_age: 600
  end
end
