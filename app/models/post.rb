class ForFunValidator < ActiveModel::EachValidator
	def validate_each(record, attribute, value)
		record.errors[attribute] << "Must started with a capital letter!" unless value =~ /\A[A-Z]/ 
	end
end


class Post < ActiveRecord::Base
#include ActiveModel::Validations
has_many :comments, dependent: :destroy, inverse_of: :post
validates :title, presence: true, for_fun: true
validates :body, length: {maximum: 25}, allow_blank: false, for_fun: true
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

