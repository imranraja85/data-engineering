class UploadsController < ApplicationController
  before_filter :check_parameters, :only => :create

  def index
    @upload = Upload.new
    @uploads = Upload.all.order("id desc")
  end

  def create
    if Upload.create(uploaded_file: params[:upload][:file]).process
      flash[:notice] = "Successfully imported a file"
    else
      flash[:error] = "Failed to import file"
    end

    redirect_to root_path
  end

  def download
    @upload = Upload.find(params[:id])

    send_file @upload.full_path, :type => 'application/csv', :filename => @upload.filename
  end

  private
  def check_parameters
    unless params[:upload] && params[:upload][:file]
      flash[:error] = "Please select a file to import"
      redirect_to root_path
    end
  end
end
