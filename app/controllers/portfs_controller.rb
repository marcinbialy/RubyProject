class PortfsController < ApplicationController

	def index
		@portfolio_items = Portf.all
	end

	def show
		@portfolio_item = Portf.find(params[:id])
	end

	def new
		@portfolio_item = Portf.new
    3.times {@portfolio_item.technologies.build}
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
  	@portfolio_item = Portf.find(params[:id])
  end

   def update
   @portfolio_item = Portf.find(params[:id])

   respond_to do |format|
     if @portfolio_item.update(portfolio_params)
       format.html { redirect_to portfolio_index_path, notice: 'Portfolio was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def destroy
 	@portfolio_item = Portf.find(params[:id])

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
                                    technologies_attributes: [:name])
  end

end
