class PurchasesController < ApplicationController

    layout 'application'

    def index
        @purchase = Purchase.find_by(buyer_id: session[:buyer_id])
        if @purchase
            @purchase_products = PurchaseProduct.where(purchase_id: @purchase.id)
        end
    end

    def new
        @purchase = Purchase.new
    end

    def create
            @purchase = Purchase.new
            @purchase.buyer_id = session[:buyer_id]
            @purchase.isconcluida = false
            @purchase.isativa = true
            @purchase.save

            @charts = Chart.where(buyer_id: session[:buyer_id])
            @charts.each do |c|
                @purchase_product = PurchaseProduct.new
                @purchase_product.product_id = c.product_id
                @purchase_product.purchase_id = @purchase.id
                @purchase_product.save
                c.destroy
            end

            @purchase.save
            redirect_to purchases_path
    end

    def destroy
        @purchase = Purchase.find_by(buyer_id: session[:buyer_id])
        @purchase_products = PurchaseProduct.where(purchase_id: @purchase.id)

        @purchase_products.each do |p|
            p.destroy
        end

        @purchase.destroy
        redirect_to purchases_path
    end
end
