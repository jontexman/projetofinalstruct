class Api::V1::PublishersController < ApplicationController
    def index
        publishers  = Publisher.all
        render json: publishers
    end
    
    def show
        if Publisher.exists?(params[:id])
            publisher = Publisher.find(params[:id])
            render json: publisher, status: :ok
        else
            render json: {status: 'ERROR', message: 'falha ao mostrar publicadora, id não existente'}, status: :unprocessable_entity
        end
    end

    def show_by_name
        if Publisher.where(name: params[:name]).exists?
            publisher = Publisher.where(name: params[:name])
            render json: publisher, status: :ok
        else
            render json: {status: 'ERROR', message: 'falha ao mostrar publicadora, id não existente'}, status: :unprocessable_entity
        end
    end

    def create
        publisher = Publisher.new(publishers_params)
        if publisher.save
             render json: publisher 
        else
             render json: {status:'ERROR', message: 'falha ao criar publicadora ' }, status: :unprocessable_entity
        end 
    end

    def destroy
        if Publisher.exists?(params[:id])
            publisher = Publisher.find(params[:id])
            if publisher.destroy!
                render json: {status:'SUCESSS', message:'publicadora foi apagada'}, status: :ok
            else
                render json: {status:'ERROR', message:'falha ao apagar publicadora'}, status: :bad_request
            end
        else
            render json: {status: 'ERROR', message: 'falha ao apagar publicadora, id não existente'}, status: :bad_request

        end
        
    end

    def update
        if Publisher.exists?(params[:id])
            publisher = Publisher.find(params[:id])
            if publisher.update(publishers_params)
                render json: publisher, status: :ok
            else
                render json: {status: 'ERROR', message: 'falha ao editar publicadora', data: publisher}, status: :bad_request 
            end    
        else
            render json: {status: 'ERROR', message: 'falha ao editar publicadora, id não existente'}, status: :bad_request
        end    

    end

    
     
    def games_publishers
        if Publisher.exists?(params[:id])
            publisher = Publisher.find(params[:id])
            render json: {name:publisher.name, games:publisher.games}, status: :ok
        
        else
            render json: {status: 'ERROR', message: 'falha ao mostrar publicadora, id não existente'}, status: :unprocessable_entity
        end    
    end
    
    

    private
    def publishers_params
        params.require(:publisher).permit(:name)
    end

end
