CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
    region: 'ap-northeast-1',
    path_style: true
  }

    case Rails.env
    when 'development'
        config.fog_directory  = 'upload-chatspace-images'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/upload-chatspace-images'
    when 'production'
        config.fog_directory  = 'upload-chatspace-images'
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/upload-chatspace-images'
    end
end
