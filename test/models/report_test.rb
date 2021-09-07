# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test "editable" do
    report = reports(:one)
    one = users(:one)
    assert report.editable?(one)

    alice = users(:alice)
    assert_not report.editable?(alice)
  end

  test "created_on" do
    report = reports(:one)
    assert_equal Date.today, report.created_on
  end
end
