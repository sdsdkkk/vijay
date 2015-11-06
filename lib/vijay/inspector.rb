require 'yaml'
require 'net/ssh'

module Vijay
  class Inspector
    attr_reader :servers, :files

    def initialize(filename)
      config_data = YAML.load_file filename
      list_servers!(config_data["servers"])
      list_files!(config_data["files"])
    end

    def inspect!
      @altered_files = {}
      @start_time = Time.now
      @servers.each do |server|
        altered = []
        Net::SSH.start(server.host, server.user, password: server.password) do |ssh|
          @files.each do |file|
            digest = ssh.exec!("md5sum #{file.name}").split(' ').first
            altered << file.name if file.altered?(digest)
          end
        end
        @altered_files[server.host] = altered unless altered.empty?
      end
      @end_time = Time.now
    end

    def report
      puts "[Vijay] Inspection started at #{@start_time} and finished at #{@end_time}"
      puts "[Vijay] Inspection conducted in #{@servers.count} server(s) for #{@files.count} file(s)"
      if @altered_files.empty?
        puts "[Vijay] No altered files detected"
      else
        puts "[Vijay] Altered files detected!"
      end
      @altered_files.each do |k, v|
        puts "[Vijay] Files altered on host #{k}:"
        v.each do |f|
          puts "[Vijay] - #{f}"
        end
      end
    end

    private
    def list_servers!(servers)
      @servers = []
      servers && servers.each do |k, v|
        @servers << ::Vijay::Server.new(k, v)
      end
    end

    def list_files!(files)
      @files = []
      files && files.each do |k, v|
        @files << ::Vijay::File.new(k, v)
      end
    end
  end
end
