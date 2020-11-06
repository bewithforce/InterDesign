require 'csv'
require 'json'
require 'aws-sdk-s3'

class Api::V1::PhoneController < ApplicationController
  def csv
    s3 = Aws::S3::Client.new(
        region: 'eu-central-1',
        access_key_id: 'AKIA6EUXVWM3WMVOJSON',
        secret_access_key: '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'
    )
    key = params[:key]
    value = params[:value]

    settings = JSON.parse(s3.get_object(bucket: 'inter-design', key: 'configs.json').body.read)
    settings = settings['settings']
    settings = settings.select { |e| e['key'].to_s == key.to_s }[0]

    primary = settings['primary']
    access = settings['access']
    selected_row = []

    csv = CSV.parse(s3.get_object(bucket: 'inter-design', key: 'table.csv').body.read)


    for i in 0..csv.length() - 1 do
      if csv[i][primary].to_s == value
        selected_row = csv[i]
        break
      end
    end

    to_return = {'data': []}
    if selected_row.length() != 0
      access.each do |n|
        to_return[:data].push(selected_row[n])
      end
    end

    puts to_return

    render json: to_return

  end
end
