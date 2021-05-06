class CategoryController < ApplicationController
  def index
    categories  = Category.all
    render json: categories
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category
    else
      render json: {status:'ERROR', message: 'falha ao criar categoria' }, status: :unprocessable_entity
    end
  end

  def destroy
    if Category.exists?(params[:id])
      category = Category.find(params[:id])
      if category.destroy!
        render json: {status:'SUCCESS', message:'categoria foi apagada'}, status: :ok
      else
        render json: {status:'ERROR', message:'falha ao apagar categoria'}, status: :bad_request
      end
    else
      render json: {status: 'ERROR', message: 'falha ao apagar categoria, id não existente'}, status: :bad_request

    end

  end

  def update
    if Category.exists?(params[:id])
      category = Category.find(params[:id])
      if category.update(publishers_params)
        render json: category, status: :ok
      else
        render json: {status: 'ERROR', message: 'falha ao editar categoria', data: category}, status: :bad_request
      end
    else
      render json: {status: 'ERROR', message: 'falha ao editar categoria, id não existente'}, status: :bad_request
    end

  end

  private
  def category_params
    params.require(:category).permit(:type)
  end
end
