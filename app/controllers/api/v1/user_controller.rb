class Api::V1::UserController < ApplicationController
    acts_as_token_authentication_handler_for User, only: [:update,:destroy]

    def login 
        if User.exists?(email: params[:email])

            user = User.find_by(email: params[:email])

            if user.valid_password?(params[:password])

                render json: user.as_json(only: %i[name email authentication_token is_Admin])

            else
                head(status :unauthorazied)
            end
        else
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :not_found
        end
    end

    def create
        user = User.new(user_params)
        
        if user.save!
            render json: user, status: :created
        else
            render json: {data:'ERROR', mesage:'Falha ao criar o usario'}, status: :unprocessable_entity
            
        end

    end

    def update
        if User.exists?(id: params[:id])
            user = User.find(params[:id])
            if user.update(user_params)
                render json:user, status: :ok
            else
                render json:{data:'ERROR',mesage:'Falha ao atualizar o usuario'}, status: :bad_request
            end
        else
            render json:{data:'ERROR',mesage:'Usuario inexistente'}, status: :not_found
        end

    end

    def destroy
        if User.exists?(id: params[:id])
            user = User.find(params[:id])
            if user.destroy!
                render json:{data:'SUCCESS',mesage:'Usuario deletado com sucesso!'}, status: :ok
            else
                render json:{data:'ERROR',mesage:'Falha ao deletar usuario'}, status: :bad_request
            end
        else
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :not_found
        end

    end

    def show
        if User.exists?(id: params[:id])
            user = User.find(params[:id])
            render json: user, status: :ok
        else    
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :unprocessable_entity
        end
    end

    def create_library
        if User.exists?(id: params[:id])
            if Game.exists?(params[:id])
                game = Game.find(params[:id])
                library = User.library
                library.push(game)
                render json: game, status: :ok, include: :categories
              else
                render json: {status: 'ERROR', message: 'Falha ao mostrar jogo, id não existente'}, status: :unprocessable_entity
              end
            end
        else    
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :unprocessable_entity
        end
    end

    def show_library
        if User.exists?(id: params[:id])
            user = User.find(params[:id])
            render json: { games:User.games}, status: :ok 
        else    
            render json: {data:'ERROR',mesage:'Usuario nao existe'}, status: :unprocessable_entity
        end
    end

    private
    
    def user_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation)
    end
end
