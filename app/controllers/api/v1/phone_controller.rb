require 'csv'
require 'json'
require 'aws-sdk-s3'

class Api::V1::PhoneController < ApplicationController
  skip_before_action :verify_authenticity_token

  def initialize
    super
    @s3 = Aws::S3::Client.new(
        region: 'eu-central-1',
        access_key_id: 'AKIA6EUXVWM36ARXUKXN',
        secret_access_key: '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'
    )
  end

  def csv
    key = params[:key]
    value = params[:value]

    settings = JSON.parse(@s3.get_object(bucket: 'inter-design', key: 'configs.json').body.read)

    puts settings

    settings = settings.select { |e| e['key'].to_s == key.to_s }

    if settings.length == 0
      render json: {}
      return
    end
    settings = settings[0]

    primary = settings['primary']
    access = settings['access']
    selected_row = []

    csv = CSV.parse(@s3.get_object(bucket: 'inter-design', key: 'table.csv').body.read)

    for i in 0..csv.length - 1 do
      if csv[i][primary].to_s == value
        selected_row = csv[i]
        break
      end
    end

    to_return = {'data': []}
    if selected_row.length != 0
      access.each do |n|
        to_return[:data].push(selected_row[n])
      end
    end

    render json: to_return
  end

  def save_settings
    new_settings = params[:_json].as_json.to_json
    @s3.delete_object(bucket: 'inter-design', key: 'configs.json')
    @s3.put_object(bucket: 'inter-design', key: 'configs.json', body: new_settings)
  end

  def load_settings
    settings = @s3.get_object(bucket: 'inter-design', key: 'configs.json').body.read
    render json: settings
  end

  def save_file
    new_file = params[:csv]
    puts new_file
    @s3.delete_object(bucket: 'inter-design', key: 'table.csv')
    @s3.put_object(bucket: 'inter-design', key: 'table.csv', body: new_file)
  end
end
