class DirectorshipsController < ApplicationController
  before_action :set_directorship, only: [:show, :edit, :update, :destroy]
  before_action :set_directors, only: [:new, :edit]

  # GET /directorships
  # GET /directorships.json
  def index
    @directorships = Directorship.all
  end


  # GET /directorships/1
  # GET /directorships/1.json
  def show
    @users = User.all
  end

  # GET /directorships/new
  def new
    @directorship = Directorship.new
  end

  # GET /directorships/1/edit
  def edit
  end

  # POST /directorships
  # POST /directorships.json
  def create
    @directorship = Directorship.new(directorship_params)

    respond_to do |format|
      if @directorship.save
        format.html { redirect_to @directorship, notice: 'Directorship was successfully created.' }
        format.json { render :show, status: :created, location: @directorship }
      else
        format.html { render :new }
        format.json { render json: @directorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /directorships/1
  # PATCH/PUT /directorships/1.json
  def update
    respond_to do |format|
      if @directorship.update(directorship_params)
        format.html { redirect_to @directorship, notice: 'Directorship was successfully updated.' }
        format.json { render :show, status: :ok, location: @directorship }
      else
        format.html { render :edit }
        format.json { render json: @directorship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /directorships/1
  # DELETE /directorships/1.json
  def destroy
    @directorship.destroy
    respond_to do |format|
      format.html { redirect_to directorships_url, notice: 'Directorship was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_directorship
      @directorship = Directorship.find(params[:id])
    end

    def set_directors
      @directors = []
      User.where(kind: 'director').each do |director|
        aux = [director.name, director.id]
        @directors.push(aux)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def directorship_params
      params.require(:directorship).permit(:name, :director)
    end
end
