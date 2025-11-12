require 'aws-sdk-s3'
require 'find'

s3 = Aws::S3::Client.new(region: 'ap-northeast-1')

bucket_name = 'mygolfnote-bucket'
local_dir = '/home/ubuntu/environment_3/mygolfnote/app'

Find.find(local_dir) do |path|
  next if File.directory?(path)

  key = path.sub("#{local_dir}/", '')

  puts "Uploading #{key}..."
  s3.put_object(bucket: bucket_name, key: key, body: File.open(path, 'rb'))
end

puts "uploaded"