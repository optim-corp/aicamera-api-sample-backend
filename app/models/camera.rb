# frozen_string_literal: true

class Camera
  # 特定カメラの最新混雑状況を返す
  # @param String corporation_id 対象カメラを保有している企業ID(AI Camera)
  # @param String camera_api_key 対象カメラのAPIキー
  # @return 特定カメラの検知人数, 解析結果画像のURL
  def congestion_latest(corporation_id, camera_api_key)
    # OPTiM AI Camera: 最新混雑状況取得 (https://developer-docs.camera-lite.ai.optim.cloud/#operation/getCongestionLatest)
    request_url = "#{Rails.configuration.aicamera_web_api}/#{corporation_id}/camera/#{camera_api_key}/congestion/latest"

    client = HTTPClient.new
    response = client.get(request_url, header: create_header)
    response_body = JSON.parse(response.body)
    { count: response_body['count'].to_i, url: response_body['url'].to_s }
  end

  private

  # OPTiM Cloud IoT OSからトークンを取得しヘッダを生成する
  # @return アクセストークンを付与したヘッダー
  def create_header
    # OPTiM Cloud IoT OS: アクセストークン取得 (https://developer-portal.optim.cloud/md/api_v2/authz-client/#token-request)
    request_url = Rails.configuration.aicamera_auth
    request_body = {
      client_id: ENV['AICAMERA_CLIENT_ID'],
      client_secret: ENV['AICAMERA_CLIENT_SECRET_KEY'],
      grant_type: 'client_credentials',
      scope: 'group.read corporation.read corporation.group.read corporation.user.read'
    }
    client = HTTPClient.new
    response = client.post(request_url, body: request_body)
    { Authorization: "Bearer #{JSON.parse(response.body)['access_token']}" }
  end
end
