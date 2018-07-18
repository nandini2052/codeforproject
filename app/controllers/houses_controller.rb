class HousesController < ApplicationController
  
  def new
    @house = House.new
  end
  def create
  	@house = House.create(house_params)
  	if @house.save
  		flash[:notice] = "house is uploaded successfully"
  		redirect_to house_path(@house)
  	else
  		render 'new'
  	end
  end
  
  def show
    @house = House.find(params[:id])
  end

  def edit
    @house = House.find(params[:id])
  end

  def update
  	@house = House.find(params[:id])
  	if @house.update(house_params)
  		flash[:notice] = "House is updated successfully"
  		redirect_to house_path(@house)
  	else
  		render 'edit'
  	end
  end
  def destroy
    @house = House.find(params[:id])
    @house.destroy
    flash[:notice] = "House is deleted successfully"
    redirect_to houses_path

  end
  def index
    @houses=House.all
  end
private

 def house_params
 	params.require(:house).permit(:location,:Rent,:Address, :Description)
 end
end