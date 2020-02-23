class IdeasController < ApplicationController
  before_action :set_idea, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:create, :edit, :update, :destroy, :new]

  # GET /ideas
  # GET /ideas.json
  def index
    @ideas = Idea.all
  end

  # GET /ideas/1
  # GET /ideas/1.json
  def show
  end

  # GET /ideas/new
  def new
    @idea = Idea.new
  end

  # GET /ideas/1/edit
  def edit
  end

  # POST /ideas
  # POST /ideas.json
  def create
    @idea = current_user.ideas.new(idea_params)
    
    respond_to do |format|
      if @idea.save
        format.html { redirect_to @idea, notice: 'Idea was successfully created.' }
        format.json { render :show, status: :created, location: @idea }
      else
        format.html { render :new }
        format.json { render json: @idea.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ideas/1
  # PATCH/PUT /ideas/1.json
  def update
    if current_user == @idea.user
      respond_to do |format|
        if @idea.update(idea_params)
          format.html { redirect_to @idea, notice: 'Idea was successfully updated.' }
          format.json { render :show, status: :ok, location: @idea }
        else
          format.html { render :edit }
          format.json { render json: @idea.errors, status: :unprocessable_entity }
        end
      end
    else
      format.html { redirect_to @idea, notice: 'You can not edit someone elses idea.' }
      format.json { render json: @idea.errors, status: :unauthorize }
    end
  end

  # DELETE /ideas/1
  # DELETE /ideas/1.json
  def destroy
    if current_user == @idea.user
      @idea.destroy
      respond_to do |format|
        format.html { redirect_to ideas_url, notice: 'Idea was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      format.html { redirect_to @idea, notice: 'You can not delete an someones elses idea.' }
      format.json { render json: @idea.errors, status: :unauthorize }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_idea
      @idea = Idea.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def idea_params
      params.require(:idea).permit(:title, :description, :resources, :inspiration, :image, :user_id)
    end
end
