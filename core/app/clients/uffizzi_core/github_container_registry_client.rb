# frozen_string_literal: true

class UffizziCore::GithubContainerRegistryClient
  attr_accessor :connection, :token, :registry_url

  def initialize(registry_url:, username:, password:)
    @registry_url = registry_url
    @connection = build_connection(@registry_url, username, password)
  end

  def manifests(image:, tag:)
    url = "/v2/#{image}/manifests/#{tag}"
    response = connection.get(url)

    RequestResult.quiet.new(result: response.body, headers: response.headers)
  end

  private

  def build_connection(registry_url, username, password)
    Faraday.new(registry_url) do |conn|
      conn.request(:basic_auth, username, password)
      conn.request(:json)
      conn.response(:json)
      conn.adapter(Faraday.default_adapter)
    end
  end
end
