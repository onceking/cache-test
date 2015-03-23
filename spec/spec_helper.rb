require 'pathname'
$fixture = File.expand_path('../fixtures', __FILE__)
$prefix = File.expand_path('../../Varnish-Cache/out', __FILE__)
$work = File.expand_path('../tmp', __FILE__)

class VarnishCtl
  def initialize
    @pid = nil
    @port = 27081
  end

  def run(conf)
    cmd = [
      File.join($prefix, 'sbin', 'varnishd'),
      "-a 127.0.0.1:#{@port}",
      "-f #{File.join($fixture, 'config', [conf, 'vcl'].join('.'))}",
      "-n #{File.join($work, 'varnish')}"
    ].join(' ')
    puts cmd
    @pid = Process.spawn(
      {'LD_LIBRARY_PATH' => File.join($prefix, 'lib', 'varnish')},
      cmd)
  end

  def running?
    Process.kill 0, @pid
  end

  def stop
    p @pid
    Process.kill 'KILL', @pid
  end
end

class Httpd
  def initialize
    @port = 27080
  end

  def start
    @pid = process.fork do

    end
  end
end
