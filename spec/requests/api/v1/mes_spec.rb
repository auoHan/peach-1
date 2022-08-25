require "rails_helper"
require "active_support/testing/time_helpers"

RSpec.describe "Mes", type: :request do
  include ActiveSupport::Testing::TimeHelpers
  describe "获取当前用户" do
    it "登录后成功获取" do
      user = User.create email: "710543268@qq.com"
      post "/api/v1/session", params: { email: "710543268@qq.com", code: "123456" }
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      jwt = json["jwt"]

      get "/api/v1/me", headers: { 'Authorization': "Bearer #{jwt}" }
      expect(response).to have_http_status(200)
      json = JSON.parse response.body
      expect(json["resource"]["id"]).to eq user.id
    end
    it "jwt过期" do
      travel_to Time.now - 3.hours
      user1 = User.create email: "1@qq.com"
      jwt = user1.generate_jwt

      travel_back
      get "/api/v1/me", headers: { 'Authorization': "Bearer #{jwt}" }
      expect(response).to have_http_status(401)
    end
    it "jwt没过期" do
      travel_to Time.now - 1.hours
      user1 = User.create email: "1@qq.com"
      jwt = user1.generate_jwt

      travel_back
      get "/api/v1/me", headers: { 'Authorization': "Bearer #{jwt}" }
      expect(response).to have_http_status(200)
    end
  end
end
