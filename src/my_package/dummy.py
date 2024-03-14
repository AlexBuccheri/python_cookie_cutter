"""Dummy function to demonstrate for use in testing and documentation
"""

from typing import Union

num_types = Union[int, float, complex]


def add_one(x: num_types) -> num_types:
    r"""Add one to a number.

    This function trivially adds one to a number.

    .. math::

        x + 1

    :param x: Number
    :return: Number plus one
    """

    if not isinstance(x, (int, float, complex)):
        raise ValueError(
            f"Input is not a number of build-in type. Got {type(x)}"
        )
    return x + 1


def latex_stub():
    r"""This is a dummy routine that demonstrates latex documentation.

    This function computes the optimal weight vector \( w_k^* \) using the following formula:

    .. math::

        w_k^* = \min_{w_k} \ell_k(w_k) + \lambda\left(\alpha||w_k||_1
        + \frac{1}{2}(1-\alpha) ||w_k||^2\right)

    where \( \ell_k(w_k) \) is the loss function for the \( k \)-th component, \( \lambda \)
    is the regularization parameter, and \( \alpha \) controls the trade-off between
    \( L_1 \) and \( L_2 \) regularization.

    :param loss_func: The loss function \( \ell_k(w_k) \) for the \( k \)-th component.
    :param regularization_param: The regularization parameter \( \lambda \).
    :param alpha: The trade-off parameter \( \alpha \).
    :return: The optimal weight vector \( w_k^* \).
    """
    pass
