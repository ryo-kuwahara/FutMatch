require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
 
CarrierWave.configure do |config|
#   if Rails.env.production?
    config.storage :fog
    config.fog_provider = 'fog/aws'
    config.fog_directory  = 'futmatch-bucket'
    config.fog_credentials = {
      provider: 'AWS',
      # aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      # aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], 
      aws_access_key_id: "AKIAJ2R5CRC23QA4F7HQ",
      aws_secret_access_key: "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",
      
      region: "ap-northeast-1",
      path_style: true
    }
#   else
#     config.storage :file
#     config.enable_processing = false if Rails.env.test?
#   end
end
 
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/