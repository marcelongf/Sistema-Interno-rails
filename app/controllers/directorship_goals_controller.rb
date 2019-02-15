class DirectorshipGoalsController < ApplicationController
    def new
        @directorship = Directorship.find(params[:id])
        @directorshipGoal = DirectorshipGoal.new
    end

    def edit
    end

    def editTask
    end

    def createTask
        task = DirectorshipTask.new(directorship_goal_task_params)
        task.save!
    end

    def show
        @directorshipTask = DirectorshipTask.new
        @directorshipGoal = DirectorshipGoal.find(params[:id])
        @users = []
        User.all.each do |user|
            aux = [user.name, user.id]
            @users.push(aux)
        end
    end

    def create
        @directorshipGoal = DirectorshipGoal.new(directorship_goal_params)
        @directorshipGoal.save
    end

    def update
        respond_to do |format|
          if @directorshipGoal.update(directorship_goal_params)
            format.html { redirect_to @directorshipGoal, notice: 'Directorship goal was successfully updated.' }
            format.json { render :show, status: :ok, location: @directorshipGoal }
          else
            format.html { render :edit }
            format.json { render json: @directorshipGoal.errors, status: :unprocessable_entity }
          end
        end
    end

    def destroy
        @directorshipGoal.destroy
        respond_to do |format|
          format.html { redirect_to directorship_goals_url, notice: 'Directorship goal was successfully destroyed.' }
          format.json { head :no_content }
        end
    end

    private

    def directorship_goal_task_params
        params.permit(:description, :status, :directorship_goal_id, :user_id)
    end

    def directorship_goal_params
        params.permit(:title, :description, :status, :directorship_id)
    end
end