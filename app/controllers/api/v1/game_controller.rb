class Api::V1::GameController < ApplicationController
  acts_as_token_authentication_handler_for User, only: [:create, :update, :destroy]
  #before_action :authenticate_user!



  def index
    games  = Game.all
    render json: games
  end


    def create
        if current_user.is_Admin
        game = Game.new(game_params)
        if game.save
          render json: game
        else
          render json: {status:'ERROR', message: 'falha ao criar jogo' }, status: :unprocessable_entity
        end
      else
        render json: {status:"ERROR", message: 'usuario noa é admin'}, status: :bad_request

      end
    end

    def destroy
      if current_user.is_Admin
        if Game.exists?(params[:id])
          game = Game.find(params[:id])
          if game.destroy!
            render json: {status:'SUCCESS', message:'jogo foi apagado'}, status: :ok
          else
            render json: {status:'ERROR', message:'falha ao apagar jogo'}, status: :bad_request
          end
        else
          render json: {status: 'ERROR', message: 'falha ao apagar jogo, id não existente'}, status: :bad_request
        end
      else
        render json: {status:"ERROR", message: 'usuario noa é admin'}, status: :bad_request
      end
    end

    def update
      if current_user.is_Admin
        if Game.exists?(params[:id])
          game = Game.find(params[:id])
          if game.update(game_params)
            render json: game, status: :ok
          else
            render json: {status: 'ERROR', message: 'falha ao editar jogo', data: game}, status: :bad_request
          end
        else
          render json: {status: 'ERROR', message: 'falha ao editar jogo, id não existente'}, status: :bad_request
        end
      else
      render json: {status:"ERROR", message: 'usuario noa é admin'}, status: :bad_request
      end
    end
  def show
    if Game.exists?(params[:id])
      game = Game.find(params[:id])
      render json: game, status: :ok, include: :categories
    else
      render json: {status: 'ERROR', message: 'falha ao mostrar jogo, id não existente'}, status: :unprocessable_entity
    end
  end

  def show_by_publisher
    if Game.where(publisher_id: params[:id]).exists?
        game = Game.where(publisher_id: params[:id])
        render json: game, status: :ok
    else
        render json: {status: 'ERROR', message: 'falha ao mostrar game, id não existente'}, status: :unprocessable_entity
    end
end

  private
  def game_params
    params.require(:game).permit(:name, :price, :category, :publisher_id, :description, :picture, :trailer)
  end
end