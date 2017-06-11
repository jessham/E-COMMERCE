class SellersController < ApplicationController

    def show
        @seller = Seller.find(params[:id])
    end

    def new
        @seller = Seller.new
    end

    def create
        @seller = Seller.new(user_params)

        begin
            if @seller.save
                flash[:notice] = "Usuário cadastrado."
                redirect_to '/seller-login'
            else
                flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
                redirect_to new_seller_path
            end
        rescue
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_seller_path
        end
    end

    def update
        @seller = Seller.find(params[:id])
        @seller.update_attributes(user_params)
        
        if @seller.save
        flash[:notice] = "Dados atualizados."
        redirect_to home_index_path
        else
        flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
        redirect_to edit_seller_path(@seller)
        end
    end

    private

    def user_params
      params.require(:seller).permit(:nome, :email, :cnpj,
        :apelido, :descricao,
        :password, :password_confirmation)
    end
end