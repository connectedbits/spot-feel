# frozen_string_literal: true

require "test_helper"

module SpotFeel
  module Dmn
    describe Rule do

      describe :evaluate do
        describe :output_value do
          let(:outputs) {
            [
              Output.new(id: 1, label: "Greeting", name: "response.message.greeting", type_ref: "string"),
              Output.new(id: 1, label: "Name", name: "response.message.name", type_ref: "string"),
            ]
          }

          let(:output_entries) {
            [
              LiteralExpression.new(text: '"Bonjour"'),
              LiteralExpression.new(text: 'name'),
            ]
          }

          let(:rule) {
            Rule.new(
              id: "1",
              input_entries: [
                UnaryTests.new(text: "fr"),
                UnaryTests.new(text: "false"),
              ],
              output_entries: output_entries,
            )
          }

          let(:variables) {
            { "language": "fr", "formal": false, "name": "Eric" }
          }

          it "should return a hash with the output value" do
            result = rule.output_value(outputs, variables)
            _(result).must_equal({ "response" => { "message" => { "greeting" => "Bonjour", "name" => "Eric" } } })
          end

          describe :with_nil_output_entry do
            let(:output_entries) {
              [
                LiteralExpression.new(text: nil),
                LiteralExpression.new(text: 'name'),
              ]
            }

            it "should ignore the output entry" do
              result = rule.output_value(outputs, variables)
              _(result).must_equal({ "response" => { "message" => { "name" => "Eric" } } })
            end
          end

          describe :with_blank_output_entry do
            let(:output_entries) {
              [
                LiteralExpression.new(text: ''),
                LiteralExpression.new(text: 'name'),
              ]
            }

            it "should ignore the output entry" do
              result = rule.output_value(outputs, variables)
              _(result).must_equal({ "response" => { "message" => { "name" => "Eric" } } })
            end
          end

          describe :with_empty_literal_output_entry do
            let(:output_entries) {
              [
                LiteralExpression.new(text: '""'),
                LiteralExpression.new(text: 'name'),
              ]
            }

            it "should ignore the output entry" do
              result = rule.output_value(outputs, variables)
              _(result).must_equal({ "response" => { "message" => { "greeting" => "", "name" => "Eric" } } })
            end
          end

          describe :with_null_literal_output_entry do
            let(:output_entries) {
              [
                LiteralExpression.new(text: 'null'),
                LiteralExpression.new(text: 'name'),
              ]
            }

            it "should ignore the output entry" do
              result = rule.output_value(outputs, variables)
              _(result).must_equal({ "response" => { "message" => { "greeting" => nil, "name" => "Eric" } } })
            end
          end
        end
      end
    end
  end
end
