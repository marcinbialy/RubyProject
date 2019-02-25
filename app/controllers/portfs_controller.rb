class PortfsController < ApplicationController
before_action :set_portfolio_item, only: [:edit, :update, :show, :destroy]
layout "portfolio"
access all: [:show, :index], user: {except: [:destroy, :edit, :update, :new, :create, :sort]}, site_admin: :all

	def index
		@portfolio_items = Portf.by_position
	end

  def sort
    params[:order].each do |key, value|
      Portf.find(value[:id]).update(position: value[:position])
    end
    render body: nil
  end

	def show
	end

	def new
		@portfolio_item = Portf.new
	end

	def create
    @portfolio_item = Portf.new(portfolio_params)

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfolio_index_path, notice: 'Portfolio was successfully created.' }
        #format.json { render :show, status: :created, location: @portf }
      else
        format.html { render :new }
        #format.json { render json: @portf.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

   def update
   respond_to do |format|
     if @portfolio_item.update(portfolio_params)
       format.html { redirect_to portfolio_index_path, notice: 'Portfolio was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def destroy
    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfolio_index_url, notice: 'Record was deleted.' }
    end
  end

  private
  def portfolio_params
      params.require(:portf).permit(:title, 
                                    :subtitle, 
                                    :body,
                                    :main_image,
                                    :thumb_image, 
                                    technologies_attributes: [:id, :name, :_destroy])
  end

  def set_portfolio_item
    @portfolio_item = Portf.find(params[:id])
  end

end
