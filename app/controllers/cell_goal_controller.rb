class CellGoalController < ApplicationController
    def new
        @cell = Cell.find(params[:id])
        @cellGoal = CellGoal.new
    end

    def edit
    end

    def editTask
    end

    def createTask
        task = CellTask.new(cell_goal_task_params)
        task.save!
    end

    def updateTask
        CellTask.find(params[:id]).update(:status => true)
    end

    def show
        @cellTask = CellTask.new
        @cellGoal = CellGoal.find(params[:id])
        @users = []
        User.all.each do |user|
            aux = [user.name, user.id]
            @users.push(aux)
        end
    end

    def create
        @cellGoal = CellGoal.new(cell_goal_params)
        @cellGoal.save
    end

    def update
        respond_to do |format|
          if @cellGoal.update(cell_goal_params)
            format.html { redirect_to @cellGoal, notice: 'Cell goal was successfully updated.' }
            format.json { render :show, status: :ok, location: @cellGoal }
          else
            format.html { render :edit }
            format.json { render json: @cellGoal.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @cellGoal.destroy
        respond_to do |format|
          format.html { redirect_to cell_goals_url, notice: 'Cell goal was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private

    def cell_goal_task_params
        params.permit(:description, :status, :cell_goal_id, :user_id)
    end

    def cell_goal_params
        params.permit(:title, :description, :status, :cell_id)
    end
end