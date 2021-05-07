class Api::V1::GameController < ApplicationController
  def index
    games  = Game.all
    render json: games
  end
  def create
    game = Game.new(game_params)
    if game.save
      render json: game
    else
      render json: {status:'ERROR', message: 'falha ao criar jogo' }, status: :unprocessable_entity
    end
  end

  def destroy
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

  end

  def update
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

  end
  private
  def game_params
    params.require(:game).permit(:name, :price, :category, :publisher, :description, :picture, :trailer)
  end
end
