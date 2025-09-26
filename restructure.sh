#!/bin/bash

# Create necessary directories
mkdir -p "Interview Prep"
mkdir -p Misc
mkdir -p "System Design/latency-throughput-performance"
mkdir -p "System Design/logging-monitoring"
mkdir -p "Applied Domains/messaging-systems"
mkdir -p "Applied Domains/video-conferencing"

# Move to Interview Prep
mv behavioral-interviews/ "Interview Prep/"
mv interview-matters/ "Interview Prep/"
mv interview-preparation/ "Interview Prep/"
mv mock-interview-preparation/ "Interview Prep/"
mv system-design-interview-tips/ "Interview Prep/"

# Move other to Misc
mv other/ Misc/

# Move from Misc to appropriate places
mv Misc/eureka-service-discovery/ Infrastructure/service-discovery/
mv Misc/zookeeper-for-coordination/ Infrastructure/service-discovery/
mv Misc/istio-service-mesh/ Infrastructure/service-mesh/
mv Misc/latency-throughput-zero-to-hero/ "System Design/latency-throughput-performance/"
mv Misc/paxos-algorithm/ "System Design/consensus-algorithms/"

# Move root dirs to System Design (merge contents)
mv data-consistency-models/* "System Design/consistency-models/" 2>/dev/null || true
rmdir data-consistency-models/ 2>/dev/null || true
mv eventual-consistency-patterns/* "System Design/consistency-models/" 2>/dev/null || true
rmdir eventual-consistency-patterns/ 2>/dev/null || true
mv load-balancing-and-strategies/* "System Design/load-balancing/" 2>/dev/null || true
rmdir load-balancing-and-strategies/ 2>/dev/null || true
mv performance-optimization-techniques/* "System Design/performance/" 2>/dev/null || true
rmdir performance-optimization-techniques/ 2>/dev/null || true
mv popular-system-designs-lld-hld/* "System Design/popular-system-designs/" 2>/dev/null || true
rmdir popular-system-designs-lld-hld/ 2>/dev/null || true
mv popular-systems-design-lld-and-hld/* "System Design/popular-system-designs/" 2>/dev/null || true
rmdir popular-systems-design-lld-and-hld/ 2>/dev/null || true
mv raft-consensus/* "System Design/consensus-algorithms/" 2>/dev/null || true
rmdir raft-consensus/ 2>/dev/null || true
mv real-time-analytics/* "System Design/analytics/" 2>/dev/null || true
rmdir real-time-analytics/ 2>/dev/null || true
mv saga-pattern/* "System Design/consensus-algorithms/" 2>/dev/null || true
rmdir saga-pattern/ 2>/dev/null || true
mv system-design-basics/* "System Design/basics/" 2>/dev/null || true
rmdir system-design-basics/ 2>/dev/null || true
mv lld-hld-basics/* "System Design/lld-hld/" 2>/dev/null || true
rmdir lld-hld-basics/ 2>/dev/null || true
mv raft-and-leader-election/* "System Design/consensus-algorithms/" 2>/dev/null || true
rmdir raft-and-leader-election/ 2>/dev/null || true
mv two-phase-commit/* "System Design/consensus-algorithms/" 2>/dev/null || true
rmdir two-phase-commit/ 2>/dev/null || true
mv consensus-algorithms-overview/* "System Design/consensus-algorithms/" 2>/dev/null || true
rmdir consensus-algorithms-overview/ 2>/dev/null || true
mv real-time-systems/* "System Design/real-time-systems/" 2>/dev/null || true
rmdir real-time-systems/ 2>/dev/null || true
mv replication-vs-sharding-vs-partitioning/* "System Design/replication-sharding-partitioning/" 2>/dev/null || true
rmdir replication-vs-sharding-vs-partitioning/ 2>/dev/null || true
mv logging-frameworks/* "System Design/logging-monitoring/" 2>/dev/null || true
rmdir logging-frameworks/ 2>/dev/null || true

# Move to Infrastructure
mv devops-and-infrastructure-as-code/* Infrastructure/devops-iac/ 2>/dev/null || true
rmdir devops-and-infrastructure-as-code/ 2>/dev/null || true
mv devops-infrastructure-as-code/* Infrastructure/devops-iac/ 2>/dev/null || true
rmdir devops-infrastructure-as-code/ 2>/dev/null || true
mv service-discovery/* Infrastructure/service-discovery/ 2>/dev/null || true
rmdir service-discovery/ 2>/dev/null || true
mv service-mesh-patterns/* Infrastructure/service-mesh/ 2>/dev/null || true
rmdir service-mesh-patterns/ 2>/dev/null || true
mv service-mesh-with-istio/* Infrastructure/service-mesh/ 2>/dev/null || true
rmdir service-mesh-with-istio/ 2>/dev/null || true
mv networking-sockets/* Infrastructure/networking/sockets/ 2>/dev/null || true
rmdir networking-sockets/ 2>/dev/null || true
mv kibana/* Infrastructure/monitoring/kibana/ 2>/dev/null || true
rmdir kibana/ 2>/dev/null || true
mv memcached/* Infrastructure/monitoring/memcached/ 2>/dev/null || true
rmdir memcached/ 2>/dev/null || true

# Merge devops
mv Infrastructure/devops-and-infrastructure/* Infrastructure/devops-iac/ 2>/dev/null || true
rmdir Infrastructure/devops-and-infrastructure/ 2>/dev/null || true

# Move to Applied Domains
mv machine-learning-model-deployment/* "Applied Domains/machine-learning/" 2>/dev/null || true
rmdir machine-learning-model-deployment/ 2>/dev/null || true
mv machine-learning-model-serving/* "Applied Domains/machine-learning/" 2>/dev/null || true
rmdir machine-learning-model-serving/ 2>/dev/null || true
mv payment-systems/* "Applied Domains/payment-systems/" 2>/dev/null || true
rmdir payment-systems/ 2>/dev/null || true
mv recommendation-systems/* "Applied Domains/recommendation-systems/" 2>/dev/null || true
rmdir recommendation-systems/ 2>/dev/null || true
mv slack-messaging-system/* "Applied Domains/messaging-systems/slack/" 2>/dev/null || true
rmdir slack-messaging-system/ 2>/dev/null || true
mv zoom-video-conferencing/* "Applied Domains/video-conferencing/zoom/" 2>/dev/null || true
rmdir zoom-video-conferencing/ 2>/dev/null || true

# For Security
mv security-best-practices-in-java/* Security/java/ 2>/dev/null || true
rmdir security-best-practices-in-java/ 2>/dev/null || true
mv security-best-practices-in-microservices/* Security/microservices/ 2>/dev/null || true
rmdir security-best-practices-in-microservices/ 2>/dev/null || true
mv security-in-distributed-systems/* Security/distributed-systems/ 2>/dev/null || true
rmdir security-in-distributed-systems/ 2>/dev/null || true

# Rename in Security
mv Security/java/* Security/best-practices-in-java/ 2>/dev/null || true
rmdir Security/java/ 2>/dev/null || true
mv Security/microservices/* Security/best-practices-in-microservices/ 2>/dev/null || true
rmdir Security/microservices/ 2>/dev/null || true

# For System Design performance
mv "System Design/performance"/* "System Design/latency-throughput-performance/" 2>/dev/null || true
rmdir "System Design/performance/" 2>/dev/null || true

# For logging
mv "System Design/logging"/* "System Design/logging-monitoring/" 2>/dev/null || true
rmdir "System Design/logging/" 2>/dev/null || true

# For analytics, merge real-time-analytics
mv real-time-analytics/ "System Design/analytics/" 2>/dev/null || true

# For popular-system-designs
mv popular-system-designs/ "System Design/popular-system-designs/" 2>/dev/null || true

# For eventual-consistency
mv eventual-consistency/ "System Design/consistency-models/" 2>/dev/null || true
mv eventual-consistency-in-distributed-systems/ "System Design/consistency-models/" 2>/dev/null || true