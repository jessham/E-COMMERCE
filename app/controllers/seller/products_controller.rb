class Seller::ProductsController < ApplicationController

    def index
        @stores = Store.where(seller_id: session[:seller_id])
    end

    def show
        @product = Product.find(params[:id])
        @store = Store.find_by(id: @product.store_id)
    end

    def edit
        @product = Product.find(params[:id])
        @stores = Store.where(seller_id: session[:seller_id])
    end

    def new
        @stores = Store.where(seller_id: session[:seller_id])
        @product = Product.new
    end

    def create
        @product = Product.new(product_params)

        begin
            if @product.save
                flash[:notice] = "Produto cadastrado."
                redirect_to seller_products_path
            else
                flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
                redirect_to new_seller_product_path
            end
        rescue
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_seller_product_path
        end
    end

    def update
        @product = Product.find(params[:id])
        @product.update_attributes(product_params)
        
        begin
            if @product.save
                flash[:notice] = "Dados atualizados."
                redirect_to seller_products_path
            else
                flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
                redirect_to edit_seller_product_path(@product)
            end
        rescue
            flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
            redirect_to edit_seller_product_path(@product)
        end
    end

    def destroy
        @product = Product.find(params[:id])

        @product.destroy
        redirect_to seller_products_path
    end

    private

    def product_params
      params.require(:product).permit(:nome, :codigo, :descricao,
      :preconormal, :precopromocional, :estoqueatual, :estoquemax,
      :store_id)
    end

end
