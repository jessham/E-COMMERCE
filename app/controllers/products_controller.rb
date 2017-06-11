class ProductsController < ApplicationController

    def index
        @products = Product.all
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
        @stores = Store.where(seller_id: session[:seller_id])
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            flash[:notice] = "Produto cadastrado."
            redirect_to seller_path(session[:seller_id])
        else
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_product_path
        end
    end

    def product_params
      params.require(:product).permit(:nome, :codigo, :descricao,
      :preconormal, :precopromocional, :estoqueatual, :estoquemax,
      :store_id)
    end

end
