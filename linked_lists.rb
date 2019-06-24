
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
