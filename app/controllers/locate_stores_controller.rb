class LocateStoresController < ApplicationController

  def index
    @stores = Store.select('lat, long')
  end

end
