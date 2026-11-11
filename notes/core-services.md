# Core services at a glance

## Compute

| Service | Use it for |
|---|---|
| Virtual Machines | Full control of the OS (IaaS) |
| Virtual Machine Scale Sets | Groups of identical VMs that autoscale |
| App Service | Hosting web apps and APIs without managing servers (PaaS) |
| Azure Functions | Event-driven serverless code |
| Azure Kubernetes Service (AKS) | Managed Kubernetes |
| Container Instances | Running a container quickly without a cluster |

## Networking

| Service | Use it for |
|---|---|
| Virtual Network (VNet) | Private network; divided into subnets |
| Network Security Group (NSG) | Allow/deny rules for traffic to subnets and NICs |
| Load Balancer | Layer 4 (TCP/UDP) load balancing |
| Application Gateway | Layer 7 (HTTP) load balancing, with optional WAF |
| VPN Gateway / ExpressRoute | Connecting on-premises networks to Azure |
| VNet peering | Connecting two virtual networks |
| Azure DNS | Hosting DNS zones |

## Storage

| Service | Use it for |
|---|---|
| Blob storage | Unstructured objects; hot, cool, cold and archive access tiers |
| Azure Files | Managed SMB/NFS file shares |
| Queue storage | Simple message queues |
| Table storage | NoSQL key/attribute store |
| Managed Disks | Block storage for VMs |

Redundancy options: LRS (one datacenter), ZRS (across zones), GRS (paired region),
GZRS (zones plus paired region).

## Databases

Azure SQL Database, Azure SQL Managed Instance, Azure Cosmos DB,
Azure Database for PostgreSQL and MySQL.

## Identity and security

| Service | Use it for |
|---|---|
| Microsoft Entra ID | Users, groups, app registrations, single sign-on |
| Managed identities | Letting Azure resources authenticate without stored secrets |
| Key Vault | Secrets, keys and certificates |
| Microsoft Defender for Cloud | Security posture and threat protection |

## Monitoring

Azure Monitor (metrics and alerts), Log Analytics (query logs with KQL),
Application Insights (application performance monitoring).
