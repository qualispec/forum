FactoryGirl.define do
  factory :user do
    sequence(:username)   { |n| "User_#{n}" }
    sequence(:email)      { |n| "User_#{n}@gmail.com" }
    password              "asdfasdf"
    password_confirmation "asdfasdf"
  end

  factory :board do
    sequence(:title)      { |n| "Board_#{n}" }
    sequence(:body)       { |n| "Board_#{n}" }
  end

  factory :post do
    sequence(:title)      { |n| "Post_#{n}" }
    sequence(:body)       { |n| "Post_#{n}" }
    user_id               1
  end

  factory :reply do
    sequence(:body)       { |n| "Reply_#{n}" }
  end

  factory :messages do
    sequence(:body)       { |n| "Message_#{n}" }
    receiver_id           1
  end
end