describe 'varnish' do
  before do
    @v = VarnishCtl.new
  end

  it 'should work' do
    @v.run 'varnish'
    puts `ps -Af|grep varnish`
    @v.running?
    @v.stop
    puts `ps -Af|grep varnish`
    p @v.running?

    p 2
  end
end
