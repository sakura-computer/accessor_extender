module AccessorExtender
  # Extends the module object with class/module and instance accessors for
  # class/module attributes, just like the native attr* accessors for instance
  # attributes.
  class ::Module

    # Defines a class attribute and creates a class and instance reader methods.
    # The underlying the class variable is set to +nil+, if it is not previously
    # defined.
    def mattr_reader(*syms)
      syms.each do |sym|
        raise NameError.new("invalid attribute name: #{sym}") unless sym =~ /^[_A-Za-z]\w*$/
        class_eval(<<-EOS, __FILE__, __LINE__ + 1)
          @@#{sym} = nil unless defined? @@#{sym}
          def self.#{sym}
            @@#{sym}
          end
        EOS

        class_variable_set("@@#{sym}", yield) if block_given?
      end
    end
    alias :cattr_reader :mattr_reader

    # Defines a class attribute and creates a class and instance writer methods to
    # allow assignment to the attribute.
    def mattr_writer(*syms)
      syms.each do |sym|
        raise NameError.new("invalid attribute name: #{sym}") unless sym =~ /^[_A-Za-z]\w*$/
        class_eval(<<-EOS, __FILE__, __LINE__ + 1)
          @@#{sym} = nil unless defined? @@#{sym}
          def self.#{sym}=(obj)
            @@#{sym} = obj
          end
        EOS

        send("#{sym}=", yield) if block_given?
      end
    end
    alias :cattr_writer :mattr_writer

    # Defines both class and instance accessors for class attributes.
    def mattr_accessor(*syms, &blk)
      mattr_reader(*syms, &blk)
      mattr_writer(*syms, &blk)
    end
    alias :cattr_accessor :mattr_accessor
    
  end
end
