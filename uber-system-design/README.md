---
title: 'Uber System Design'
aliases: ['Uber SD', 'Uber Architecture']
tags: ['#system-design', '#ride-sharing']
created: '2025-09-25'
updated: '2025-09-25'
---

# Uber System Design

## Overview

Uber's system design revolves around a real-time market platform that efficiently matches riders with drivers in a dynamic supply-demand environment. Key challenges include handling geospatial data at scale, real-time matching, high availability, and supporting multiple products like rides, food delivery, and package transport. The architecture uses microservices, advanced geospatial indexing, and fault-tolerant distributed systems to achieve scalability and reliability.

## Detailed Explanation

Uber's architecture is built on microservices using technologies like Node.js, Python, Java, and Go. The core component is the Dispatch system (DISCO), which optimizes matching between supply (drivers) and demand (riders).

### Key Components

- **Supply Service**: Tracks driver locations, vehicle attributes, and availability.
- **Demand Service**: Manages rider requests, requirements, and preferences.
- **Geospatial Index**: Uses Google S2 library to divide the Earth into cells for efficient location-based queries. Handles millions of writes per second from driver updates.
- **Routing/ETA Service**: Calculates estimated times of arrival using maps and historical data.
- **Databases**: Mix of Redis for caching, Postgres/MySQL for relational data, Riak for distributed storage.
- **Communication**: TChannel for RPC, Ringpop for consistent hashing and gossip protocol to scale Node.js services.

### Architecture Diagram

```mermaid
graph TD
    A[Rider/Driver Apps] --> B[API Gateway]
    B --> C[Dispatch Service (DISCO)]
    C --> D[Supply Service]
    C --> E[Demand Service]
    C --> F[Geospatial Index (S2 Cells)]
    F --> G[Routing/ETA Service]
    D --> H[Databases: Redis, Postgres, Riak]
    E --> H
    C --> I[Payment & Post-Trip Services]
```

The system supports real-time matching, future planning for routes, and handles failures through retryable requests and crash-only design.

## Real-world Examples & Use Cases

- **Surge Pricing**: Dynamically adjusts prices based on supply-demand imbalance.
- **Peak Times**: Handles events like New Year's Eve with thousands of concurrent requests.
- **Multi-Modal Transport**: Extends to Uber Eats, Uber Freight by abstracting supply and demand.
- **Datacenter Failover**: Uses driver phones as external storage for trip state recovery.

## Code Examples

### Pseudocode for Basic Matching Algorithm

```python
def match_rider_to_driver(rider_location, rider_requirements, available_drivers):
    # Query geospatial index for nearby drivers
    nearby_drivers = geospatial_query(rider_location, radius=5km)
    
    # Filter by requirements (e.g., car seats, vehicle type)
    candidates = [d for d in nearby_drivers if matches_requirements(d, rider_requirements)]
    
    # Calculate ETAs
    etas = [calculate_eta(d.location, rider_location) for d in candidates]
    
    # Sort by ETA and select best match
    best_driver = min(zip(candidates, etas), key=lambda x: x[1])[0]
    
    return best_driver
```

### Geospatial Cell Calculation (Simplified)

```java
import com.google.common.geometry.S2CellId;

public class GeospatialUtils {
    public static long getCellId(double lat, double lng) {
        S2CellId cellId = S2CellId.fromLatLng(S2LatLng.fromDegrees(lat, lng));
        return cellId.id();
    }
}
```

## References

- [How Uber Scales Their Real-time Market Platform](https://highscalability.com/blog/2016/10/12/how-uber-scales-their-real-time-market-platform.html)
- [System Design of Uber App - GeeksforGeeks](https://www.geeksforgeeks.org/system-design-of-uber-app/) (Note: URL may be outdated)
- [Uber System Design - SystemDesign.one](https://systemdesign.one/uber-system-design/) (Note: URL may be outdated)

## Github-README Links & Related Topics

- [Netflix System Design](../netflix-system-design/README.md)
- [Twitter System Design](../twitter-system-design/README.md)
- [Distributed Caching with Redis](../distributed-caching-with-redis/README.md)
- [Microservices Architecture](../microservices-architecture/README.md)
- [Load Balancing and Strategies](../load-balancing-and-strategies/README.md)