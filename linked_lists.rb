
## the input is adjusted to allow for a recursive function
def add_two_numbers(l1, l2, carry = 0)
    return nil if (l1.nil? && l2.nil? && carry.zero?)
    sum = (l1&.val || 0) + (l2&.val || 0) + carry
    return ListNode.new(sum % 10).tap do |l3|
        l3.next = add_two_numbers(l1&.next, l2&.next, sum / 10)
    end
end

##recursive solution for meging two linked lists
def merge_two_lists(l1, l2)
#catches fully merged lists of different size
    return l2 if l1.nil?
    return l1 if l2.nil?
    #check values for lower/higher
    if l1.val < l2.val
			l1.next = merge_two_lists(l1.next, l2);
			return l1;
    else
			l2.next = merge_two_lists(l1, l2.next);
			return l2;
    end
end

def merge_two_lists(l1, l2)
# dummy node for merged list to build on
   merged_list = ListNode.new(0)
   current_node = merged_list
   while !l1.nil? && !l2.nil?
       if l1.val <= l2.val
           current_node.next = l1
           l1 = l1.next
       else
           current_node.next = l2
           l2 = l2.next
       end
       current_node = current_node.next
   end
   # if you have broken the loop it means either l1 or l2 is nil
   # check which and assign the
   while !l1.nil?
       current_node.next = l1
       l1 = l1.next
       current_node = current_node.next
   end
   while !l2.nil?
       current_node.next = l2
       l2 = l2.next
       current_node = current_node.next
   end
   merged_list.next
end

def delete_node(node)
    while node.next.next != nil do
        node.val = node.next.val
        node = node.next
    end
    node.val = node.next.val
    node.next = nil
end

def removeKFromList(l, k)
    removedK = []
    while l != nil do 
        if l.value != k 
            removedK.push(l.value)
        end
        l = l.next
    end
    return removedK
end

def isListPalindrome(l)
    data = []
    current_node = l
    while !current_node.nil?
        data << current_node.value
        current_node = current_node.next
    end
    data == data.reverse
end

class LinkedList
  # Instance variables: @head
  def is_palindrome?
    return true if @head.nil?
    # Assigned head of linked list to new variable
    orig = @head
    # Create a reversed copy of the linked list    
    prev = Node.new(@head.value, nil)
    while !orig.next.nil?
      curr = Node.new(orig.next.value)
      curr.next = prev
      prev = curr
      orig = orig.next
    end
    node = @head # The original list
    node_rev = prev # The copied & reversed list
    # Crawl through both lists & check if they're the same
    while !node.nil? && !node_rev.nil?
      return false if node.value != node_rev.value
      node = node.next
      node_rev = node_rev.next
    end
    true
  end
end


# merge klists
def merge_k_lists(lists)
    lists = lists.select{|head| !head.nil?}
    if lists.empty? 
        return nil
    elsif lists.size == 1
        return lists[0]
    else
        return merge(lists)
    end
end

def merge(lists)
    
    return lists[0] if lists.size == 1
    
    result = []
    
    (0..lists.size/2-1).step(1) do |i|
        result << merge_two_lists(lists[2*i], lists[2*i+1])
    end
    
    result << lists.last if lists.size%2!=0
    
    return merge(result)
    
end

def merge_two_lists(l1, l2)
    case 
        when l1.nil? && l2.nil?
        then return nil
        when l1.nil? && !l2.nil?
        then return l2
        when !l1.nil? && l2.nil?
        then return l1
            
        else
            case 
                when l1.val < l2.val
                then 
                    l1.next = merge_two_lists(l1.next, l2)
                    return l1
                else
                    l2.next = merge_two_lists(l1,l2.next)
                    return l2
                end
        end
end