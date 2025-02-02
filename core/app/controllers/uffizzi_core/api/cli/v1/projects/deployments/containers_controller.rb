# frozen_string_literal: true

# @resource Container

class UffizziCore::Api::Cli::V1::Projects::Deployments::ContainersController <
  UffizziCore::Api::Cli::V1::Projects::Deployments::ApplicationController
  before_action :authorize_uffizzi_core_api_cli_v1_projects_deployments_containers

  # Get a list of container services for a deployment
  #
  # @path [GET] /api/cli/v1/projects/{project_slug}/deployments/{deployment_id}/containers
  #
  # @parameter project_slug(required,path) [string] The project slug
  # @parameter deployment_id(required,path) [integer] The id of the deployment
  #
  # @response [Container] 200 OK
  # @response 401 Not authorized
  # @response 404 Not found
  def index
    containers = resource_deployment.containers.active

    respond_with containers
  end

  def k8s_container_description
    deployment ||= resource_project.deployments.existed.find(params[:deployment_id])
    container = deployment.containers.active.find_by!(service_name: params[:container_name])
    last_state = UffizziCore::ContainerService.last_state(container)

    render json: { last_state: last_state }
  end
end
