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

    def find_by_name
        profile = Profile.find_by(first_name: params[:name])
        
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

    def add_department
        profile = Profile.find(params[:id])
        department = Department.find(params[:department_id])

        if profile.departments.include?(department)
            render json: { error: 'Profile already has this department' }, status: :unprocessable_entity
        else
            profile.departments << department
            render json: { message: 'Department added to profile successfully' }, status: :ok
        end
    end

    def profile_positions_index
        profile = Profile.find(params[:id])
        profile_positions = profile.positions
        render json: {
                data: { profile: PositionSerializer.new(profile_positions).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
    end

    def add_position
        profile = Profile.find(params[:id])
        position = Position.find(params[:position_id])
        if profile.positions.include?(position)
            render json: { error: 'Profile already has this position' }, status: :unprocessable_entity
        else
            profile.positions << position
            render json: { message: 'Position added to profile successfully' }, status: :ok
        end
    end

    def profile_charts_index
        profile = Profile.find(params[:id])
        profile_charts = profile.charts
        render json: {
                data: { profile: ChartSerializer.new(profile_charts).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
    end

    # not tested
    # def add_chart
    #     profile = Profile.find(params[:id])
    #     chart = Chart.find(params[:chart_id])
    #     if profile.charts.include?(chart)
    #         render json: { error: 'Profile already has this chart' }, status: :unprocessable_entity
    #     else
    #         profile.charts << chart
    #         render json: { message: 'Chart added to profile successfully' }, status: :ok
    #     end
    # end

    private
    def profile_params
        params.require(:profile).permit(:employee_number, :first_name, :last_name, :user_id, :is_admin)
    end
      
end
