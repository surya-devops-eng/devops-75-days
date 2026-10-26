# 🌐 Day 4: Linux Networking, Ports, Firewall Security & Incident Response

A comprehensive guide and lab record covering Linux networking fundamentals, Layer 4 transport sockets, UFW firewall administration, real-world incident response protocols, and network packet auditing.

---

## 🏛️ Executive Summary & Key Analogies

### 🏨 Sockets & Ports (The Grand Hotel Analogy)
* **IP Address (`123 Tech Blvd`):** Routes traffic from anywhere in the world to the exact server hardware.
* **Port Number (Service Counter):** Directs incoming connections to specific applications (e.g., Port `80`/`443` for Web, Port `22` for SSH, Port `3306` for Database).
* **Socket Pair:** An established communication line linking a client (`Client IP:Port`) to a server (`Server IP:Port`).

### 🚪 Firewall Administration (The Nightclub Bouncer Analogy)
* **UFW (Uncomplicated Firewall):** Acts as a smart tablet wrapper managing raw kernel packet rules (`iptables`).
* **Security Posture:** Production best practice uses **Default Deny Incoming** and **Default Allow Outgoing**.
* **Action Types:** `ALLOW` (permits packet entry), `DENY` (silently drops packet), `REJECT` (drops packet and returns explicit error).

---

## 🧰 Command Cheat Sheet

| Category | Tool | Command | Production Purpose |
| :--- | :--- | :--- | :--- |
| **Interface & ICMP** | `ip` / `ping` | `ip a` / `ping -c 4 8.8.8.8` | Inspect network adapters and test latency. |
| **DNS Resolution** | `dig` | `dig github.com +short` | Query clean DNS A-records without header overhead. |
| **Socket Audit** | `ss` | `ss -tulpn` | Audit listening TCP/UDP sockets and process PIDs. |
| **Process Ownership**| `lsof` | `sudo lsof -i :<port>` | Identify the exact PID bound to a specific port. |
| **Port Probing** | `nc` | `nc -zv <host> <port>` | Test Layer 4 TCP reachability without payload data. |
| **Firewall Control** | `ufw` | `sudo ufw status numbered` | Display active firewall rules with index numbers. |
| **Path Tracing** | `traceroute` | `traceroute -n 8.8.8.8` | Map intermediate router hops to a remote host. |
| **Packet Capture** | `tcpdump` | `sudo tcpdump -i lo -c 4 icmp` | Capture raw network frames at the kernel layer. |
| **Security Scanning** | `nmap` | `nmap -F 127.0.0.1` | Perform a quick port availability scan on target IPs. |

---

## 🚨 Incident Response Workflows

### 1. Port Collision Triage (`Errno 98: Address already in use`)
* **Symptom:** Application fails to start because another process is holding the target socket.
* **Resolution Steps:**
  1. Identify PID: `sudo lsof -i :8080`
  2. Terminate rogue process: `sudo kill -9 <PID>`
  3. Confirm port liberation: `ss -tulpn | grep 8080`

### 2. Network Blockade Triage (`Refused` vs `Timed Out`)
* **`Connection Refused`:** Network path is open, but no server application is listening on that target socket.
* **`Connection Timed Out`:** Host firewall (`ufw`/`iptables`) is silently dropping (`DENY`) incoming packets.

---

## 🧪 Completed Lab Checklist

- [x] Inspected network adapters (`ip a`) and loopback interface (`lo`).
- [x] Verified DNS resolution using `dig` and `nslookup`.
- [x] Audited active listening sockets using `ss -tulpn`.
- [x] Probed HTTPS reachability (`443`) on `github.com` via `nc -zv`.
- [x] Installed `ufw`, configured SSH (`22/tcp`) and HTTP (`80/tcp`) rules.
- [x] Simulated port conflicts with background Python HTTP servers and resolved via `kill -9`.
- [x] Audited loopback packet traffic with `tcpdump` and local ports with `nmap`.
