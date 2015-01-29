#
# cmpi.rb
#
# Main entry point for cmpi-bindings-ruby, Ruby based CIM Providers
#

class String
  #
  # Convert from CamelCase to under_score
  #
  def decamelize
    self.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').
	 gsub(/([a-z\d])([A-Z])/,'\1_\2').
	 tr("-", "_").
	 downcase
  end
end

#
# = Cmpi - Common Manageablity Programming Interface
#

# The Common Manageablity Programming Interface (CMPI) defines a
# common standard of interfacing Manageability Instrumentation
# (providers, instrumentation) to Management Brokers (CIM Object
# Manager). The purpose of CMPI is to standardize Manageability
# Instrumentation. This allows to write and build instrumentation once
# and run it in different CIM environments (on one platform).
#
# == CIMOM Context
#
# == Provider Interface
#

module Cmpi

  def self.null
    0
  end
  def self.boolean
    (2+0)
  end
  def self.char16
    (2+1)
  end

  def self.real32
    ((2+0)<<2)
  end
  def self.real64
    ((2+1)<<2)
  end

  def self.uint8
    ((8+0)<<4)
  end
  def self.uint16
    ((8+1)<<4)
  end
  def self.uint32
    ((8+2)<<4)
  end
  def self.uint64
    ((8+3)<<4)
  end
  def self.sint8
    ((8+4)<<4)
  end
  def self.sint16
    ((8+5)<<4)
  end
  def self.sint32
    ((8+6)<<4)
  end
  def self.sint64
    ((8+7)<<4)
  end
  def self.instance
    ((16+0)<<8)
  end
  def self.ref
    ((16+1)<<8)
  end
  def self.args
    ((16+2)<<8)
  end
  def self.filter
    ((16+4)<<8)
  end
  def self.enumeration
    ((16+5)<<8)
  end
  def self.string
    ((16+6)<<8)
  end
  def self.chars
    ((16+7)<<8)
  end
  def self.dateTime
    ((16+8)<<8)
  end
  def self.ptr
    ((16+9)<<8)
  end
  def self.charsptr
    ((16+10)<<8)
  end
  def self.embedded_object
    ((1)<<14)
  end
  def self.embedded_instance
    ((1)<<15)
  end


  unless defined? CMPI_ARRAY
    CMPI_ARRAY = ((1)<<13)
  end

  def self.booleanA
    CMPI_ARRAY | self.boolean
  end
  def self.char16A
    CMPI_ARRAY | self.char16
  end

  def self.real32A
    CMPI_ARRAY | self.real32
  end
  def self.real64A
    CMPI_ARRAY | self.real64
  end

  def self.uint8A
    CMPI_ARRAY | self.uint8
  end
  def self.uint16A
    CMPI_ARRAY | self.uint16
  end
  def self.uint32A
    CMPI_ARRAY | self.uint32
  end
  def self.uint64A
    CMPI_ARRAY | self.uint64
  end
  def self.sint8A
    CMPI_ARRAY | self.sint8
  end
  def self.sint16A
    CMPI_ARRAY | self.sint16
  end
  def self.sint32A
    CMPI_ARRAY | self.sint32
  end
  def self.sint64A
    CMPI_ARRAY | self.sint64
  end
  def self.instanceA
    CMPI_ARRAY | self.instance
  end
  def self.refA
    CMPI_ARRAY | self.ref
  end
  def self.argsA
    CMPI_ARRAY | self.args
  end
  def self.filterA
    CMPI_ARRAY | self.filter
  end
  def self.enumerationA
    CMPI_ARRAY | self.enumeration
  end
  def self.stringA
    CMPI_ARRAY | self.string
  end
  def self.charsA
    CMPI_ARRAY | self.chars
  end
  def self.dateTimeA
    CMPI_ARRAY | self.dateTime
  end
  def self.ptrA
    CMPI_ARRAY | self.ptr
  end
  def self.charsptrA
    CMPI_ARRAY | self.charsptrA
  end
  def self.embedded_objectA
    CMPI_ARRAY | self.embedded_object
  end
  def self.embedded_instanceA
    CMPI_ARRAY | self.embedded_instance
  end

  # generic Error class, derived from ::Exception
  #
  class RCErr < ::StandardError
    def initialize rc,msg
      super msg
      @rc = rc
    end
    # CMPI result code
    #
    # normally not needed since errors are
    # encapsulated into respective RCErrxxx subclasses
    def rc
      @rc
    end
  end
  # CMPIStatus as Exception: failed
  #
  # See Cmpi::RCErr
  class RCErrFailed < RCErr; end
  # CMPIStatus as Exception: access denied
  #
  # See Cmpi::RCErr
  class RCErrAccessDenied < RCErr; end
  # CMPIStatus as Exception: invalid namespace
  #
  # See Cmpi::RCErr
  class RCErrInvalidNamespace < RCErr; end
  # CMPIStatus as Exception: invalid parameter
  #
  # See Cmpi::RCErr
  class RCErrInvalidParameter < RCErr; end
  # CMPIStatus as Exception: invalid class
  #
  # See Cmpi::RCErr
  class RCErrInvalidClass < RCErr; end
  # CMPIStatus as Exception: not found
  #
  # See Cmpi::RCErr
  class RCErrNotFound < RCErr; end
  # CMPIStatus as Exception: not supported
  #
  # See Cmpi::RCErr
  class RCErrNotSupported < RCErr; end
  # CMPIStatus as Exception: class has children
  #
  # See Cmpi::RCErr
  class RCErrClassHasChildren < RCErr; end
  # CMPIStatus as Exception: class has instances
  #
  # See Cmpi::RCErr
  class RCErrClassHasInstances < RCErr; end
  # CMPIStatus as Exception: invalid superclass
  #
  # See Cmpi::RCErr
  class RCErrInvalidSuperclass < RCErr; end
  # CMPIStatus as Exception: already exits
  #
  # See Cmpi::RCErr
  class RCErrAlreadyExists < RCErr; end
  # CMPIStatus as Exception: no such property
  #
  # See Cmpi::RCErr
  class RCErrNoSuchProperty < RCErr; end
  # CMPIStatus as Exception: type mismatch
  #
  # See Cmpi::RCErr
  class RCErrTypeMismatch < RCErr; end
  # CMPIStatus as Exception: query language not supported
  #
  # See Cmpi::RCErr
  class RCErrQueryLanguageNotSupported < RCErr; end 
  # CMPIStatus as Exception: invalid query
  #
  # See Cmpi::RCErr
  class RCErrInvalidQuery < RCErr; end
  # CMPIStatus as Exception: method not available
  #
  # See Cmpi::RCErr
  class RCErrMethodNotAvailable < RCErr; end
  # CMPIStatus as Exception: method not found
  #
  # See Cmpi::RCErr
  class RCErrMethodNotFound < RCErr; end
  # CMPIStatus as Exception: system error
  #
  # See Cmpi::RCErr
  class RCErrSystem < RCErr; end
  # convert CMPIStatus rc code to Ruby exception
  def self.rc_to_exception rc
    return nil if rc == 0
    klass =
      [nil,                    #  0 /** Success */    CMPI_RC_OK = 0,
       RCErrFailed,            #  1 /** Generic failure */    CMPI_RC_ERR_FAILED = 1,
       RCErrAccessDenied,      #  2 /** Specified user does not have access to perform the requested action */    CMPI_RC_ERR_ACCESS_DENIED = 2,
       RCErrInvalidNamespace,  #  3 /** invalid namespace specified */    CMPI_RC_ERR_INVALID_NAMESPACE = 3,
       RCErrInvalidParameter,  #  4 /** invalid parameter specified */    CMPI_RC_ERR_INVALID_PARAMETER = 4,
       RCErrInvalidClass,      #  5 /** Invalid class specified */    CMPI_RC_ERR_INVALID_CLASS = 5,
       RCErrNotFound,          #  6 /** Item was not found */    CMPI_RC_ERR_NOT_FOUND = 6,
       RCErrNotSupported,      #  7 /** Operation not supported */    CMPI_RC_ERR_NOT_SUPPORTED = 7,
       RCErrClassHasChildren,  #  8 /** Object has child objects */    CMPI_RC_ERR_CLASS_HAS_CHILDREN = 8,
       RCErrClassHasInstances, #  9 /** Object has instances */    CMPI_RC_ERR_CLASS_HAS_INSTANCES = 9,
       RCErrInvalidSuperclass, # 10 /** Invalid super class specified */    CMPI_RC_ERR_INVALID_SUPERCLASS = 10,
       RCErrAlreadyExists,     # 11 /** specified object already exists */    CMPI_RC_ERR_ALREADY_EXISTS = 11,
       RCErrNoSuchProperty,    # 12 /** Property does not exist */    CMPI_RC_ERR_NO_SUCH_PROPERTY = 12,
       RCErrTypeMismatch,      # 13 /** This is a type mismatch */    CMPI_RC_ERR_TYPE_MISMATCH = 13,
       RCErrQueryLanguageNotSupported, # 14 /** Query language not supported */    CMPI_RC_ERR_QUERY_LANGUAGE_NOT_SUPPORTED = 14,
       RCErrInvalidQuery,      # 15 /** Invalid query */    CMPI_RC_ERR_INVALID_QUERY = 15,
       RCErrMethodNotAvailable,# 16 /** Method is not available */    CMPI_RC_ERR_METHOD_NOT_AVAILABLE = 16,
       RCErrMethodNotFound     # 17 /** could not find the specified method */    CMPI_RC_ERR_METHOD_NOT_FOUND = 17,
      ][rc]
    return RuntimeError unless klass
    klass
  end
    
  #
  # Convert CIM DateTime string representation (see DSP0004, 2.2.1)
  # to Ruby Time (timestamp) or Float (interval, as seconds with fraction)
  #           00000000001111111111222222
  #           01234567890123456789012345
  # East:     yyyymmddhhmmss.mmmmmm+utc -> Time (utc = offset in minutes)
  # West:     yyyymmddhhmmss.mmmmmm-utc -> Time
  # Interval: ddddddddhhmmss.mmmmmm:000 -> Float (interval in seconds, with fraction)
  #
  def self.cimdatetime_to_ruby str
