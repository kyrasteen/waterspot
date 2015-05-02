  CarrierWave.configure do |config|
    config.fog_credentials = {
      :provider               => 'AWS',       # required
      :aws_access_key_id      => 'AKIAIOQPUPVEAIR6ZXNA',       # required
      :aws_secret_access_key  => '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',       # required
    }
    config.fog_directory  = 'waterspot'                     # required
    config.fog_public     = false                                   # optional, defaults to true
    config.fog_attributes = {'Cache-Control'=>'max-age=315576000'}  # optional, defaults to {}
  end
