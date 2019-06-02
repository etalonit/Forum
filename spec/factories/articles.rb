FactoryBot.define do
  factory :article do
    user_id {1}
    title {"title"}
    content {"content"}
    image { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/noavatar.png'), 'image/png')}
    #audio { Rack::Test::UploadedFile.new(Rails.root.join('/app/assets/songs/warofchange.mp3'), 'audio/mp3')}
  end
end
