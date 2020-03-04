# hash-type_check

hash-type_check deep compares a receiver hash with a schema hash argument and
raises a Hash::TypeCheck::Error if a key in the schema is not found in the
receiver, or if there is a type mismatch on the values for a key.

```ruby
{}.type_check(foo: 1)
# Hash::TypeCheck::Error: key not found: :foo

{ bar: 'hi' }.type_check('bar' => String)
# Hash::TypeCheck::Error: key not found: "bar"

{ bar: 'hi' }.type_check(bar: String)
# => nil

my_somewhat_complicated_hash = {
  str: 'hello',
  nil: nil,
  int: 5,
  flt: 0.4085231916562211,
  arr: [],
  foo: {
    str: 'hi',
    obj: Object.new,
    bar: {
      flt: 0.0,
      arr: [],
      uhoh: 'teehee',
      baz: {
        nil: nil,
        int: 0
      }
    }
  }
}

my_somewhat_complicated_hash.type_check(
  str: String,
  nil: NilClass,
  int: Integer,
  flt: Float,
  arr: Array,
  foo: {
    str: String,
    obj: Object,
    bar: {
      flt: Float,
      arr: Array,
      uhoh: Object,
      baz: {
        nil: NilClass,
        int: Integer
      }
    }
  }
)
# Hash::TypeCheck::Error: key: uhoh, expected: Object, actual: String
```
