class WikisController < ApplicationController
    before_action :set_wiki, only: [:edit, :update, :show, :destroy]
  
    def index
      @wikis = Wiki.paginate(:page => params[:page], :per_page => 3)
    end
  
    def show
    end
  
    def new
      @wiki = Wiki.new
    end
  
    def create
      @wiki = Wiki.new
      @wiki.title = params[:wiki][:title]
      @wiki.body = params[:wiki][:body]
      @wiki.user = current_user
      if @wiki.save
        flash[:notice] = "Wiki was created successfully."
        redirect_to wiki_path(@wiki)
      else
        flash.now[:alert] = "There was an error saving the wiki. Please try again."
        render :new
      end
    end
  
    def edit
    end
  
    def update
      @wiki.title = params[:wiki][:title]
      @wiki.body = params[:wiki][:body]
      
  
      if @wiki.save
        flash[:notice] = "Wiki was updated successfully."
        redirect_to wiki_path(@wiki)
      else
        flash.now[:alert] = "There was an error saving the article. Please try again."
        render :new
      end
    end
  
    def destroy
      if @wiki.destroy
        flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
        redirect_to wikis_path
      else
        flash.now[:alert] = "There was an error deleting the article."
        render :show
      end
    end
  
    private
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end
  end