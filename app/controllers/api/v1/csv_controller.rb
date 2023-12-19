module Api
  module V1
    class CsvController < ApplicationController
      skip_before_action :verify_authenticity_token

      def renderError
        puts "inside renderError"
        error_message = params[:error_message]
         redirect_to root_path
      end
    end
  end
end


