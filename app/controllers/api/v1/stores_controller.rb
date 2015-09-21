module Api
  module V1
    class StoresController < ApplicationController
      respond_to :json

      def index
        respond_with Product.search_availability(1,1)
      end
      
    end
  end
end