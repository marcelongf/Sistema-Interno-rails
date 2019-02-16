class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :skilltree]
  before_action :allow_only_gp, only: [:new, :create]
  before_action :set_cells, only: [:new, :edit]
  before_action :set_directorships, only: [:new, :edit]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    ongoing_projects = Project.where(status: false)
    @user_projects = []
    ongoing_projects.each do |proj|
      if proj.users_id.include?(@user.id)
        @user_projects.push(proj)
      end
    end
    @user_ex_projects = []
    finished_prjects = Project.where(status: true)
    finished_prjects.each do |proj|
      if proj.users.include?(@user)
        @user_ex_projects.push(proj)
      end
    end

  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end


  def myTasks
    cell_tasks = CellTask.where(user_id: current_user.id)
    @undone_cell_tasks = cell_tasks.where(status: false)
    @done_cell_tasks = cell_tasks.where(status: true)
    dir_tasks = DirectorshipTask.where(user_id: current_user.id)
    @undone_dir_tasks = dir_tasks.where(status: false)
    @done_dir_tasks = dir_tasks.where(status: false)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @user.password = '1234567'
    @user.password_confirmation = '1234567'
    if @user.save 
      redirect_to root_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def skilltree
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :name, :kind, :cell_id, :directorship_id)
    end

    def allow_only_gp
      unless current_user.kind == 'gp_director'
        redirect_to root_path
      end
    end

    def set_cells
      @cells = []
      Cell.all.each do |cell|
        aux = [cell.name, cell.id]
        @cells.push(aux)
      end
    end

    def set_directorships
      @directorships = []
      Directorship.all.each do |dir|
        aux = [dir.name, dir.id]
        @directorships.push(aux)
      end
    end
end
