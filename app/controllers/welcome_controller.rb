class WelcomeController < ApplicationController
    def index
      redirect_to wikis_path if user_signed_in?
    end
  
    def about
    end
  end