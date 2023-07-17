class UsersController < ApplicationController
  # before_action :set_information_form, only: %i[ create show edit update destroy ]

  # GET /information_forms or /information_forms.json
  def primary

  end

  # GET /user/1 or /user/1.json

  def show

  end

  def user
  end

  # GET /user/new
  def new
    @user = User.new
  end

  # GET /user/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    user = User.create(user_params)
    session[:user_id] = user.id
    render json:user, status: :created

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user) }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to user_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name)
      params.permit(:username, :password, :password_confirmation)
    end
end
