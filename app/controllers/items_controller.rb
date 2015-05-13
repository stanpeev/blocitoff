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

   def destroy
     @user = User.find(params[:user_id])
     @item = Item.find(params[:id])

     authorize @item 

     if @item.destroy
         flash[:notice] = "\"#{@item.name}\" was deleted successfully."
       else
         flash[:error] = "There was an error deleting the item."
       end
 
       respond_to do |format|
           format.html
           format.js
        end
      end

  private

  def item_params
    params.require(:item).permit(:name)
  end
end
