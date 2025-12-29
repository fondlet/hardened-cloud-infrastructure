Networking Architecture: Encrypted Layer-3 Tunneling

This project utilizes WireGuard to create a secure overlay network. This architecture ensures that the cloud instance remains in "Stealth Mode" on the public internet.
1. Tunnel Specifications

    Protocol: UDP

    Listen Port: 51820

    Internal Subnet: 10.0.0.0/24

    Encryption: Curve25519 (PFS - Perfect Forward Secrecy)

2. MTU Optimization

To prevent packet fragmentation across different network carriers, the Maximum Transmission Unit (MTU) was manually tuned to 1280. This accounts for the 60-80 byte overhead added by WireGuard encapsulation, ensuring stable performance on high-latency connections.
3. Traffic Routing (Split-Tunneling)

The client (Arch Linux) is configured with AllowedIPs = 10.0.0.0/24. This implements Split-Tunneling, where only traffic destined for the private cloud travels through the VPN, while standard web traffic remains on the local ISP interface for maximum speed.
