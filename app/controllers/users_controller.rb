class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @tasks = current_user.tasks
  end

end
