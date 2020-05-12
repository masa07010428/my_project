require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FireFightingEquipment
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # 日本語化
    config.i18n.default_locale = :ja
    # タイムゾーン変更
    config.time_zone = 'Asia/Tokyo'
    # エラーメッセージの日本語化
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    # エラーメッセージ表示時のレイアウト崩れ防止
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
