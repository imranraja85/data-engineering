require 'test_helper'

class UploadTest < ActiveSupport::TestCase
  test "setting the file name" do
    upload = Upload.new(uploaded_file: OpenStruct.new(:original_filename => 'test_example_file.tab', :read => 'some file contents'))
    upload.process

    assert_equal upload.filename, 'test_example_file.tab'
  end

  test "saving the file" do
    upload = Upload.new(uploaded_file: OpenStruct.new(:original_filename => 'test_example_file.tab', :read => 'some file contents'))
    upload.process

    assert File.exists?(upload.full_path)
    File.unlink(upload.full_path)
  end

  test "importing file data" do
    upload = Upload.create(uploaded_file: OpenStruct.new(:original_filename => 'example_input.tab'))
    upload.stubs(:full_path).returns(Rails.root.join('test', 'fixtures', 'example_input.tab'))
    upload.process_file

    assert_equal upload.gross_revenue.to_f, 95.0
    assert_equal upload.purchases_count, 4 
  end
end
