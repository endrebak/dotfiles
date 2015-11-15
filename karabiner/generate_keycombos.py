import string


s = """<autogen>
__KeyToKey__
KeyCode::{0}, ModifierFlag::MY_HYPER,
__{{ KeyCode::SPACE, KeyCode::O, KeyCode::VK_WAIT_10MS, KeyCode::{0} }}__
</autogen>"""

for char in string.printable:
    if char.isalnum() and char.upper() == char:
        print(s.format(char))
