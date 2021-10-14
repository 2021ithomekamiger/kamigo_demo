class LearnsController < ApplicationController
  before_action :debug_info
  before_action :set_learn, only: [:show, :edit, :update, :destroy]

  # GET /learns
  # GET /learns.json
  def index
    @learns = Learn.all
  end

  # GET /learns/1
  # GET /learns/1.json
  def show
  end

  # GET /learns/new
  def new
    @learn = Learn.new
  end

  # GET /learns/1/edit
  def edit
  end

  # POST /learns
  # POST /learns.json
  def create
    @learn = Learn.new(learn_params)

    respond_to do |format|
      if @learn.save
        @learns = Learn.all
        format.html { redirect_to @learn, notice: 'Learn was successfully created.' }
        format.json { render :show, status: :created, location: @learn }
        format.line { render :index }
      else
        format.html { render :new }
        format.json { render json: @learn.errors, status: :unprocessable_entity }
        format.line { render json: flex_text(@learn.errors.to_s) }
      end
    end
  end

  # PATCH/PUT /learns/1
  # PATCH/PUT /learns/1.json
  def update
    respond_to do |format|
      if @learn.update(learn_params)
        @learns = Learn.all
        format.html { redirect_to @learn, notice: 'Learn was successfully updated.' }
        format.json { render :show, status: :ok, location: @learn }
        format.line { render :index }
      else
        format.html { render :edit }
        format.json { render json: @learn.errors, status: :unprocessable_entity }
        format.line { render json: flex_text(@learn.errors.to_s) }
      end
    end
  end

  # DELETE /learns/1
  # DELETE /learns/1.json
  def destroy
    @learn.destroy
    @learns = Learn.all
    respond_to do |format|
      format.html { redirect_to learns_url, notice: 'Learn was successfully destroyed.' }
      format.json { head :no_content }
      format.line { render :index }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_learn
      @learn = Learn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def learn_params
      {
        keyword: params.dig(:keyword) || params.dig(:learn, :keyword),
        message: params.dig(:message) || params.dig(:learn, :message),
      } 
    end

    def debug_info
      puts ""
      puts "=== kamigo debug info start ==="
      puts "platform_type: #{params[:platform_type]}"
      puts "source_type: #{params[:source_type]}"
      puts "source_group_id: #{params[:source_group_id]}"
      puts "source_user_id: #{params[:source_user_id]}"
      puts "=== kamigo debug info end ==="
      puts ""
    end
end
