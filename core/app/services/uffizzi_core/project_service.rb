# frozen_string_literal: true

class UffizziCore::ProjectService
  class << self
    def update_compose_secrets(project)
      compose_file = project.compose_file
      return if compose_file&.template.nil?

      project.secrets.each do |secret|
        if UffizziCore::ComposeFileService.has_secret?(compose_file, secret)
          UffizziCore::ComposeFileService.update_secret!(compose_file, secret)
        end
      end

      return unless UffizziCore::ComposeFileService.secrets_valid?(compose_file, project.secrets)

      secrets_error_key = UffizziCore::ComposeFile::ErrorsService::SECRETS_ERROR_KEY
      return unless UffizziCore::ComposeFile::ErrorsService.has_error?(compose_file, secrets_error_key)

      UffizziCore::ComposeFile::ErrorsService.reset_error!(compose_file, secrets_error_key)
      compose_file.set_valid! unless UffizziCore::ComposeFile::ErrorsService.has_errors?(compose_file)
    end

    def update_compose_secret_errors(project, secret)
      compose_file = project.compose_file
      return if compose_file.nil?
      return unless UffizziCore::ComposeFileService.has_secret?(compose_file, secret)

      error_message = I18n.t('compose.project_secret_not_found', secret: secret['name'])
      compose_file_errors = compose_file.payload['errors'] || {}
      secrets_errors = compose_file_errors[UffizziCore::ComposeFile::ErrorsService::SECRETS_ERROR_KEY].presence || []
      new_secrets_errors = secrets_errors.append(error_message).uniq
      error = { UffizziCore::ComposeFile::ErrorsService::SECRETS_ERROR_KEY => new_secrets_errors }
      new_errors = compose_file_errors.merge(error)

      UffizziCore::ComposeFile::ErrorsService.update_compose_errors!(compose_file, new_errors, compose_file.content)
    end

    def add_users_to_project!(project, account)
      user_projects = account.memberships.where(role: UffizziCore::Membership.role.admin).map do |membership|
        { project: project, user: membership.user, role: UffizziCore::UserProject.role.admin }
      end

      UffizziCore::UserProject.create!(user_projects)
    end
  end
end
