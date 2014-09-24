class GeneralCallbacks
	def after_validation(comment) # the argument representing record must be provided!
		puts "This is an after_validation callback!"
	end
	def after_commit(comment)
		puts "This is an after_commit callback!"
	end
	def after_rollback(comment)
		puts "This is an after_rollback callback!"
	end
	def after_update(comment)
		puts "This is an after_update callback!"
	end
end

class Comment < ActiveRecord::Base
belongs_to :post, touch: true, inverse_of: :comments
validates :post_id, :body, :user_id, presence: true, allow_blank: false

after_touch do |comment|
	puts "A comment record has been touched!"
end

after_validation GeneralCallbacks.new
after_commit GeneralCallbacks.new
after_rollback GeneralCallbacks.new
after_update GeneralCallbacks.new
end

