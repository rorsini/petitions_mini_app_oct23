json.extract! petition, :id, :title, :slug, :body, :signatures, :created_at, :updated_at
json.url petition_url(petition, format: :json)
