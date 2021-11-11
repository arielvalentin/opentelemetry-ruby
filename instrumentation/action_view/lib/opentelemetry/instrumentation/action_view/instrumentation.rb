# frozen_string_literal: true

# Copyright The OpenTelemetry Authors
#
# SPDX-License-Identifier: Apache-2.0

module OpenTelemetry
  module Instrumentation
    module ActionView
      # The Instrumentation class contains logic to detect and install the ActionView instrumentation
      class Instrumentation < OpenTelemetry::Instrumentation::Base
        install do |_config|
          require_dependencies
        end

        present do
          defined?(::ActionView)
        end

        option :disallowed_notification_payload_keys, default: [],  validate: :array
        option :notification_payload_transform,       default: nil, validate: :callable

        private

        def gem_name
          'actionview'
        end

        def minimum_version
          '5.2.0'
        end

        def require_dependencies
          require_relative 'railtie'
        end
      end
    end
  end
end
