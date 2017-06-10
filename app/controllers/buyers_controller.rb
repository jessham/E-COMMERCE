class BuyersController < ApplicationController

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

        if @buyer.save
            flash[:notice] = "Usuário cadastrado."
            redirect_to '/buyerlogin'
        else
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_buyer_path
        end
    end

    def user_params
      params.require(:buyer).permit(:nome, :email, :cpf, :cnpj,
        :endereco, :numero, :complemento, :bairro, :cep, :cidade, :uf,
        :telresidencial, :telcomercial, :celular,
        :password, :password_confirmation)
    end
end