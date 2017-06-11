class StoresController < ApplicationController
    def show
        @store = Store.find(params[:id])
    end

    def new
        @store = Store.new
    end

    def create
        @store = Store.new(store_params)
        @store.seller_id = session[:seller_id]

        if @store.save
            flash[:notice] = "Loja cadastrada."
            redirect_to seller_path(session[:seller_id])
        else
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_store_path
        end
    end

    def store_params
      params.require(:store).permit(:nome, :telefone1, :telefone2,
        :endereco, :numero, :cidade, :uf,
        :seller_id)
    end
end
