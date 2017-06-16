class BuyerSessionsController < ApplicationController

    layout 'application'

    def new

    end

    def create
        @buyer = Buyer.find_by_email(params[:email])
        flash[:notice] = nil
        
        if @buyer && @buyer.authenticate(params[:password])
            session[:buyer_id] = @buyer.id
            flash[:notice] = nil
            redirect_to home_index_path
        else
            flash[:notice] = "Não foi possível completar o login. Por favor verificar os dados novamente."
            redirect_to '/buyer-login'
        end
    end
  
    def destroy
        session[:buyer_id] = nil
        redirect_to home_index_path
    end

end