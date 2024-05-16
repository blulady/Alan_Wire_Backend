class ChartsController < ApplicationController
    def index
        charts = Chart.all
        render json: {
            data: { charts: ChartSerializer.new(charts).serializable_hash[:data].map{|data| data[:attributes]}
        }}
    end

    def show
        chart = Chart.find(params[:id])
        render json: {
            data: { chart: ChartSerializer.new(chart).serializable_hash[:data][:attributes]}
        }
    end

    # Why you no work? TODO
    def create
        chart = Chart.new(chart_params)
        if chart.save
            render json: {
                data: { chart: ChartSerializer.new(chart).serializable_hash[:data][:attributes]}
            }
        else 
            render json: chart.errors, status: :unprocessable_entity
        end 
    end

    def update
        chart = Chart.find(params[:id])
        if chart.update(chart_params)
            render json: {
                data: { chart: ChartSerializer.new(chart).serializable_hash[:data][:attributes]}
            }
        else 
            render json: chart.errors, status: :unprocessable_entity
        end 
    end

    def destroy 
        chart = Chart.find(params[:id])
        if chart.destroy
            render json: nil, status: :ok
        else
            render json: chart.errors, status: :unprocessable_entity
        end

    end

    def chart_profiles_index
        chart = Chart.find(params[:id])
        chart_profiles = chart.profiles
        render json: {
                data: { profile: ProfileSerializer.new(chart_profiles).serializable_hash[:data].map{|data| data[:attributes]}
            }
        }
        
    end

    private 
    def chart_params
        params.permit(:chart_title, :chart_data)
    end
end
