class Task < ApplicationRecord
	enum status: { pending: 'pending', in_progress: 'in_progress', completed: 'completed' }
	validates :title, presence: true
	validates :status, presence: true
	validates :due_date, presence: true
	# belongs_to :user
end
