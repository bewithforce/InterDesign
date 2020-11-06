require 'csv'
require 'json'
require 'aws-sdk-s3'

class Api::V1::PhoneController < ApplicationController
  def csv
    Aws::S3::Client.new(
        region: 'eu-central-1',
        access_key_id: 'AKIA6EUXVWM3WMVOJSON',
        secret_access_key: '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'
    )
    resp = s3.get_object(bucket: 'inter-design', key: 'configs.json')
    print resp

    csv_text = open().read

    csv = CSV.parse(csv_text, :headers => true)
    settings_text = File.read('public/configs.json')
    settings = JSON.parse(settings_text)
    csv_text

  end
end
