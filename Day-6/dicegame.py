import random
def roll_dice():
    return random.randint(1,6)
def check_result(player,computer):
    if player>computer:
        return 'You have Won'
    elif player<computer:
        return 'Computer Won'
    else:
        return "It's a tie"