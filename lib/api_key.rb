class ApiKey
    # Constructor method for the ApiKey class
    def initialize(app, opts={})
      # Store the Rack application in an instance variable
      @app = app
      # Store the database (presumably containing API keys) in another instance variable
      @keys = opts[:database]
    end
  
    # Method called when the middleware is invoked by the Rack server
    def call(env)
      # Retrieve the API key from the request headers
      api_key = env["HTTP_API_KEY"]
      
      # Check if the API key exists in the database
      user = @keys[api_key]
  
      # If the user associated with the API key is nil (not found in the database)
      if user.nil?
        # Return a 403 Forbidden response
        [403, {}, ["Forbidden"]]
      else
        # If the user is found, call the next middleware in the stack (typically the application)
        @app.call(env)
      end
    end
end
  