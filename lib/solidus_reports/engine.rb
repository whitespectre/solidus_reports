# frozen_string_literal: true

require 'spree/core'
require_relative './config'

module SolidusReports
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace Spree

    engine_name 'solidus_reports'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    config.to_prepare do
      ::Spree::Backend::Config.menu_items << ::Spree::BackendConfiguration::MenuItem.new(
        Configuration::REPORT_TABS,
        'file',
        condition: -> { can?(:admin, :reports) }
      )
    end
  end
end
