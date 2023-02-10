class RecipeesController < ApplicationController
  skip_authorization_check only: %i[public show]
  load_and_authorize_resource except: %i[public show]

  def index
    @recipes = Recipee.where(user: current_user).order(created_at: :desc)
  end

  def public
    @recipes = Recipee.includes(:user, :foods).where(public: true)
  end

  def show
    @recipe = Recipee.includes(:user, :foods).find(params[:id])
  end

  def new
    @recipe = Recipee.new
  end

  def create_recipe
    @recipe = Recipee.new(user: current_user, name: recipe_param['name'],
                          public: public?,
                          description: recipe_param['description'],
                          preparation_time: recipe_param['preparation_time'],
                          cooking_time: recipe_param['cooking_time'])
    if @recipe.save
      flash[:notice] = 'Recipe Added Successfully'
      redirect_to recipees_path
    else
      render 'new'
    end
  end

  def destroy
    @recipe = Recipee.find(params[:id])
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipees_path, notice: 'food was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private

  def recipe_param
    params.require(:recipee).permit(:name, :public, :description, :preparation_time, :cooking_time)
  end

  def public?
    params['recipee']['public'] ? true : false
  end
end
