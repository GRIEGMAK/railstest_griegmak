class PagesController < ApplicationController
    before_action :edit, only: [:show, :edit, :update, :destroy]

    def index
        @page = Page.all
    end

    def add
        @page = Page.new
    end

    def show
        @page = Page.find_by(sublink: params[:sublink]);
    end

    def edit
        @page = Page.find_by(sublink: params[:sublink]);
    end

    def create
        @page = Page.new(page_params);
        if @page.save
            redirect_to pages_path;
        else
            render 'add';
        end
    end

    def update
        @page = Page.find_by(sublink: params[:sublink]);
        if @page.update(page_params)
            redirect_to pages_path;
        else
            render 'edit';
        end
    end

    def destroy
        @page = Page.find_by(sublink: params[:sublink]);

        @page.destroy
        redirect_to pages_path
    end

    private def page_params
        params.require(:page).permit(:sublink, :title, :body);
    end
end
