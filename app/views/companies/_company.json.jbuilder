json.extract! company, :id, :name, :website_url, :status, :created_at, :updated_at
json.url company_url(company, format: :json)
