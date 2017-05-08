class UsersController < ApplicationController
  has_scope :zip, :user, :city, :fullname, :address, :city, :customer

  def show
    @user = current_user
    @leads = apply_scopes(Lead).where(:user_id => @user.id).order(created_at: :desc).paginate(:page => params[:page], :per_page => 10)
    @events = Event.where(:user_id => @user).where(start: Date.today.beginning_of_week..Date.today.beginning_of_week+7).order(start: :asc)
  end
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :first_name, :last_name)
  end
end
