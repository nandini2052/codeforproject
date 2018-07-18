class SellersController < ApplicationController
 
  def new
    @seller = Seller.new
  end
  def create
    @seller = Seller.new(seller_params)
    if @seller.save
      flash[:success] = "Welcome #{@seller.sellername} to MyHome App!"
      redirect_to seller_path(@seller)
    else
      render 'new'
    end
  end
  def show 
   @seller = Seller.find(params[:id])
  end
  def edit
    @seller= Seller.find(params[:id])
  end
  def update
    @seller = Seller.find(params[:id])
    if @seller.update(seller_params)
      flash[:success] = "Your account is updated successfully"
      redirect_to @seller
    else
      render 'edit'
    end  
  end

  private
  
  def seller_params
    params.require(:seller).permit(:sellername, :email, 
                                    :password, :password_confirmation)
  end

end