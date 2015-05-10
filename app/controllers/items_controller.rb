class ItemsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @item = @user.items.new(item_params)

    if @item.save
      flash[:notice] = "You added a new item."
      redirect_to user_path(@user)
   else
     flash[:error] = "Error in submitting a task to do. Please try again."
    end
  end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