#    puts "Cmpi.cimdatetime_to_ruby(#{str})"
    case str[21,1]
    when '+', '-'
      # create Time from yyyymmddhhmmss and utc
      t = Time.new(str[0,4].to_i, str[4,2].to_i, str[6,2].to_i, str[8,2].to_i, str[10,2].to_i, str[12,2].to_i, str[22,3].to_i * ((str[21,1]=='+')?60:-60))
      off = str[15,6].to_i / 1000
      # Add fractional part
      return t + off
    when ':'
      # time offset
      off = str[0,8].to_i * 24 * 60 * 60
      off += str[8,2].to_i * 60 * 60 + str[10,2].to_i * 60 + str[12,2].to_i
      off += str[15,6].to_i / 1000
      return off
    else
      raise RCErrInvalidParameter.new(CMPI_RC_ERR_INVALID_PARAMETER, "Invalid CIM DateTime '#{str}'")
    end
  end

  #
  # Convert Ruby value to CIM DateTime string representation (see DSP0004, 2.2.1)
  #           00000000001111111111222222
  #           01234567890123456789012345
  # East:     yyyymmddhhmmss.mmmmmm+utc -> Time (utc = offset in minutes, mmmmmm is the microsecond within the second
  # West:     yyyymmddhhmmss.mmmmmm-utc -> Time
  # Interval: ddddddddhhmmss.mmmmmm:000 -> Float (interval in seconds, with fraction)
  #
  def self.ruby_to_cimdatetime val
    require 'date'
