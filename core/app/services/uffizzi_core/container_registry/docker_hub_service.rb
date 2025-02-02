# frozen_string_literal: true

class UffizziCore::ContainerRegistry::DockerHubService
  class << self
    def accounts(credential)
      client = user_client(credential)
      response = client.accounts
      Rails.logger.info("DockerHubService accounts response=#{response.inspect} credential_id=#{credential.id}")

      accounts_response = response.result
      accounts_response.nil? ? [] : accounts_response.namespaces
    end

    def image_available?(credential, image_data)
      namespace = image_data[:namespace]
      repo_name = image_data[:name]
      client(credential).repository(namespace: namespace, image: repo_name)

      true
    end

    def user_client(credential)
      return @client if @client&.credential&.username == credential.username

      @client = client(credential)

      unless @client.authenticated?
        Rails.logger.warn("broken credentials, DockerHubService credential_id=#{credential.id}")
        credential.unauthorize! unless credential.unauthorized?
      end

      @client
    end

    def digest(credential, image, tag)
      docker_hub_client = client(credential)
      token = docker_hub_client.get_token(image).result.token
      response = docker_hub_client.digest(image: image, tag: tag, token: token)
      response.headers['docker-content-digest']
    end

    def credential_correct?(credential)
      client(credential).authenticated?
    end

    private

    def client(credential)
      UffizziCore::DockerHubClient.new(credential)
    end
  end
end
