# Inheritance 3: Examples

## pdefaultdict

```Python
class pdefaultdict(dict):
    def __init__(self,default_factory=None,initial_dict=[],**kargs):
        dict.__init__(self,initial_dict,**kargs) # call to initialize base-class
        self._default_factory = default_factory  # used in overridden methods
        
    def __repr__(self):
        return 'pdefaultdict('+str(self._default_factory)+','+dict.__repr__(self)+')'

    # When accessing d[key] the inherited method __getitem__ is
    #   called; if it finds key is not in the dictionary, it calls
    #   self.__missing__(key), returns the result of executing this
    #   method, which uses default_factory, if present, to create a
    #   value associated with d[key] and return that value
    def __missing__(self,key):
        if self._default_factory == None:
            dict.__missing__(self,key)       # same as: raise KeyError(str(key))
        result    = self._default_factory()  # Call default, with no arguments
        self[key] = result		     # Store it in the pdefaultdict
        return result			     # Return a reference to it
```

## Lists index starting at 1

```Python
from goody import irange

class list1(list):
    # Handle positive and negative indexes correctly
    def __getitem__(self,index):
        assert index!=0, 'list1.__getitem__: 0 index in origin-1 indexed list1'
        return list.__getitem__(self, index-1 if index > 0 else index)

    def __setitem__(self,index,value):
        assert index!=0, 'list1.__setitem__: 0 index in origin-1 indexed list1'
        list.__setitem__(self, index-1 if index > 0 else index, value)

    def __delitem__(self,index):
        assert index!=0, 'list1.__deltitem__: 0 index in origin-1 indexed list1'
        list.__delitem__(self, index-1 if index > 0 else index)
    
    ... other methods too
```

## OptionMenuValue derived from the base-class OptionMenu

```Python
from tkinter import *

# OptionMenuValue: with title and option_tuple
# get is a pull function to get the option selected
class OptionMenuValue(OptionMenu):
    def __init__(self,parent,title,*option_tuple,**configs):
        self.result = StringVar()     # create a new StringVar to use for option
        self.result.set(title)        # set it to the title
        self.original_title = title   # remember original title in attribute

        # initialize base class (which does most of the work) with self.result,
        #   passing along the other arguments passed to this __init__
        OptionMenu.__init__(self,parent,self.result,*option_tuple,**configs)

    def reset(self):
        self.result.set(self.original_title)
        
    def get(self):
        value = self.result.get()
        return value if value != self.original_title else 'None'
```

## OptionMenuToEntry derived from the base-class OptionMenuValue

```Python
from tkinter import *

# ... define OptionMenuValue class (see above)

#OptionMenuToEntry: with title,linked_entry, and option_tuple
#get is an inherited pull function; put is a push function, pushing
#  the selected option into the linked_entry (replacing what is there)
#  with a green backround; reset now resets this text too

class OptionMenuToEntry(OptionMenuValue):
    def __init__(self,parent,title,linked_entry,*option_tuple,**configs):
        self.entry = linked_entry
        OptionMenuValue.__init__(self,parent,title,*option_tuple,command=self.put,**configs)
  
    def reset(self):
        OptionMenuValue.reset(self)
        self.put('','white')
        
    def put(self,option,bg='green'):
        self.entry.delete(0,len(self.entry.get()))
        self.entry.insert(0,option)
        self.entry.config(bg=bg)
```

## PrivacyError derived from the base-class Exception

```Python
class PrivacyError(Exception):
    pass # inherits everything (including __init__) and overrides nothing
```

## Mix-in Inheritance Examples

```Python
class PrivacyError(Exception):
    pass # inherit __init__/constructor
        

class Privacy:
    def __setattr__(self,attr_name,new_value):
        print('__setattr__:',attr_name,'to be set to',new_value,'; privates = ',self.privates) # for illustration
        if attr_name in self.privates:
            raise PrivacyError('Privacy: attempt to set private: '+
                               attr_name+' to '+str(new_value))
        else:
            self.__dict__[attr_name] = new_value

class Test(Privacy): # mix-in a single base class: Privacy
    privates = {'y'} # y attribute of Test objects cannot be rebound after __init__

    def __init__(self,x,y):
        self.privates = set() # allow setting x y attributes; privates now found in object
        self.x = x  
        self.y = y
        del self.privates     # now use class attribute privates above for future privacy
```

```Python
class Str_All_Attributes:
    def __str__(self):
        from goody import type_as_str
        answer = 'Instance of ' +type_as_str(self)+'\n'
        for a in sorted(self.__dict__):
            answer += '  ' + a + ' -> ' + str(self.__dict__[a]) + '\n'
        return answer
```