#    puts "Cmpi.ruby_to_cimdatetime(#{val}[#{val.class}])"
    t = nil
    case val
    when Time
      s = val.strftime "%Y%m%d%H%M%S.%6N"
      utc = val.utc_offset # offset in seconds
      if utc < 0
        s << "-"
        utc = -utc
      else
        s << "+"
      end
      val = s + ("%03d" % (utc/60))
    when Numeric
      if val < 0
        # treat it as seconds before epoch
        val = self.ruby_to_cimdatetime( Time.at(val) )
      else
        # treat as interval in microseconds
        secs = (val / 1000000).to_i
        usecs = (val % 1000000).to_i
        days = secs / (24 * 60 * 60)
        secs = secs % (24 * 60 * 60) # seconds within the day
        hours = (secs / (60 * 60)).to_i
        secs = secs % (60 * 60)
        mins = (secs / 60).to_i
        secs = secs % 60
        val = "%08d%02d%02d%02d.%06d:000" % [ days, hours, mins, secs, usecs ]
      end
    when /^\d{14}\.\d{6}[-+:]\d{3}$/
      # fallthru
    when String
      val = self.ruby_to_cimdatetime val.to_f # retry as Numeric
    else
      val = self.ruby_to_cimdatetime val.to_s # retry as string
    end
    val
  end
  #
  # Base class for ValueMap/Values classes from genprovider
  #
  class ValueMap
    def self.method_missing name, *args
      v = self.map[name.to_s]
      return v if v
      STDERR.puts "#{self}.#{name} ?"
      nil
    end
  end
  #
  # CMPIContext gives the context for Provider operation
  #
  class CMPIContext
    def count
      #can't use alias here because CMPIContext::get_entry_count is only defined after
      # initializing the provider (swig init code)
      get_entry_count
    end
    def [] at
      if at.kind_of? Integer
	get_entry_at( at )
      else
	get_entry( at.to_s )
      end
    end
    def each
      0.upto(self.count-1) do |i|
	yield get_entry_at(i)
      end
    end
  end
  
  #
  # CMPIInstance
  #
  class CMPIInstance
    attr_accessor :typemap
    def each
      (0..size-1).each do |i|
	yield self.get_property_at(i)
      end
    end
    def to_s
      # objectpath only covers the key properties
      path = objectpath
      keys = []
      path.each { |val,name| keys << name }
      # now iterate over the instance properties, filter
      # out the key properties from the objectpath
      # and collect the non-key properties
      s = ""
      self.each do |value,name|
        next unless value
        next if keys.include? name
        s << ", " unless s.empty?
        s << "\"#{name}\"=#{value.inspect}"
      end
      # path has the key properties, s has the non-key properties
      "#{path} #{s}"
    end
    #
    # Allow Instance.Property and Instance.Property=
    #
    def method_missing name, *args
      s = name.to_s
      if s =~ /=$/
	v = args[0]
	n = s.chop
	# -> http://blog.sidu.in/2008/02/loading-classes-from-strings-in-ruby.html
        unless @typemap
          begin
            @typemap = Cmpi.const_get(self.objectpath.classname).typemap
          rescue NoMethodError
            raise RCErrInvalidClass.new(CMPI_RC_ERR_INVALID_CLASS, "Cmpi::#{self.objectpath.classname}.typemap not defined")
          end
        end
	t = @typemap[n]
        raise RCErrNotFound.new(CMPI_RC_ERR_NOT_FOUND, "Property '#{n}' of Cmpi::#{self.objectpath.classname}.typemap not defined") unless t
        STDERR.printf "Instance.%s = %s[%s]:%04x\n" % [n, v, v.class, t]
        self[n,v] = t
      else
