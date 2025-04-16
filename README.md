# Gauss-Crout-decomposition-as-a-tool-for-solving-electric-circuits
This is a project which I made for my course named Computational Techniques. It's a tool which can easily solve electric circuits. It's enough to bring a circuit into equations of Mesh Current Method or  Potential Method.
##  Overview

The main goal of the project is to provide a tool for solving systems of `n` equations with `n` unknowns using the **Crout decomposition method**. It decomposes a matrix `A` into a lower triangular matrix `L` and an upper triangular matrix `U`, such that:

```
A = L * U
```

To ensure numerical stability and avoid division by zero in edge cases (e.g., when leading principal minors are zero), the method has been adapted with **Gauss-Crout modifications**.

This approach is particularly useful in electrical engineering for solving complex circuit equations that would otherwise be difficult or time-consuming to compute manually.

##  How It Works

### `main.m`
- Serves as the user interface.
- Offers two modes:
  1. **Predefined examples** (e.g., 3x3 and 9x9 systems from real circuit problems)
  2. **User's input** — allows user to enter a matrix and result vector manually.

### 'user_input.m'
- Minor function provides user's input

### 'predefined_examples.m'
- Minor function provides predefined examples

### `gauss_crout_decomp.m`
- Implements the Gauss-Crout decomposition algorithm.
- Generates matrices `L` (lower triangular) and `U` (upper triangular with 1s on the diagonal).
- Uses nested loops to compute `L` and `U` based on formulas.

### `solve.m`
- Solves the system using forward and backward substitution.
- Calculates:
  - `y` from `L * y = B`
  - `x` from `U * x = y`

## Example Problems

### Simple 3x3 System

System:

```
[70   0 -30]   [I1]   [6]
[ 0  20   0] * [I2] = [4]
[-30  0  30]   [I3]   [2]
```

Solution:
- `I1 = 0.2 A`
- `I2 = 0.2 A`
- `I3 = 0.2667 A`

---

### Complex 9x9 System

Used to simulate a large electrical network. Matrix and result vector are predefined in the program.

Sample output:
```
I1 = -0.1034 A
I2 = 0.1825 A
I3 = -0.5966 A
...
I9 = 0.4799 A
```


## Summary

This tool shows how **Crout decomposition** can effectively solve both small and large systems of equations arising in circuit analysis. While great for educational and practical use, care must be taken with certain input matrices due to the limitations of the basic algorithm.


## Author

- **Michał Ciągała**
- AGH University of Cracow
