FactoryGirl.define do
  factory :idea do
    title "Great Idea"
    description "Description of great idea"
end

  factory :user do
    username "marina"
    password "abcdefgh"
    password_confirmation "abcdefgh"
  end
end
