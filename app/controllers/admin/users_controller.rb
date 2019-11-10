class Admin::UsersController < AdminController

  def index
    load_users
  end

  def show
    load_user
  end

  def edit
    load_user
  end

  def update
    load_user
    update_user or render :edit
  end

  def destroy
    load_user
    destroy_user
  end

  private

  def destroy_user
    @user.destroy
    redirect_to admin_users_path, notice: "user successfully deleted."
  end

  def update_user
    if @user.update_attributes(user_params)
      redirect_to admin_user_path, notice: "user successfully updated."
    else
      false
    end
  end

  def load_users
    @users = User.all
  end

  def load_user
    @user = User.find(params[:id])
  end

  def user_params
    return {} unless params[:user]

    params.require(:user)
          .permit(:first_name, :last_name)
  end

end
