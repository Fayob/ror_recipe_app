class FoodsController < ApplicationController
  load_and_authorize_resource

  def index
    @foods = Food.where(user: current_user)
  end

  def new
    @food = Food.new
  end

  def create_food
    
    @food = Food.new(user: current_user, name: food_param['name'],
                     measurement_unit: food_param['measurement_unit'],
                     price: food_param['price'], quantity: food_param['quantity'])

    
    if @food.save
      flash[:notice] = 'Food Added Successfully'
      redirect_to foods_path
    else
      render 'new'
    end
  end

  def destroy
    Food.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to foods_path, notice: 'food was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def food_param
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
