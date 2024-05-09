class ProfilesController < ApplicationController
    def index 
        profiles = Profile.all

        render json: {
            data: { profiles: ProfileSerializer.new(profiles).serializable_hash[:data].map{|data| data[:attributes]}
        }}
    end
    def show
        profile = Profile.find(params[:id])
        render json: {
            data: { profile: ProfileSerializer.new(profile).serializable_hash[:data][:attributes]}
        }
    end
    def create
        profile = Profile.new(profile_params)
        if profile.save
            render json: {
                data: { profile: ProfileSerializer.new(profile).serializable_hash[:data][:attributes]}
            }
        else 
            render json: profile.errors, status: :unprocessable_entity
        end 
    end
    def update
        profile = Profile.find(params[:id])
        if profile.update(profile_params)
            render json: {
                data: { profile: ProfileSerializer.new(profile).serializable_hash[:data][:attributes]}
            }
        else 
            render json: profile.errors, status: :unprocessable_entity
        end 
    end

    def destroy 
        profile = Profile.find(params[:id])
        if profile.destroy
            render json: nil, status: :ok
        else
            render json: profile.errors, status: :unprocessable_entity
        end

    end

    def departments_index
        profile = Profile.find(params[:id])
        profile_departments = profile.departments
        render json: {
                data: { profile: DepartmentSerializer.new(profile_departments).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
        # render json: profile_departments, status: :ok
    end

    def profile_positions_index
        profile = Profile.find(params[:id])
        profile_positions = profile.positions
        render json: {
                data: { profile: PositionSerializer.new(profile_positions).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
    end

    private
    def profile_params
        params.permit(:employee_number, :first_name, :last_name, :user_id)
    end
end
