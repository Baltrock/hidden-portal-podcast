class PersonalitiesController < ApplicationController
  before_action :set_personality, only: %i[ show edit update destroy ]

  # GET /personalities or /personalities.json
  def index
    @personalities = Personality.all
  end

  # GET /personalities/1 or /personalities/1.json
  def show
  end

  # GET /personalities/new
  def new
    @personality = Personality.new
  end

  # GET /personalities/1/edit
  def edit
  end

  # POST /personalities or /personalities.json
  def create
    @personality = Personality.new(personality_params)

    respond_to do |format|
      if @personality.save
        format.html { redirect_to user_root_url(@primary), notice: "Profile was successfully created." }
        format.json { render :primary, status: :created, location: @user_root }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @personality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /personalities/1 or /personalities/1.json
  def update
    respond_to do |format|
      if @personality.update(personality_params)
        format.html { redirect_to personality_url(@personality), notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @personality }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @personality.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /personalities/1 or /personalities/1.json
  def destroy
    @personality.destroy

    respond_to do |format|
      format.html { redirect_to personalities_url, notice: "Personality was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_personality
      @personality = Personality.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def personality_params
      params.require(:personality).permit(:first_name, :last_name, :email, :contact_number)
    end
end
