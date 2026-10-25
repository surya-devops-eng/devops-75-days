#!/bin/bash
# Day 3 High-CPU Incident Triage & Verification Script

echo "--- Layer 1: Checking for lingering rogue processes ---"
ps aux | grep "[y]es" || echo "No rogue 'yes' processes found."

echo "--- Layer 2: Checking System CPU Load ---"
uptime

echo "--- Layer 3: Checking Apache Web Service Status ---"
systemctl is-active apache2 && echo "Apache2 service is active."
