# frozen_string_literal: true

class Calendar
  # 特定時刻の会議室予約の有無を返す
  # @param String meeting_address 会議室のアドレス
  # @param Time target_datetime 対象時刻
  # @return 会議室が予約されていればtrue
  def reserved?(meeting_address, target_datetime)
    # Microsoft Graph: calendarView一覧取得 (https://docs.microsoft.com/ja-jp/graph/api/user-list-calendarview)
    request_url = "#{Rails.configuration.microsoft_graph}/#{meeting_address}/calendarView"

    # Outlookへのクエリで取得範囲指定が必要なので、
    # 対象日時〜対象日時+15分(予約時間の最小単位)を取得対象とする
    query = {
      startdatetime: target_datetime.iso8601.to_s,
      enddatetime: (target_datetime + (15 * 60)).iso8601.to_s,
      '$select': 'start,end,location'
    }

    client = HTTPClient.new
    response = client.get(request_url, header: create_header, query: query)
    JSON.parse(response.body)['value'][0].present?
  end

  private

  # Microsoft Graphからトークンを取得しヘッダを生成する
  # @return アクセストークンを付与したヘッダー
  def create_header
    # Microsoft Graph: アクセストークン取得 (https://docs.microsoft.com/ja-jp/graph/auth-v2-service#4-get-an-access-token)
    request_url = Rails.configuration.microsoft_auth
    request_body = {
      client_id: ENV['CALENDAR_CLIENT_ID'],
      client_secret: ENV['CALENDAR_CLIENT_SECRET_KEY'],
      grant_type: 'client_credentials',
      resource: 'https://graph.microsoft.com/'
    }
    client = HTTPClient.new
    response = client.post(request_url, body: request_body)
    { Authorization: "Bearer #{JSON.parse(response.body)['access_token']}" }
  end
end
