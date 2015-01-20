class Link
  attr_accessor :value, :next, :prev
  
  def initialize (value, next_link = nil, prev_link = nil)
    @value = value
    @next = next_link
    @prev = prev_link
  end
  
  def insert_left (link)
    self.prev = link
    self.prev = link.prev
    link.next = self
    self.prev.next = self
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
  
  def initialize (first_link) 
    @front_dummy = Link.new(nil, @first, nil)
    @back_dummy = Link.new(nil, nil, @first) 
    first_link.prev = @front_dummy
    first_link.next = @back_dummy
    @first = first_link   
    @length = 1
  end
  
  def [] (index)
    link = @first
    (index).times do
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
end

l0 = Link.new(0)
l1 = Link.new(1)
l2 = Link.new(4)
l3 = Link.new(9)
l4 = Link.new(16)

list = LinkedList.new(l0)