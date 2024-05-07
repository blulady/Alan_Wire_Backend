class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    render json: {
      data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]}
    }
    
  end
end
