
## Day 3 Incident Lab
- Identified rogue high-CPU background processes using ps aux.
- Evaluated SIGTERM (15) vs SIGKILL (9) process signals.
- Successfully neutralized runaway processes and verified recovery.

## Day 3 Incident Lab (Extended Verification)
- Simulated rogue background loop and isolated PID.
- Executed SIGKILL (9) process termination.
- Verified 3-layer system recovery: Process Purge, System Load Average normalization, and PID signal check.
