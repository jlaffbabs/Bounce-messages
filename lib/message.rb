class Message 

  attr_reader :content, :time
  def initialize(content)
    @content = content 
    @time = Time.new
  end
  
  def abbreviate
    @content[0..19]
  end

end