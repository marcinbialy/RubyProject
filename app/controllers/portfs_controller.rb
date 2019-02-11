class PortfsController < ApplicationController

	def index
		@portfolio_items = Portf.all
	end

	def show
		@portfolio_item = Portf.find(params[:id])
	end

	def new
		@portfolio_item = Portf.new
	end

	def create
    @portfolio_item = Portf.new(params.require(:portf).permit(:title, :subtitle, :body))

    respond_to do |format|
      if @portfolio_item.save
        format.html { redirect_to portfs_path, notice: 'Portfolio was successfully created.' }
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
     if @portfolio_item.update(params.require(:portf).permit(:title, :subtitle, :body))
       format.html { redirect_to portfs_path, notice: 'Portfolio was successfully updated.' }
     else
       format.html { render :edit }
     end
   end
 end

 def destroy
 	@portfolio_item = Portf.find(params[:id])

    @portfolio_item.destroy
    respond_to do |format|
      format.html { redirect_to portfs_url, notice: 'Record was deleted.' }
    end
  end

end
