class UsersController < ApplicationController
  def avatar
    params.require(:users).permit(:email, :password, :avatar, :first_name, last_name:)
  end
end
