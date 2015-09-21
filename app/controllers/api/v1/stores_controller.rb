module Api
  module V1
    class StoresController < ApplicationController
      respond_to :json

      def index
        if params[:store_id] and params[:product_id]
          respond_with Product.search_availability(params[:store_id],params[:product_id])
        else
         respond_with {}
       end
     end

   end
 end
end