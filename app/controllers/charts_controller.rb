class ChartsController < ApplicationController

    def index
        @charts = Chart.where(buyer_id: session[:buyer_id])
    end

    def new
        @chart = Chart.new
    end

    def create
        if @purchase = Purchase.find_by(buyer_id: session[:buyer_id])
            flash[:notice] = "Não foi possível adicionar ao carrinho. Compra em andamento."
            redirect_to buyer_product_path(params[:product_id])
        else
            @chart = Chart.new
            @chart.buyer_id = session[:buyer_id]
            @chart.product_id = params[:product_id]
            @chart.quantidade = params[:quantidade]
            if @chart.save
                flash[:notice] = "Adicionado ao carrinho."
                redirect_to charts_path
            else
                flash[:notice] = "Não foi possível adicionar ao carrinho."
                redirect_to buyer_product_path(params[:product_id])
            end
        end
    end

    def destroy
        @chart = Chart.find(params[:id])
        @chart.destroy
        redirect_to charts_path
    end
end
