# frozen_string_literal: true

module Api
  module V1
    module Congestion
      class CamerasController < ApplicationController
        # 特定カメラの最新混雑状況を返す
        # @return 特定カメラの検知人数, 解析結果画像のURL
        def index
          corporation_id = Rails.configuration.corporation_id
          camera_api_key = Rails.configuration.cameras[params[:id].to_i][:camera_api_key]

          camera = Camera.new
          render json: camera.congestion_latest(corporation_id, camera_api_key)
        end
      end
    end
  end
end
