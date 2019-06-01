FactoryBot.define do
  factory :user do
    first_name {"firstname"}
    last_name {"lastname"}
    username {"username"}
    about {"lolka"}
    avatar { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/noavatar.png'), 'image/png') }
    email {"tester@test.com"}
    password {"tester"}
  end
end
