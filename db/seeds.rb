# db/seeds.rb
# delete all records
Publication.delete_all
Author.delete_all
Post.delete_all
Comment.delete_all

# Creating Authors
authors = [
  { name: "Alice Smith", email: "alice@example.com" },
  { name: "Bob Johnson", email: "bob@example.com" },
  { name: "Carol Davis", email: "carol@example.com" },
  { name: "David Lee", email: "lee@example.com" }
].map { |author| Author.create!(author) }

# Creating Posts
posts = [
  { title: "Introduction to Rails", body: "Ruby on Rails is a web development framework..." },
  { title: "Getting Started with Rails", body: "Rails is easy to get started with..." },
  { title: "Ruby on Rails 7", body: "New features in Rails 7 include..." },
  { title: "Understanding Active Record", body: "Active Record is the ORM framework in Rails..." },
  { title: "Guide to RSpec", body: "RSpec is a testing tool for Ruby..." }
].map { |post| Post.create!(post) }

# Creating Comments belong to Posts
comments = [
  { content: "Great post!", post: posts[0] },
  { content: "I disagree with some of the points.", post: posts[0] },
  { content: "Looking forward to the next post.", post: posts[1] },
  { content: "I think Rails is the best web framework!", post: posts[2] },
  { content: "What about unit testing?", post: posts[4] },
  { content: "I think unit testing is important.", post: posts[4] }
].map { |comment| Comment.create!(comment) }


# Associating Posts and Comments with Authors
posts.each_with_index do |post, index|
  Publication.create!(publishable: post, author: authors[index % authors.size])
end
comments.each_with_index do |comment, index|
  Publication.create!(publishable: comment, author: authors[index % authors.size])
end

puts "Seeds created!"
