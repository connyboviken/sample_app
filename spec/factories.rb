FactoryGirl.define do
  factory :user do
    name     "Conny Eriksson"
    email    "conny@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end