class PagesController < ApplicationController

    def index
        @page = Page.all
    end

    def add
        @page = Page.new
    end

    def show
        @page = Page.find_by(sublink: params[:sublink]);
    end

    def create
        @page = Page.new(page_params);
        if @page.save
            redirect_to @page;
        else
            render 'new';
        end
    end

    private def page_params
        params.require(:page).permit(:sublink, :title, :body);
    end
end
