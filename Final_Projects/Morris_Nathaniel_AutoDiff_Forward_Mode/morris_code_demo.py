# Original source: https://huggingface.co/blog/andmholm/what-is-automatic-differentiation
# With modifications by Nathaniel W. Morris

# Sets up the "elementary operations"
# with "operator overloading"
class Variable:
    # Variable intializer
    def __init__(self, primal, tangent):
        self.primal = primal
        self.tangent = tangent

    # Addition overloading
    def __add__(self, other):
        primal = self.primal + other.primal
        tangent = self.tangent + other.tangent
        return Variable(primal, tangent)

    # Subtraction overloading
    def __sub__(self, other):
        primal = self.primal - other.primal
        tangent = self.tangent - other.tangent
        return Variable(primal, tangent)

    # Multiplication overloading
    def __mul__(self, other):
        primal = self.primal * other.primal
        tangent = self.tangent * other.primal + other.tangent * self.primal
        return Variable(primal, tangent)

    # Division overloading
    def __truediv__(self, other):
        primal = self.primal / other.primal
        tangent = (self.tangent / other.primal) + (
            -self.primal / other.primal**2
        ) * other.tangent
        return Variable(primal, tangent)

    # Print formatter overloading
    def __repr__(self):
        return f"primal: {self.primal}, tangent: {self.tangent}"
    

# Automatic differentiation demonstration
def mul_add(a, b, c):
    return a * b + c * a

def add_mul(a, b, c):
    return (a + b) * (b + c)

def div_sub(a, b, c):
    return a / b - c

def sub_div(a, b, c):
    return a - (b / c)

a = Variable(25.0, 1.0)
b = Variable(4.0, 0.0)
c = Variable(-5.0, 0.0)

print(f"{a = }")
print(f"{b = }")
print(f"{c = }")

print(f"{mul_add(a, b, c) = }")

print(f"{add_mul(a, b, c) = }")

a.tangent = 0.0
b.tangent = 1.0
c.tangent = 0.0

print(f"{div_sub(a, b, c) = }")

print(f"{sub_div(a, b, c) = }")
