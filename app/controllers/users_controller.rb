class UsersController < ApplicationController
  def avatar
    params.require(:users).permit(:email, :password, :photo, :first_name, last_name:)
  end
end
