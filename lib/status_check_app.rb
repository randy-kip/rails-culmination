class StatusCheckApp
    # Define a method call that accepts the environment variable `env`
    def call(env)
      # Create a new Rack::Response object with the body "ok" and finish the response
      Rack::Response.new("ok").finish
    end
end
  