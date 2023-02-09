class RecipesController < ApplicationController
  # load_and_authorize_resource

  def index
    @recipes = Recipee.where(user: current_user)
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

  def create
    @recipe = Recipee.new(user: current_user, name: recipe_param['name'],
                          public: public?,
                          description: recipe_param['description'],
                          preparation_time: recipe_param['preparation_time'],
                          cooking_time: recipe_param['cooking_time'])
    if @recipe.save
      flash[:notice] = 'Recipe Added Successfully'
      redirect_to recipes_path
    else
      render 'new'
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
