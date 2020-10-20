# Ever heard of a linked list? If not, this challenge is designed to demonstrate why it was invented as one of the first data structures, way back in the 1950's.

# If you have heard of it but haven't tried to implement it yourself, it could be enlightening.

# Copy and paste the following code into a file and save it as linked_list.rb. This is pure Ruby, not Rails, so run it with ruby linked_list.rb from your command line.

# In addition to learning about linked lists, you should follow good TDD practice:

# Run the code as is, and you'll see the first assertion fail.
# Write just barely enough code to make the first failure go away.
# Then you'll hit another error.
# Write just enough code to make the second error go away.
# Then you'll hit another error.
# Keep doing this until you see a Congratulations message, and then you can uncomment another entire section of tests.

# There's only one rule: you may NOT use a built-in data structure such as an Array or Hash. You may (and should) create your own classes instead.

# Have fun!

# Linked List


# You are free to implement any way you want, but
# you may NOT use any built-in data structure such
# as Array, Hash, etc.
#
# Your code goes here:
# ---------------------------------
class Node 

    attr_accessor :next
    attr_reader :value 

    def initialize(value)
        @value = value
        @next = nil
    end

end

class LinkedList 
    def initialize
        @head = nil
    end

    def append(value)
        node = Node.new(value)
        current = @head

        if @head.nil?
            @head = node
            return
        end

        until current.next.nil? 
            current = current.next 
        end 

        current.next = node
    end

    def pop()
        current = @head 
        until current.next.next.nil?
            current = current.next 
        end 
        value = current.next.value 
        current.next = nil 
        return value
        
    end


    def reverse
        reversed = LinkedList.new 
        current = @head 
        until current == nil 
            reversed.append(current.pop())
        end

        return reversed

    
    end

    def get(index)
        current = @head
        i = 0
        until i == index 
            current = current.next
            i += 1 
        end
        return current.value
    end

    def length
        i = 1
        current = @head 
        until current.next.nil? 
            current = current.next
            i += 1
        end
        return i 
    end

end









# ---------------------------------


# Unit tests


# Do not to touch the code below this line.


list = LinkedList.new


list.append("Hello")
list.append("there!")
list.append("How")
list.append("are")
list.append("you")
list.append("doing")
list.append("today?")


fail unless "Hello" == list.get(0)
fail unless "there!" == list.get(1)
fail unless "How" == list.get(2)
fail unless "are" == list.get(3)
fail unless "you" == list.get(4)
fail unless "doing" == list.get(5)
fail unless "today?" == list.get(6)


puts "Congratulations!  Now uncomment the rest of the tests."


# Length:
fail unless 7 == list.length


# Removal:
list.append("See ya.")
fail unless 8 == list.length
fail unless "See ya." == list.pop()
fail unless 7 == list.length


# Reversal:
list2 = list.reverse
fail unless 7 == list2.length
fail unless "today?" == list2.get(0)
fail unless "Hello" == list2.get(6)


print("Congratulations!  All tests passed.")



# BONUS
# How might this #map method be implemented?
#
# shouted = list.map { |n| n.upcase }
# fail unless 7 == shouted.length()
# fail unless "HELLO" == shouted.get(0)
# fail unless "ARE" == shouted.get(3)
#