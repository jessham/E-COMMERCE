class SellersController < ApplicationController

    def current_user
        @current_user ||= Seller.find(session[:seller_id]) if session[:seller_id]
    end
    helper_method :current_user
    
    def authorize
        redirect_to new_seller_path unless current_user
    end

    def show
        @seller = Seller.find(params[:id])
    end

    def new
        @seller = Seller.new
    end

    def create
        @seller = Seller.new(user_params)

        if @seller.save
            flash[:notice] = "Usuário cadastrado."
            redirect_to '/seller-login'
        else
            flash[:notice] = "Não foi possível completar o cadastro. Por favor verificar os dados novamente."
            redirect_to new_seller_path
        end
    end

    def user_params
      params.require(:seller).permit(:nome, :email, :cnpj,
        :apelido, :descricao,
        :password, :password_confirmation)
    end
end