class CurrentUserController < ApplicationController
  before_action :authenticate_user!
  def index
    
    render json: {
      data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]}
    }
    # debugger if you use this debugger you'll find you can grab the profile with the code below
  end
end
# Profile.find_by(user: current_user)