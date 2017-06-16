class StoresController < ApplicationController

    layout 'application'

    def index
        @stores = Store.where(seller_id: session[:seller_id])
    end

    def show
        @store = Store.find(params[:id])
    end

    def edit
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
            redirect_to home_index_path
        else
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_store_path
        end
    end

    def update
        @store = Store.find(params[:id])
        @store.update_attributes(store_params)
        
        begin
            if @store.save
                flash[:notice] = "Dados atualizados."
                redirect_to stores_path
            else
                flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
                redirect_to edit_store_path(@store)
            end
        rescue
            flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
            redirect_to edit_store_path(@store)
        end
    end

    private

    def store_params
      params.require(:store).permit(:nome, :telefone1, :telefone2,
        :endereco, :numero, :cidade, :uf,
        :seller_id)
    end
end
