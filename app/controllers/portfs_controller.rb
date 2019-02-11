class PortfsController < ApplicationController
	 before_action :set_portf, only: [:show, :edit, :update, :destroy]
	def index
		@portfolio_items = Portf.all
	end

	def new
		@portfolio_item = Portf.new
	end

	def create
    @portfolio_item = Portf.new(params.require(:portf).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfs_path, notice: 'Blog was successfully created.' }
        format.json { render :show, status: :created, location: @blog }
      else
        format.html { render :new }
        format.json { render json: @blog.errors, status: :unprocessable_entity }
      end
    end
  end

end
