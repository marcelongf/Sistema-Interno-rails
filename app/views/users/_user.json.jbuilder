json.extract! user, :id, :name, :gp_director, :project_director, :cell_id, :directorship_id, :created_at, :updated_at
json.url user_url(user, format: :json)
