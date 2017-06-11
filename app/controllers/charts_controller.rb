class ChartsController < ApplicationController

    def index
        @charts = Chart.where(buyer_id: session[:buyer_id])
    end

    def new
        @chart = Chart.new
    end

    def create
        @chart = Chart.new
        @chart.buyer_id = session[:buyer_id]
        @chart.product_id = params[:product_id]
        @chart.quantidade = params[:quantidade]
        if @chart.save
            flash[:notice] = "Adicionado ao carrinho."
            redirect_to buyer_product_path(params[:product_id])
        else
            flash[:notice] = "Não foi possível adicionar ao carrinho."
            redirect_to buyer_product_path(params[:product_id])
        end
    end

    def destroy
        @chart = Chart.find(params[:id])
        @chart.destroy
        redirect_to charts_path
    end
end
