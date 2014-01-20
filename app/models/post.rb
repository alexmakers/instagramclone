class Post < ActiveRecord::Base
  has_many :comments
  has_attached_file :image, 
                    styles: { thumb: "300x300>" },
                    storage: :s3,
                    s3_credentials: {
                      access_key_id: 'AKIAJPD4QQS6C5BNQF5Q',
                      secret_access_key: Rails.application.secrets.s3_secret
                    },
                    bucket: 'instgram_clone_dev'
end