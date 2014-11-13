# -*- encoding : utf-8 -*-

# http://docs.appiaries.com/v1/api/datastore/conditions
module Appiaries
  class Query
    attr_accessor :where
    attr_accessor :order_by
    attr_accessor :order
    attr_accessor :limit
    attr_accessor :skip
    attr_accessor :count
    attr_accessor :include

    attr_accessor :select
    attr_accessor :except

    def initialize()
      @select = []
      @except = []
      @order_by = []
      
      @where = {}
      @order = :ascending
    end

    def add_constraint(field, constraint)
      current = where[field]
      if current && current.is_a?(Hash) && constraint.is_a?(Hash)
        current.merge! constraint
      else
        where[field] = constraint
      end
    end
    #private :add_constraint

    def exist(field, value = true)
      add_constraint field, { "exist" => value }
      self
    end
    

    def eq(hash_or_field,value=nil)
      return eq_pair(hash_or_field,value) unless hash_or_field.is_a?(Hash)
      hash_or_field.each_pair { |k,v| eq_pair k, v }
      self
    end

    def eq_pair(field, value)
      add_constraint field, {"eq" => value}
      self
    end

    def neq(field, value)
      add_constraint field, { "neq" => value }
      self
    end

    def is(field, value)
      if value.nil?
        add_constraint field, { "is" => "null" }
      else
        add_constraint field, { "is" => value }
      end
      self
    end
    
    def isn(field, value)
      if value.nil?
        add_constraint field, { "isn" => "null" }
      else
        add_constraint field, { "isn" => value }
      end
      self
    end
    

    def lt(field, value)
      add_constraint field, { "lt" => value }
      self
    end

    def lte(field, value)
      add_constraint field, { "lte" => value }
      self
    end

    def gt(field, value)
      add_constraint field, { "gt" => value }
      self
    end

    def gte(field, value)
      add_constraint field, { "gte" => value }
      self
    end

    def sw(field, value)
      add_constraint field, { "sw" => value }
      self
    end

    def nsw(field, value)
      add_constraint field, { "nsw" => value }
      self
    end
    
    def in(field, values)
      add_constraint field, { "in" => values }
      self
    end
    
    def wic(field, values)
      add_constraint field, { "wic" => values }
      self
    end

    def wib(field, values)
      add_constraint field, { "wib" => values }
      self
    end
    
    def wip(field, values)
      add_constraint field, { "wip" => values }
      self
    end
    
    def count
      @count = true
      self
    end
    
    def add_order_by(field)
      order_by.push(field)
    end

    def add_select(field)
      select.push(field)
    end
    
    def add_except(field)
      except.push(field)
    end
    
    def where_as_json
      @where
    end

    def to_cond
      cond = '-;'
      where.each do |key, value|
        operator = value.keys[0]
        if value[operator].is_a?(Array)
          cond += "#{key}.#{operator}.#{value[operator].join(',')};"
        else
          if value[operator].is_a?(Numeric)
            cond += "#{key}.#{operator}.#{value[operator]}n;" # append "n" after its value
          else
            cond += "#{key}.#{operator}.#{value[operator]};"
          end
        end
      end # where.each
      cond
    end
  end
end
