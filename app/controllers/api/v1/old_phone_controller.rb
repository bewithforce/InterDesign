require 'csv'
require 'json'
require 'aws-sdk-s3'

class Api::V1::OldPhoneController < ApplicationController

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

        keys = JSON.parse(@s3.get_object(bucket: 'inter-design', key: 'keys.json').body.read)
        keys = keys.select { |e|
            e['phoneNumber'].to_s.include? key.to_s
        }
        if keys.length == 0
            render json: {}
            return
        end
        group = keys[0]['group']

        settings = JSON.parse(@s3.get_object(bucket: 'inter-design', key: 'configs.json').body.read)
        settings = settings.select { |e|
            e['group'].to_s == group.to_s
        }
        if settings.length == 0
            render json: {}
            return
        end
        settings = settings[0]

        primary = settings['primary']
        access = settings['access']
        selected_rows = []

        csv = CSV.parse(@s3.get_object(bucket: 'inter-design', key: 'table.csv').body.read)

        csv.each do |row|
            if row[primary].to_s.include?(value)
                selected_rows.push(row)
            end
        end

        to_return = {'data': []}
        selected_rows.each do |row|
            if row.length != 0
                entry = []
                access.each do |n|
                    entry.push(row[n])
                end
                to_return[:data].push(entry)
            end
        end


        render json: to_return
    end

end
