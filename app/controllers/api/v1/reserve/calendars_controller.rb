# frozen_string_literal: true

module Api
  module V1
    module Reserve
      class CalendarsController < ApplicationController
        # 現在時刻の会議室予約の有無を返す
        # @return 会議室が予約されていればtrue
        def index
          meeting_address = Rails.configuration.meeting_rooms[params[:id].to_i][:meeting_address]
          now_time = Time.zone.now

          calendar = Calendar.new
          render json: { is_meeting_reserve: calendar.reserved?(meeting_address, now_time) }
        end
      end
    end
  end
end
