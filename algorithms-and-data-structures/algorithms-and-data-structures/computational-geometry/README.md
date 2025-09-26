---
title: 'Computational Geometry'
aliases: ["Geometric Algorithms"]
tags: ["#algorithms", "#computational-geometry"]
created: 2025-09-25
updated: 2025-09-25
---

# Computational Geometry

## Overview

Computational geometry is a branch of computer science focused on designing algorithms to solve geometric problems efficiently. It deals with discrete geometric objects like points, lines, polygons, and polyhedra, and their properties such as intersections, convex hulls, and spatial relationships. Key problems include computing convex hulls, detecting line intersections, and handling geometric queries. The field emphasizes algorithmic efficiency, often requiring O(n log n) time for large datasets, and has applications in computer graphics, robotics, GIS, and CAD/CAM systems.

## Detailed Explanation

### Convex Hull
The convex hull of a set of points is the smallest convex polygon that encloses all points. It can be computed using algorithms like:
- **Jarvis March (Gift Wrapping)**: Starts from the leftmost point and iteratively adds points in counterclockwise order. Time complexity: O(nh), where h is hull vertices.
- **Graham Scan**: Sorts points by polar angle and builds the hull by removing non-convex turns. Time complexity: O(n log n).
- **QuickHull**: Recursive divide-and-conquer approach. Time complexity: O(n log n) average case.

### Line Intersection
Determines if two lines or line segments intersect. For line segments, use orientation tests:
- Compute orientations of endpoints relative to each other.
- General case: Segments intersect if endpoints straddle each other.
- Special case: Collinear segments intersect if projections overlap.

### Other Geometric Algorithms
- **Closest Pair**: Find minimum distance between points. Uses divide-and-conquer in O(n log n).
- **Delaunay Triangulation**: Maximizes minimum angle in triangulation.
- **Voronoi Diagrams**: Partition space by closest points.

## Real-world Examples & Use Cases

| Application | Description | Example |
|-------------|-------------|---------|
| Computer Graphics | Collision detection in games | Convex hull for bounding volumes |
| Robotics | Motion planning | Line intersection for obstacle avoidance |
| GIS | Route planning | Convex hull for spatial queries |
| CAD/CAM | IC design verification | Geometric intersection checks |
| Image Processing | Object segmentation | Convex hull for shape analysis |

## Code Examples

### Convex Hull using Jarvis March (C++)
```cpp
#include <bits/stdc++.h>
using namespace std;

struct Point {
    int x, y;
};

int orientation(Point p, Point q, Point r) {
    int val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);
    if (val == 0) return 0;
    return (val > 0) ? 1 : 2;
}

void convexHull(Point points[], int n) {
    if (n < 3) return;
    vector<Point> hull;
    int l = 0;
    for (int i = 1; i < n; i++)
        if (points[i].x < points[l].x) l = i;
    int p = l, q;
    do {
        hull.push_back(points[p]);
        q = (p + 1) % n;
        for (int i = 0; i < n; i++) {
            if (orientation(points[p], points[i], points[q]) == 2)
                q = i;
        }
        p = q;
    } while (p != l);
    for (auto& pt : hull) cout << "(" << pt.x << ", " << pt.y << ")\n";
}

int main() {
    Point points[] = {{0, 3}, {2, 2}, {1, 1}, {2, 1}, {3, 0}, {0, 0}, {3, 3}};
    int n = sizeof(points)/sizeof(points[0]);
    convexHull(points, n);
    return 0;
}
```

### Line Segment Intersection Check (C++)
```cpp
#include <bits/stdc++.h>
using namespace std;

struct Point {
    int x, y;
};

bool onSegment(Point p, Point q, Point r) {
    return (q.x <= max(p.x, r.x) && q.x >= min(p.x, r.x) &&
            q.y <= max(p.y, r.y) && q.y >= min(p.y, r.y));
}

int orientation(Point p, Point q, Point r) {
    int val = (q.y - p.y) * (r.x - q.x) - (q.x - p.x) * (r.y - q.y);
    if (val == 0) return 0;
    return (val > 0) ? 1 : 2;
}

bool doIntersect(Point p1, Point q1, Point p2, Point q2) {
    int o1 = orientation(p1, q1, p2);
    int o2 = orientation(p1, q1, q2);
    int o3 = orientation(p2, q2, p1);
    int o4 = orientation(p2, q2, q1);
    if (o1 != o2 && o3 != o4) return true;
    if (o1 == 0 && onSegment(p1, p2, q1)) return true;
    if (o2 == 0 && onSegment(p1, q2, q1)) return true;
    if (o3 == 0 && onSegment(p2, p1, q2)) return true;
    if (o4 == 0 && onSegment(p2, q1, q2)) return true;
    return false;
}

int main() {
    Point p1 = {1, 1}, q1 = {10, 1};
    Point p2 = {1, 2}, q2 = {10, 2};
    cout << (doIntersect(p1, q1, p2, q2) ? "Yes" : "No");
    return 0;
}
```

## Common Pitfalls & Edge Cases

- **Collinear Points**: Handle in convex hull by choosing farthest points.
- **Degenerate Cases**: Lines coinciding or parallel; check for zero denominators.
- **Floating Point Precision**: Use exact arithmetic or epsilon comparisons.
- **Large Datasets**: Ensure O(n log n) algorithms for scalability.

## Tools & Libraries

- **CGAL**: Computational Geometry Algorithms Library (C++).
- **Boost.Geometry**: Boost library for geometric computations.
- **JTS**: Java Topology Suite for 2D geometry.
- **Shapely**: Python library for geometric operations.

## References

- [Computational Geometry - Wikipedia](https://en.wikipedia.org/wiki/Computational_geometry)
- [Convex Hull - Wikipedia](https://en.wikipedia.org/wiki/Convex_hull)
- [Line–line Intersection - Wikipedia](https://en.wikipedia.org/wiki/Line%E2%80%93line_intersection)
- [Convex Hull using Jarvis Algorithm - GeeksforGeeks](https://www.geeksforgeeks.org/convex-hull-using-jarvis-algorithm-or-wrapping/)
- [Convex Hull using Graham Scan - GeeksforGeeks](https://www.geeksforgeeks.org/convex-hull-using-graham-scan/)
- [How to check if two given line segments intersect? - GeeksforGeeks](https://www.geeksforgeeks.org/check-if-two-given-line-segments-intersect/)

## Github-README Links & Related Topics

- [Algorithms and Data Structures](../algorithms-and-data-structures/)
- [Sorting Algorithms](../sorting-algorithms/)
- [Graph Algorithms](../graph-algorithms/)
- [Dynamic Programming](../dynamic-programming-and-greedy/)