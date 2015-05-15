class ImportArchiveJob
  attr_accessor :file, :current_user, :practice, :error_log, :upload_log

  def initialize(options)
    @file = options['file'].path
    @current_user = options['user']
    @practice = options['practice']
    @error_log = options['error_log']
    @upload_stats = options['upload_log']
    @filename = options['filename']
  end

  def before
    practice = @practice ? Practice.find(@practice).name : nil
      
    Log.create(:username => @current_user.username, :event => 'record import', :practice => practice, :filename => @filename)
  end

  def perform
    missing_patients = HealthDataStandards::Import::BulkRecordImporter.import_archive(File.new(@file), nil, @practice, @error_log, @upload_log)
    missing_patients.each do |id|
      Log.create(:username => @current_user.username, :event => "patient was present in patient manifest but not found after import", :medical_record_number => id)
    end
  end

  def after
    File.delete(@file)
  end
end
