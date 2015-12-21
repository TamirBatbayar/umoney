class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user_by_tamir, except: [:index, :show]
  before_action :check_subscribtion, except: [:index]
# before_action :authenticate_user!, except: [:index]
  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/new
  def new
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)

    respond_to do |format|
      if @lesson.save
        format.html { redirect_to @lesson, notice: 'Lesson was successfully created.' }
        format.json { render :show, status: :created, location: @lesson }
      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def check_subscribtion
      begin
        user = User.find(current_user.id)
    rescue
      flash[:notice] = "Please register! Otherwise Erdnee uurlana shuu!!!"
      redirect_to subscribe_path
      else
        if user.approved.to_i == 0
          flash[:notice] = "Please subscribe!!!"
          redirect_to subscribe_path
        end
      end
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:name, :detail, :page_content_id)
    end
  
  # Ene shalguur bol shineer hicheel burtgeh erhtei huniig shalgana. hereglegchiig shalgahgui
  def authorize_user_by_tamir
    if user_signed_in? && !current_user.admin?
      redirect_to new_user_session_path
    end
  end
end
