require 'minitest'

def require_all(path)
  Dir.glob(path) { |f| require f }
end

if __FILE__ == $0
  $LOAD_PATH.unshift('lib')
  require_all('./**/*_test.rb')
end
