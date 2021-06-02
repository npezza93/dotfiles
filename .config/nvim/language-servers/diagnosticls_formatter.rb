# frozen_string_literal: true

require "rubocop"

class DiagnosticlsFormatter < RuboCop::Formatter::JSONFormatter
  def hash_for_location(offense)
    {
      start_line: offense.line,
      start_column: offense.real_column,
      last_line: offense.line,
      last_column: offense.real_column + offense.location.length,
    }
  end
end
