# frozen_string_literal: true

require_relative "spot_feel/version"

require "awesome_print"

require "active_support"
require "active_support/duration"
require "active_support/time"
require "active_support/core_ext/hash"
require "active_support/core_ext/object/json"
require "active_support/configurable"

require "treetop"

require "spot_feel/node"
require "spot_feel/parser"
require "spot_feel/expression"
require "spot_feel/unary_tests"
require "spot_feel/decision"

module SpotFeel
  class SyntaxError < StandardError; end

  extend self

  include ActiveSupport::Configurable

  def configuration
    (@configuration ||= ActiveSupport::OrderedOptions.new).tap do |config|
      config.debug = false
    end
  end

  def configure
    yield configuration
  end

  def eval(expression_text, variables: {}, functions: {})
    expression = Expression.new(expression_text)
    raise SyntaxError, "Expression is not valid" unless expression.valid?
    expression.eval(functions.merge(variables))
  end

  def test(input, unary_tests_text, variables: {}, functions: {})
    unary_tests = UnaryTests.new(unary_tests_text)
    raise SyntaxError, "Unary tests are not valid" unless unary_tests.valid?
    unary_tests.test(input, functions.merge(variables))
  end

  def decisions_from_xml(xml)
    Decision.decisions_from_xml(xml)
  end

  def decide(decision_id, decisions:, variables: {}, functions: {})
    Decision.decide(decision_id, decisions:, context: functions.merge(variables))
  end
end
