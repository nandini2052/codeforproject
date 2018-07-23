class HousesController < ApplicationController

  def new
    @house = House.new
    require_user
  end

  def create
  	@house = House.new(house_params)
    require_user
    @house.user = current_user
  	if @house.save
  		flash[:notice] = "Your house has been created successfully"
  		redirect_to house_path(@house)
  	else
  		render 'new'
  	end
  end

  def index
    @houses=House.paginate(page: params[:page], per_page: 5)
  end

  def show
    @house = House.find(params[:id])
    user = current_seller
    ExampleMailer.sample_email(@house.user,user).deliver
  end

  def edit
    @house = House.find(params[:id])
    require_user
    require_same_user
  end

  def update
  	@house = House.find(params[:id])
    require_user
    require_same_user
  	if @house.update(house_params)
  		flash[:notice] = "House is updated successfully"
  		redirect_to house_path(@house)
  	else
  		render 'edit'
  	end
  end

  def destroy
    @house = House.find(params[:id])
    require_user
    require_same_user
    @house.destroy
    flash[:notice] = "House is deleted successfully"
    redirect_to houses_path
  end

  def search
    require_user
    if params[:search].blank?
    redirect_to(root_path, alert: "Empty field!") and return
  else
    @parameter = params[:search].downcase
    @results = House.all.where("lower(location) LIKE :search", search: @parameter)
  end

  end



private

 def house_params
 	params.require(:house).permit(:location,:Rent,:Address, :Description, :apartmentname)
 end
end
