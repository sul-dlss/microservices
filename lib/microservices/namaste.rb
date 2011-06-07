class Namaste
  def initialize(dir)
    unless File.exists?(dir) and File.directory?(dir)
      raise Errno::ENOENT, "No such directory - #{dir}"
    end
    @dir = dir
  end

  def type
    get('0')
  end
  
  def type=(value)
    set('0',value)
  end
  
  def who
    get('1')
  end
  
  def who=(value)
    set('1',value)
  end
  
  def what
    get('2')
  end
  
  def what=(value)
    set('2',value)
  end
  
  def when
    get('3')
  end
  
  def when=(value)
    set('3',value)
  end
  
  def where
    get('4')
  end
  
  def where=(value)
    set('4',value)
  end

  protected
  def transform(value)
    value.gsub(/["*\/:<>\?\\\|]/,'_')[0..254]
  end

  def get(tag)
    fname = Dir[File.join(@dir, "#{tag}=*")].first
    if fname and File.exists?(fname)
      File.read(fname)
    else
      nil
    end
  end
  
  def set(tag, value)
    FileUtils.rm(File.join(@dir, "#{tag}=*"), :force => true)
    unless value.nil?
      fname = "#{tag}=#{transform(value)}"
      File.open(File.join(@dir, fname),'w') { |f| f.write(value) }
    end
  end
end
