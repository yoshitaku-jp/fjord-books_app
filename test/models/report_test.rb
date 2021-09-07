# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "created_on" do
    report = reports(:one)
    assert_equal Date.today, report.created_on
  end
end
