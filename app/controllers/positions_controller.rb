class PositionsController < ApplicationController
    def index
        positions = Position.all
        render json: {
            data: { positions: PositionSerializer.new(positions).serializable_hash[:data].map{|data| data[:attributes]}
        }}
    end

    def show
        position = Position.find(params[:id])
        render json: {
            data: { position: PositionSerializer.new(position).serializable_hash[:data][:attributes]}
        }
    end

    # Why you no work? TODO
    def create
        position = Position.new(position_params)
        if position.save
            render json: {
                data: { position: PositionSerializer.new(position).serializable_hash[:data][:attributes]}
            }
        else 
            render json: position.errors, status: :unprocessable_entity
        end 
    end

    def update
        position = Position.find(params[:id])
        if position.update(position_params)
            render json: {
                data: { position: PositionSerializer.new(position).serializable_hash[:data][:attributes]}
            }
        else 
            render json: position.errors, status: :unprocessable_entity
        end 
    end

    def destroy 
        position = Position.find(params[:id])
        if position.destroy
            render json: nil, status: :ok
        else
            render json: position.errors, status: :unprocessable_entity
        end

    end

    def position_profiles_index
        position = Position.find(params[:id])
        position_profiles = position.profiles
        render json: {
                data: { profile: ProfileSerializer.new(position_profiles).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
        
    end

    private 
    def position_params
        params.permit(:position_title)
    end
end
