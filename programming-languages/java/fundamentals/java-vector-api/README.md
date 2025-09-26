---
title: Java Vector API
aliases: []
tags: [#java,#performance]
created: 2025-09-25
updated: 2025-09-25
---

## Overview

The Java Vector API is an incubating API introduced in JDK 16 (JEP 338) that provides a way to express vector computations that reliably compile to optimal vector instructions on supported CPU architectures. It enables writing high-performance algorithms in Java that can leverage SIMD (Single Instruction, Multiple Data) hardware capabilities.

## Detailed Explanation

Vectors represent sequences of scalar values of the same type. Vector operations apply a scalar operator to corresponding elements in parallel, enabling significant performance gains.

Key components:
- **Vector Species**: Defines vector shape (size and element type).
- **Vector Operations**: Lane-wise (element-wise), cross-lane (reduction, permutation), and shape-changing operations.
- **Masks**: Control which lanes participate in operations.
- **Shuffles**: Specify lane rearrangements.

The API supports element types: `byte`, `short`, `int`, `long`, `float`, `double`.

Shapes include 64, 128, 256, 512 bits, and platform-dependent max bits.

Operations are compiled by HotSpot C2 to vector instructions on x64 (SSE/AVX) and AArch64 (NEON/SVE) architectures.

## Real-world Examples & Use Cases

- **Machine Learning**: Matrix operations, neural network computations.
- **Cryptography**: Bulk encryption/decryption algorithms.
- **Scientific Computing**: Array processing, signal processing.
- **Image Processing**: Pixel manipulations, filters.
- **JDK Internals**: Optimized implementations of `Arrays.hashCode`, string operations.

## Code Examples

### Scalar vs Vector Computation

```java
// Scalar
void scalarComputation(float[] a, float[] b, float[] c) {
    for (int i = 0; i < a.length; i++) {
        c[i] = (a[i] * a[i] + b[i] * b[i]) * -1.0f;
    }
}

// Vector
static final VectorSpecies<Float> SPECIES = FloatVector.SPECIES_PREFERRED;

void vectorComputation(float[] a, float[] b, float[] c) {
    int i = 0;
    int upperBound = SPECIES.loopBound(a.length);
    for (; i < upperBound; i += SPECIES.length()) {
        var va = FloatVector.fromArray(SPECIES, a, i);
        var vb = FloatVector.fromArray(SPECIES, b, i);
        var vc = va.mul(va).add(vb.mul(vb)).neg();
        vc.intoArray(c, i);
    }
    for (; i < a.length; i++) {
        c[i] = (a[i] * a[i] + b[i] * b[i]) * -1.0f;
    }
}
```

### Using Masks for Bounds Checking

```java
void vectorComputation(float[] a, float[] b, float[] c) {
    for (int i = 0; i < a.length; i += SPECIES.length()) {
        var m = SPECIES.indexInRange(i, a.length);
        var va = FloatVector.fromArray(SPECIES, a, i, m);
        var vb = FloatVector.fromArray(SPECIES, b, i, m);
        var vc = va.mul(va).add(vb.mul(vb)).neg();
        vc.intoArray(c, i, m);
    }
}
```

### Reduction Operation

```java
float sum = FloatVector.fromArray(SPECIES, array, 0)
                      .add(FloatVector.fromArray(SPECIES, array, SPECIES.length()))
                      .reduceLanes(VectorOperators.ADD);
```

## References

- [JEP 469: Vector API (Eighth Incubator)](https://openjdk.org/jeps/469)
- [Project Panama Vector API](https://openjdk.org/projects/panama/)

## Github-README Links & Related Topics

- [Performance Optimization Techniques](../performance-optimization-techniques/README.md)
- [Java Fundamentals](../java-fundamentals/README.md)