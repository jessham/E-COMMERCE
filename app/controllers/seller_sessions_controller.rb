class SellerSessionsController < ApplicationController

    layout 'application'

    def new

    end

    def create
        @seller = Seller.find_by_email(params[:email])
        flash[:notice] = nil
        
        if @seller && @seller.authenticate(params[:password])
            session[:seller_id] = @seller.id
            flash[:notice] = nil
            redirect_to home_index_path
        else
            flash[:notice] = "Não foi possível completar o login. Por favor verificar os dados novamente."
            redirect_to '/seller-login'
        end
    end
  
    def destroy
        session[:seller_id] = nil
        redirect_to home_index_path
    end

end