json.extract! post, :id, :title, :time, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
