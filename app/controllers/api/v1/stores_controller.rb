module Api
  module V1
    class StoresController < ApplicationController
      respond_to :json

      def index
       
        if params[:store_id] and params[:product_id]
          respond_with Product.search_availability(params[:store_id],params[:product_id])
        elsif params[:query]
         respond_with Product.check_services(params[:query])
       end
     
     end

   end
 end
end