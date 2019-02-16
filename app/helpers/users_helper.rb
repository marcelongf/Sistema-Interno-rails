module UsersHelper
    def projects_of_current_user
        proj_users = ProjectUser.where(user_id: current_user.id)
        projs = []
        proj_users.each do |p_u|
            projs.push(Project.find(p_u.project_id))
        end
        return projs
    end
end
