class PostValidator < ActiveModel::EachValidator
	def validate(record)
		record.errors[:title] << "Must started with a capital letter!" unless record.title =~ /\A[A-Z]/ 
	end
end


class Post < ActiveRecord::Base
#include ActiveModel::Validations
has_many :comments, dependent: :destroy
validates :title, presence: true
validates :body, length: {maximum: 15}, allow_blank: false

# after_find do |post|
# 	puts "Hello, you find post No.#{post.id}!"
# end

# after_initialize do |post|
# 	puts "Hello, you have initialized a new record!"
# end

# after_touch do |post|
# 	puts "Hello, you just touch a post record!"
# end
end

