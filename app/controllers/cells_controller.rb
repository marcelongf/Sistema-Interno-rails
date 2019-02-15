class CellsController < ApplicationController
  before_action :set_cell, only: [:show, :edit, :update, :destroy]
  before_action :set_managers, only: [:new, :edit]
  before_action :set_directorships, only: [:new, :edit]

  # GET /cells
  # GET /cells.json
  def index
    @cells = Cell.all
  end


  # GET /cells/1
  # GET /cells/1.json
  def show
    @users = User.all
  end

  # GET /cells/new
  def new
    @cell = Cell.new
  end

  # GET /cells/1/edit
  def edit
  end

  # POST /cells
  # POST /cells.json
  def create
    @cell = Cell.new(cell_params)

    respond_to do |format|
      if @cell.save
        format.html { redirect_to @cell, notice: 'Cell was successfully created.' }
        format.json { render :show, status: :created, location: @cell }
      else
        format.html { render :new }
        format.json { render json: @cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cells/1
  # PATCH/PUT /cells/1.json
  def update
    respond_to do |format|
      if @cell.update(cell_params)
        format.html { redirect_to @cell, notice: 'Cell was successfully updated.' }
        format.json { render :show, status: :ok, location: @cell }
      else
        format.html { render :edit }
        format.json { render json: @cell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cells/1
  # DELETE /cells/1.json
  def destroy
    @cell.destroy
    respond_to do |format|
      format.html { redirect_to cells_url, notice: 'Cell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cell
      @cell = Cell.find(params[:id])
    end

    def set_managers
      @managers = []
      User.where(kind: "cell_manager").each do |manager|
        aux = [manager.name, manager.id]
        @managers.push(aux)
      end
    end

    def set_directorships
      @directorships = []
      Directorship.all.each do |dir|
        aux = [dir.name, dir.id]
        @directorships.push(aux)
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cell_params
      params.require(:cell).permit(:name, :manager, :directorship_id)
    end
end
