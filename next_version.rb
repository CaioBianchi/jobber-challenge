=begin
Semantic Versions

Description:
You're fed up about changing the version of your software manually. Instead, you will create a little script that will make it for you.

Challenge:
Create a function nextVersion, that will take a string in parameter, and will return a string containing the next version number.

For example:

```
nextVersion("1.2.3") === "1.2.4";
nextVersion("0.9.9") === "1.0.0.";
nextVersion("1") === "2";
nextVersion("1.2.3.4.5.6.7.8") === "1.2.3.4.5.6.7.9";
nextVersion("9.9") === "10.0";
```

Rules

No number but the first may be greater than 9: if any are, you must set them to 0 and increment the next number in sequence.
You can assume all tests inputs to be valid.
=end

def nextVersion(version)
  # Split the version string into an array of integers
  parts = version.split('.').map(&:to_i)

  # Iterate from the last part to the first part
  (parts.length - 1).downto(0) do |i|
    if parts[i] < 9
      # If the part is less than 9, increment it and return the result as a string
      parts[i] += 1
      return parts.join('.')
    else
      # If the part is 9, set it to 0 and continue to the next part
      parts[i] = 0
    end
  end

  # If all parts were 9, prepend a 1 at the beginning
  parts.unshift(1)
  parts.join('.')
end

# Alternative solution to the above with Ruby's native succ method that will replicate the logic for incrementing versions
def nextVersionAlternative(version)
  version.succ
end
