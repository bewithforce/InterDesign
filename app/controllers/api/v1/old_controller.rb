class Api::V1::OldController < ApplicationController
    skip_before_action :verify_authenticity_token

    def initialize
        super
        @s3 = Aws::S3::Client.new(
            region: 'eu-central-1',
            access_key_id: 'AKIA6EUXVWM36ARXUKXN',
            secret_access_key: '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'
        )
    end

    def save_settings
        new_settings = params[:_json].gsub '\"', '"'
        @s3.delete_object(bucket: 'inter-design', key: 'configs.json')
        @s3.put_object(bucket: 'inter-design', key: 'configs.json', body: new_settings)
    end

    def load_settings
        settings = @s3.get_object(bucket: 'inter-design', key: 'configs.json').body.read
        render json: settings
    end

    def save_keys
        new_keys = params[:_json].gsub '\"', '"'
        @s3.delete_object(bucket: 'inter-design', key: 'keys.json')
        @s3.put_object(bucket: 'inter-design', key: 'keys.json', body: new_keys)
    end

    def load_keys
        keys = @s3.get_object(bucket: 'inter-design', key: 'keys.json').body.read
        render json: keys
    end


    def save_file
        new_file = params[:file]
        @s3.delete_object(bucket: 'inter-design', key: 'table.csv')
        @s3.put_object(bucket: 'inter-design', key: 'table.csv', body: new_file)
    end
end
