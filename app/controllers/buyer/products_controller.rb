class Buyer::ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
        @store = Store.find_by(id: @product.store_id)
    end

end
