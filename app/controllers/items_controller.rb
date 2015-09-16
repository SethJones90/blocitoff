class ItemsController < ApplicationController
  def new
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @item = Item.new
  end

  def create 
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @item = Item.new(params.require(:item).permit(:name))

    @item.user = current_user

    if @item.save 
      flash[:notice] = "You successfully created an item"
      redirect_to current_user
    else
      flash[:error] = "There was an error creating the item. Please try again."
    end
  end

  def destroy
    @user = current_user

    @item = Item.find(params[:id])
    @item.user = current_user

    if @item.destroy 
      flash[:notice] = "Your item was successfully deleted"
      redirect_to current_user
    else
      flash[:error] = "There was an error when deleting the item. Plese try again."
      redirect_to current_user
    end
  end

end
