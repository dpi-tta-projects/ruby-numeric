# lucky_number.rb
#
# Lucky Number 🍀
# Generate a random integer from 1 to 100 (inclusive).
# Print the number with `pp`.
# Then print, with `pp`:
#   - "lucky"   if the number is divisible by 7 OR it contains the digit 7 (eg 17, 71, 47, etc.)
#   - "unlucky" otherwise
#
# Example outputs:
#   14
#   lucky
#
#   13
#   unlucky
#
# Hints:
# - Use rand(1..100) to pick a number between 1 and 100
# - Use % for divisibility
# - Use to_s.include?("7") to check digits
#
