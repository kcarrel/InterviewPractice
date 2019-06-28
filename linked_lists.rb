
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
