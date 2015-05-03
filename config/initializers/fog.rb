  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAIOQPUPVEAIR6ZXNA',
      :aws_secret_access_key  => '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',       # required
    }
    config.fog_directory  = 'waterspot'
    config.fog_public     = false
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}
  end
