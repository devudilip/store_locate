module Api
  module V1
    class ProductsController < ApplicationController
      respond_to :json

      def index
       
        if  params[:query]
         respond_with Product.find_prod_id(params[:query])
        else
         respond_with {}
       end
     
     end

   end
 end
end