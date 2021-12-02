class SubPagesController < ApplicationController
    before_action :edit, only: [:show, :edit, :update, :destroy]

    def index
        @subpage = SubPage.all
    end

    def new
    end

    def show
        @subpage = SubPage.find_by(sublink: params[:sublink]);
    end

    def edit
        @subpage = SubPage.find_by(sublink: params[:sublink]);
    end

    def create
        @subpage = SubPage.new(subpage_params);
        if @subpage.save
            redirect_to @subpage;
        else
            render 'new';
        end
    end

    def update
        @subpage = SubPage.find_by(sublink: params[:sublink]);
        if @subpage.update(subpage_params)
            redirect_to @subpage;
        else
            render 'edit';
        end
    end

    def destroy
        @subpage = SubPage.find_by(sublink: params[:sublink]);

        @subpage.destroy
        redirect_to subpages_path
    end

    private def subpage_params
        params.require(:subpage).permit(:sublink, :title, :body);
    end
end