#	STDERR.puts "CMPIInstance.#{name} -> #{self[s].inspect}"
	self[s]
      end
    end
  end
  
  #
  # CMPIObjectPath
  #
  class CMPIObjectPath
    attr_accessor :typemap
    #
    # Allow Ref.Property and Ref.Property=
    #
    def method_missing name, *args
      s = name.to_s
      if s =~ /=$/
	v = args[0]
	n = s.chop
	# -> http://blog.sidu.in/2008/02/loading-classes-from-strings-in-ruby.html
        unless @typemap
          begin
            @typemap = Cmpi.const_get(self.classname).typemap
          rescue NameError
            raise RCErrInvalidClass.new(CMPI_RC_ERR_INVALID_CLASS, "Cmpi::#{self.classname}.typemap not defined")
          end
        end
	t = @typemap[n]
        raise RCErrNotFound.new(CMPI_RC_ERR_NOT_FOUND, "Property '#{n}' of Cmpi::#{self.classname}.typemap not defined") unless t
#        STDERR.printf "ObjectPath.%s = %s[%s]:%04x\n" % [n, v, v.class, t]
        self[n,v] = t
      else
#	STDERR.puts "CMPIObjectPath.#{name} -> #{self[s].inspect}"
	self[s]
      end
    end
  end
  
  #
  # CMPIEnumeration
  #
  class CMPIEnumeration
    def each
      while has_next
	yield next_element
      end
    end
  end
  
  #
  # CMPIData
  #
  class CMPIData
    def method_missing name, *args
#      STDERR.puts "CMPIData.%s? %0x" % [name, type]
      case type
      when Cmpi.instance
	value.inst.send(name,*args)
      when Cmpi.ref
	value.ref.send(name,*args)
      end
    end
  end
  
  #
  # CMPIStatus
  #
  class CMPIStatus
    def to_s
      (rc == 0) ? "Ok" : "#{rc}:#{msg}"
    end
  end
  
  #
  # CMPIArgs
  #
  class CMPIArgs
    def each
      0.upto(size-1) do |i|
	yield get_arg_at(i)
      end
    end
    def to_hash
      h = {}
      each do |name,val|
	h[name] = val
      end
      h
    end
    def to_s
      s = ""
      each do |name,val|
	s << ", " unless s.empty?
	s << "#{name.inspect} => #{val}"
      end
      "{ #{s} }"
    end
  end
end
