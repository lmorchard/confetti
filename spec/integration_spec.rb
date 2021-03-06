require 'spec_helper'

describe 'Writing Output' do
  include HelpfulPaths
  include FileHelpers

  before do
    @config = Confetti::Config.new "#{ fixture_dir }/config.xml"
  end

  context "Android" do
    it "should read config.xml and spit out AndroidManifest.xml" do
      @output_file = "#{ fixture_dir }/android/AndroidManifest_output.xml"
      @config.write_android_manifest @output_file

      files_should_match @output_file, "#{ fixture_dir }/android/AndroidManifest_expected.xml"
    end

    it "should read config.xml and spit out strings.xml" do
      @output_file = "#{ fixture_dir }/android/android_strings_output.xml"
      @config.write_android_strings @output_file

      files_should_match @output_file, "#{ fixture_dir }/android/android_strings_expected.xml"
    end
  end

  context "iOS" do
    it "should read config.xml and spit out Info.plist" do
      @output_file = "#{ fixture_dir }/ios/ios_info_output.plist"
      @config.write_ios_info @output_file

      files_should_match @output_file, "#{ fixture_dir }/ios/ios_info_expected.plist"
    end
  end

  context "winphone8" do
    it "should read config.xml and spit out Info.plist" do
      @output_file = "#{ fixture_dir }/windowsphone8/WMAppManifest_output.xml"
      @config.write_windows_phone8_manifest @output_file

      files_should_match @output_file, "#{ fixture_dir }/windowsphone8/WMAppManifest_expected.xml"
    end
  end

  after do
    FileUtils.rm @output_file if File.exist? @output_file
  end
end
