require File.expand_path(File.dirname(File.dirname(__FILE__)) + '/spec_helper')
require File.expand_path(File.dirname(File.dirname(__FILE__)) + '/sinatra/test_app')

describe "Sinatra" do
  include Rack::Test::Methods

  describe "Firudo" do
    describe "with Default Settings" do

      before(:each) do
        FileUtils.mkdir_p "#{fixtures_path}/log"
        @log_file = "#{fixtures_path}/log/#{TestApp.environment}.log"
        `touch #{@log_file}`
      end

      def app
        TestApp.new
      end

      after(:each) do
        `echo '' > #{@log_file}`
      end

      describe "Helpers" do

        it "should return an instance of Logger" do
          expect(Sinatra::Firudo.logger).to be_a_kind_of(::Logger)
        end

        describe "#filter_attributes" do

          it "should create a #{TestApp.environment}.log file when initialized" do
            test(?f, @log_file).should == true
          end

          it "should filter secure data in log" do
            get('/status?login=abc&password=123&password_confirmation=123')
            expect(IO.read(@log_file)).to match(/password=*{8}/)
            expect(IO.read(@log_file)).to match(/password_confirmation=*{8}/)
          end
        end
      end
    end
  end
end