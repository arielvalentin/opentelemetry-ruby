# frozen_string_literal: true

# Copyright The OpenTelemetry Authors
#
# SPDX-License-Identifier: Apache-2.0

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'opentelemetry/instrumentation/aws_sdk/version'

Gem::Specification.new do |spec|
  spec.name        = 'opentelemetry-instrumentation-aws_sdk'
  spec.version     = OpenTelemetry::Instrumentation::AwsSdk::VERSION
  spec.authors     = ['OpenTelemetry Authors']
  spec.email       = ['cncf-opentelemetry-contributors@lists.cncf.io']

  spec.summary     = 'AWS SDK instrumentation for the OpenTelemetry framework'
  spec.description = 'AWS SDK instrumentation for the OpenTelemetry framework'
  spec.homepage    = 'https://github.com/open-telemetry/opentelemetry-ruby'
  spec.license     = 'Apache-2.0'

  spec.files = ::Dir.glob('lib/**/*.rb') +
               ::Dir.glob('*.md') +
               ['LICENSE', '.yardopts']
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.6.0'

  spec.add_dependency 'opentelemetry-api', '~> 1.0'
  spec.add_dependency 'opentelemetry-instrumentation-base', '~> 0.21.0'

  spec.add_development_dependency 'appraisal', '~> 2.2.0'
  spec.add_development_dependency 'aws-sdk', '>= 2.0'
  spec.add_development_dependency 'bundler', '>= 1.17'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'opentelemetry-sdk', '~> 1.0'
  spec.add_development_dependency 'opentelemetry-test-helpers'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'pry-byebug' unless RUBY_ENGINE == 'jruby'
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'rubocop', '~> 0.73.0'
  spec.add_development_dependency 'simplecov', '~> 0.17.1'
  spec.add_development_dependency 'webmock', '~> 3.7.6'
  spec.add_development_dependency 'yard', '~> 0.9'
  spec.add_development_dependency 'yard-doctest', '~> 0.1.6'

  if spec.respond_to?(:metadata)
    spec.metadata['changelog_uri'] = "https://open-telemetry.github.io/opentelemetry-ruby/opentelemetry-instrumentation-aws_sdk/v#{OpenTelemetry::Instrumentation::AwsSdk::VERSION}/file.CHANGELOG.html"
    spec.metadata['source_code_uri'] = 'https://github.com/open-telemetry/opentelemetry-ruby/tree/main/instrumentation/aws_sdk'
    spec.metadata['bug_tracker_uri'] = 'https://github.com/open-telemetry/opentelemetry-ruby/issues'
    spec.metadata['documentation_uri'] = "https://open-telemetry.github.io/opentelemetry-ruby/opentelemetry-instrumentation-aws_sdk/v#{OpenTelemetry::Instrumentation::AwsSdk::VERSION}"
  end
end
