class HousesController < ApplicationController

  before_action :set_house, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def new
    @house = House.new
  end

  def create
  	@house = House.new(house_params)
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
    cuser = current_user
    ExampleMailer.sample_email(@house.user,cuser).deliver
  end

  def edit
  end

  def update
  	if @house.update(house_params)
  		flash[:notice] = "House is updated successfully"
  		redirect_to house_path(@house)
  	else
  		render 'edit'
  	end
  end

  def destroy

    @house.destroy
    flash[:notice] = "House is deleted successfully"
    redirect_to houses_path
  end

  def search
    if params[:search].blank?
    redirect_to(root_path, alert: "Empty field!") and return
   else
    @parameter = params[:search].downcase
    @results = House.all.where("lower(location) LIKE :search", search: @parameter)
   end
  end

private

 def set_house
   @house = House.find(params[:id])
 end

 def require_same_user
   if current_user != @house.user && !current_user.admin?
     flash[:danger] = "You can only edit or delete your own articles"
     redirect_to root_path
   end
 end

 def house_params
 	params.require(:house).permit(:location,:Rent,:Address, :Description, :apartmentname)
 end
end
