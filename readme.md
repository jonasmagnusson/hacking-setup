# Hacking Setup

Script to build your own pwnbox with hacking tools and small scripts used in CTFs and Bug Bounty.

## Usage

Run the following as root to download and install tools and wordlists:

```bash
# Download and run tools script
curl -s -L https://raw.githubusercontent.com/jonasmagnusson/pwnbox/main/tools.sh | bash

# Download and run wordlist script
curl -s -L https://raw.githubusercontent.com/jonasmagnusson/pwnbox/main/wordlists.sh | bash
```

## Out-of-Band DNS Server

Using DNS for Out-of-Band requests to find blind vulnerabilties like XXE, SSRF and XXS. Inject payloads and grep through the DNS logs to see if the payload was executed.

```bash
# Define variables
export DOMAIN=domain
export IP=ip

# Download and run script
curl -s -L https://raw.githubusercontent.com/jonasmagnusson/pwnbox/main/oob-dnsserver.sh | bash
```
