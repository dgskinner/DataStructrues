class Link
  attr_accessor :value, :next, :prev
  
  def initialize (value, next_link = nil, prev_link = nil)
    @value = value
    @next = next_link
    @prev = prev_link
  end
  
  def insert_left (link)
    link.prev = self.prev
    link.next = self
    self.prev.next = link
    self.prev = link
  end
  
  def insert_right (link)
    link.next = self.next
    link.prev = self
    self.next.prev = link
    self.next = link
  end
  
  def remove
    self.next.prev = self.prev
    self.prev.next = self.next
    self.next, self.prev = nil, nil
  end
end

class LinkedList
  attr_reader :back_dummy
  
  def initialize 
    @front_dummy = Link.new(nil, @first, nil)
    @back_dummy = Link.new(nil, nil, @first) 
    @length = 0
  end
  
  def [] (index)
    return nil if @length == 0
    link = @front_dummy
    index.times do
      link = link.next
    end
    
    link
  end
  
  def []= (index, link)
    link.next = self.[] (index)
    link.prev = link.next.prev
    link.prev.next = link
    link.next.prev = link
    @length += 1
  end
  
  def push (link)
    @back_dummy.insert_left(link)
    @length += 1
    link
  end
end
