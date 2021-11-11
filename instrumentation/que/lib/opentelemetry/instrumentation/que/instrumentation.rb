# frozen_string_literal: true

# Copyright The OpenTelemetry Authors
#
# SPDX-License-Identifier: Apache-2.0

module OpenTelemetry
  module Instrumentation
    module Que
      # The Instrumentation class contains logic to detect and install the Que
      # instrumentation
      class Instrumentation < OpenTelemetry::Instrumentation::Base
        install do |_|
          require_dependencies
          patch

          ::Que.job_middleware.push(Middlewares::ServerMiddleware)
        end

        present do
          defined?(::Que)
        end

        ## Supported configuration keys for the install config hash:
        #
        # propagation_style: controls how the job's execution is traced and related
        #   to the trace where the job was enqueued. Can be one of:
        #
        #   - :link (default) - the job will be executed in a separate trace.
        #     The initial span of the execution trace will be linked to the span
        #     that enqueued the job, via a Span Link.
        #   - :child - the job will be executed in the same logical trace, as a
        #     direct child of the span that enqueued the job.
        #   - :none - the job's execution will not be explicitly linked to the
        #     span that enqueued the job.
        #
        # Note that in all cases, we will store Que's Job ID as the
        # `messaging.message_id` attribute, so out-of-band correlation may
        # still be possible depending on your backend system.
        #
        option :propagation_style, default: :link, validate: ->(opt) { %i[link child none].include?(opt) }

        private

        def require_dependencies
          require_relative 'tag_setter'
          require_relative 'middlewares/server_middleware'
          require_relative 'patches/que_job'
        end

        def gem_name
          'que'
        end

        def minimum_version
          '1.0.0.beta4'
        end

        def patch
          ::Que::Job.prepend(Patches::QueJob)
        end
      end
    end
  end
end
