# frozen_string_literal: true

guard(:minitest,
  all_on_start: false,
) do
  watch(%r{^test/test_helper\.rb$}) { "test" }
  watch(%r{^lib/(.+)\.rb$}) { |m| "test/#{m[1]}_test.rb" }
  watch(%r{^lib/spot_feel/node.rb}) { "test/parser_test.rb" }
  watch(%r{^lib/(.+)\.treetop$}) { |m| "test/#{m[1]}_test
  .rb" }
  watch(%r{^test/.+_test\.rb$})
end
