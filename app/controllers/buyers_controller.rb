class BuyersController < ApplicationController

    layout 'application'

    def show
        @buyer = Buyer.find(params[:id])
    end

    def edit
        @buyer = Buyer.find(params[:id])
    end

    def new
        @buyer = Buyer.new
    end

    def create
        @buyer = Buyer.new(user_params)

        begin
            if @buyer.save
                flash[:notice] = "Usuário cadastrado."
                redirect_to '/buyer-login'
            else
                flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
                redirect_to new_buyer_path
            end
        rescue
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_buyer_path
        end
    end

    def update
        @buyer = Buyer.find(params[:id])
        @buyer.update_attributes(user_params)
        
        if @buyer.save
        flash[:notice] = "Dados atualizados."
        redirect_to home_index_path
        else
        flash[:notice] = "Não foi possível atualizar os dados. Por favor verificar os dados novamente."
        redirect_to edit_buyer_path(@buyer)
        end
    end

    private

    def user_params
      params.require(:buyer).permit(:nome, :email, :cpf, :cnpj,
        :endereco, :numero, :complemento, :bairro, :cep, :cidade, :uf,
        :telresidencial, :telcomercial, :celular,
        :password, :password_confirmation)
    end
end