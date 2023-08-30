class UsersController < ApplicationController
  def avatar
    params.require(:article).permit(:title, :body, :photo)
  end
end
