class ApplicationController < ActionController::Base
  USERS = { "admin" => "admin" }
 
  #before_action :authenticate
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
 
  private
 
    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end 

    def record_not_found
      render plain: "404 Not Found", status: 404
    end 
end
