# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  # config.active_storage.service = :local

  # config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  # config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  # config.active_record.verbose_query_logs = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  # config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  # ?????????????????????????????????????????????ID (AICamera??????)
  config.corporation_id = '<??????ID (AICamera)>'

  # OPTiM AI Camera Auth (OPTiM Cloud IoT OS????????????????????????????????????)
  config.aicamera_auth = 'https://auth.pre.cios.dev/connect/token'

  # OPTiM AI Camera Web API endpoint
  config.aicamera_web_api = 'https://api.camera-lite.stg.ai.optim-test.com/v1/corporation'

  # ???????????????
  config.cameras = [{
    # ??????????????????API?????? (AICamera??????)
    camera_api_key: '<?????????API?????? (AICamera)>'
  }]

  # ???????????????
  config.meeting_rooms = [{
    meeting_id: 0,
    # ????????????????????????????????? (Outlook??????)
    meeting_address: '<????????????????????????????????? (Outlook)>'
  }]
end
