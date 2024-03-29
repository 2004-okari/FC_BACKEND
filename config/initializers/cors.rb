Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://final-capstone-frontend-3l0g.onrender.com' # Add the origin of your frontend application
    resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head], credentials: true
  end
end