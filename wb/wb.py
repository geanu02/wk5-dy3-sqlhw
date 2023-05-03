# On vacation in the Bahamas you decide to go out on a scuba trip one day.

# Unfortunately, disaster has struck!! The boat has caught fire!!

# You will be provided a string that lists many boat related items. Make a function called replace_fire that takes in a string (input) and if any of these items are "Fire" you must spring into action. Change any instance of "Fire" into "~~". Then return the string .

# input: "Boat Rudder Mast Boat Hull Water Fire Boat Deck Hull Fire Propeller Deck Fire Deck Boat Mast",
# output: "Boat Rudder Mast Boat Hull Water ~~ Boat Deck Hull ~~ Propeller Deck ~~ Deck Boat Mast"

input_string = "Boat Rudder Mast Boat Hull Water Fire Boat Deck Hull Fire Propeller Deck Fire Deck Boat Mast"

def replace_fire(_input):
    _lst = []
    
    for word in _input.lower().split():
        if word == 'fire':
            _lst.append('~~')
        else:
            _lst.append(word.title())
    return ' '.join(_lst)

def replace_fire_map(_input):
    return ' '.join(map(lambda word: '~~' if word == 'fire' else word.title(), _input.lower().split()))

print(replace_fire(input_string))
print(replace_fire_map('hello world'))