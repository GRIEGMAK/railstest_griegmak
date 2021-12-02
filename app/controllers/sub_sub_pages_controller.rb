class SubSubPagesController < ApplicationController
    before_action :edit, only: [:show, :edit, :update, :destroy]

    def index
        @subsubpage = SubSubPage.all
    end

    def new
    end

    def show
        @subsubpage = SubSubPage.find_by(sublink: params[:sublink]);
    end

    def edit
        @subsubpage = SubSubPage.find_by(sublink: params[:sublink]);
    end

    def create
        @subsubpage = SubSubPage.new(subsubpage_params);
        if @subsubpage.save
            redirect_to @subsubpage;
        else
            render 'new';
        end
    end

    def update
        @subsubpage = SubSubPage.find_by(sublink: params[:sublink]);
        if @subsubpage.update(subsubpage_params)
            redirect_to @subsubpage;
        else
            render 'edit';
        end
    end

    def destroy
        @subsubpage = SubSubPage.find_by(sublink: params[:sublink]);

        @subsubpage.destroy
        redirect_to subsubpages_path
    end

    private def subsubpage_params
        params.require(:subsubpage).permit(:sublink, :title, :body);
    end
end
