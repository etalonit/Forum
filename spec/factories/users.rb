FactoryBot.define do
  factory :user do
    first_name {"firstname"}
    last_name {"lastname"}
    username {"username"}
    about {"lolka"}
    email {"tester@test.com"}
    password {"tester"}
  end
end
