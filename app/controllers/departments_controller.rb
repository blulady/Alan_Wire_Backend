class DepartmentsController < ApplicationController

    def index
        departments = Department.all
        render json: {
            data: { departments: DepartmentSerializer.new(departments).serializable_hash[:data].map{|data| data[:attributes]}
        }}
    end

    def show
        department = Department.find(params[:id])
        render json: {
            data: { department: DepartmentSerializer.new(department).serializable_hash[:data][:attributes]}
        }
    end

    # Why you no work? TODO
    def create
        department = Department.new(department_params)
        if department.save
            render json: {
                data: { department: DepartmentSerializer.new(department).serializable_hash[:data][:attributes]}
            }
        else 
            render json: department.errors, status: :unprocessable_entity
        end 
    end

    def update
        department = Department.find(params[:id])
        if department.update(department_params)
            render json: {
                data: { department: DepartmentSerializer.new(department).serializable_hash[:data][:attributes]}
            }
        else 
            render json: department.errors, status: :unprocessable_entity
        end 
    end

    def destroy 
        department = Department.find(params[:id])
        if department.destroy
            render json: nil, status: :ok
        else
            render json: department.errors, status: :unprocessable_entity
        end

    end

    def profiles_index
        department = Department.find(params[:id])
        department_profiles = department.profiles
        render json: {
                data: { profile: ProfileSerializer.new(department_profiles).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
        
    end
    
    def charts_index
        department = Department.find(params[:id])
        department_charts = department.charts
        render json: {
                data: { profile: ChartSerializer.new(department_charts).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
    end

    private 
    def department_params
        params.permit(:department_name)
    end

end
