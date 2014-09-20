class Comment < ActiveRecord::Base
belongs_to :post, touch: true
validates_presence_of :post_id
validates_presence_of :body
validates_presence_of :user_id

after_touch do |comment|
	puts "A comment record has been touched!"
end

after_destroy do |comment|
	puts "The comment is successfully removed!"

end

end
