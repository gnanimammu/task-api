class TaskSerializer
  include JSONAPI::Serializer
  # attributes 
  attributes :id, :title, :description, :status, :due_date
  belongs_to :user
end
