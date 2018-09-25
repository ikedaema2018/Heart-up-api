class ProfileImagesController < ApplicationController

    

    # test, development
    # output_path = Rails.root.join('public/profile_image', @path_name)



    # @profile_image = User.find(@user.id)

    # uploaded_file = fileupload_params[:file]

    # @path_name = uploaded_file.original_filename
    # begin
    #   if !@profile_image[:profile_image].nil?
    #     delete_path = Rails.root.join('public/profile_image', @profile_image[:profile_image])
    #     File.delete delete_path
    #   end
    # rescue
      
    # end

    # begin
    #   File.open(output_path, 'w+b') do |fp|
    #     fp.write uploaded_file.read
    #   end
    # rescue
    #   head 500
    # end
    
    # if @profile_image.update(profile_image: create_params[:image_path])
    #   render json: @profile_image
    # else 
    #   head 500
    # end
  def update
    require 'aws-sdk'
    @profile_image = User.find(@user.id)
    Aws.config.update({
      region: 'ap-northeast-1',
      credentials: Aws::Credentials.new(ENV['AKIAIL6MGOAT5XBVA2NQ'], ENV['UKLFRlps3PoZ0TxIzwK1XYBZucGMBuorxxppbE5M'])
    })
    s3 = AWS::S3.new
    bucket = s3.buckets['heart-up']
    uploaded_file = fileupload_params[:file]
        
    file_name = uploaded_file.original_filename
    file_full_path="images/"+file_name
    object = bucket.objects[file_full_path]
    object.write(file ,:acl => :public_read)


    @profile_image[:profile_image] = "http://s3-ap-northeast-1.amazonaws.com/heart-up/images/#{file_name}"


    if @profile_image.save
      render json: @profile_image
    else 
      head 500
    end
  end

  private 

  def fileupload_params
    params.permit(:file)
  end

  def create_params
    params.permit().merge(image_path: @path_name)
  end
end
