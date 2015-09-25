module Api
  module V1
    class StoresController < ApplicationController
      respond_to :json

      def index
        if params[:store_id] and params[:product_ids]
          respond_with Product.search_availability(params[:store_id],params[:product_ids])
        else
         render json: { :status => :error, :message => "store_id or product_ids are missing" }
       end
     end

     def product_avail
      if params[:product_ids] 
        respond_with Store.max_prod_avail(params[:product_ids])
      else
       render json: { :status => :error, :message => "product_ids are missing" }
     end
   end

 end
end
end