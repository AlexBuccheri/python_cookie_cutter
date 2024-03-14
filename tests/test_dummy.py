import pytest

from my_package.dummy import add_one


def test_add_one():
    assert add_one(1) == 2
    assert add_one(1.0) == 2.0
    assert add_one(complex(1, 1)) == complex(
        2, 1
    ), "Only add one to the real part"

    with pytest.raises(ValueError) as info:
        add_one([1])
    assert (
        str(info.value)
        == "Input is not a number of build-in type. Got <class 'list'>"
    )

    with pytest.raises(ValueError) as info:
        add_one("1")
    assert (
        str(info.value)
        == "Input is not a number of build-in type. Got <class 'str'>"
    )
