FactoryGirl.define do
  factory :post do
    title "Post Title"
    body "Post bodies must be pretty long."
    user
    topic { Topic.create(name: 'Topic name', description: 'This is my topic description.') }
  end
end