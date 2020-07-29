class UsersController < ApplicationController


  def create
  end

  def index
    @users=User.all
    @member=Member.new
  end

  def show
    #@members=@user.members
    @user=User.find(params[:id])
    @member=Member.new
    @members=@user.members
    end

  def edit
    @user=User.find(params[:id])
    if @user!=current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user=User.find(params[:id])
    if @user=User.update(user_params)
       redirect_to user_path(current_user)
    else
       render "edit"
    end
  end

  def destroy
    @user=User.find(params[:id])
    @user=User.destroy

  end

  private
  def  user_params
    params.require(:user).permit(:name, :introduction, :profile_image_id)
  end
end
