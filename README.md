# spaceislinux_1.2
Space.Detected OS — A distilled environment for legacy hardware and systems programming. We’ve replaced heavy desktops with a precise LXQt + Openbox stack. Features: active ZRAM for 1GB RAM survival, Kernel 6.8, and deep-space aesthetics. This isn't just Mint; it's a tool that asks the user direct questions. Ready to face the void?


# Space.Detected OS (v. 2026.05)

> "Why waste time on noise when you can contemplate the system in its purest form?"

**Space.Detected OS** is a lightweight Linux Mint modification re-engineered for hardware that others consider "dead." Built by a systems programmer for those who value speed, minimalism, and the vast aesthetic of the cosmos.

### Key Features:
* **Kernel:** 6.8.0-31-generic (optimized for legacy CPU instructions).
* **Desktop Environment:** Full migration to **LXQt + Openbox**. This transition minimizes memory footprint and maximizes responsiveness.
* **Memory Management:** Forced **ZRAM** initialization via `rc.local` using the `lz4` compression algorithm. Your RAM now operates 1.5x–2x more efficiently.
* **Installer:** Features the standard Mint installer (ubiquity), fully adapted to the new environment.
* **Aesthetics:** Exclusive "Space is Linux" wallpaper integrated directly into the system theme.

### Link
Link on google drive: https://drive.google.com/file/d/1yAuGnMz7Rxho1HBZucqSy8QIiwvIOYJ9/view?usp=drive_link

### Technical Notes for Developers:
The system has been stripped of unnecessary daemons. If you encounter an exclamation mark on the installer icon, it is a known metadata artifact of the PCManFM-qt trust system; it does not affect kernel stability or installation logic.

### Installation:
1. Flash the ISO to a drive (Recommended: `dd` or Rufus in DD mode).
2. Boot into Live Mode.
3. Verify ZRAM status using the `zramctl` command.
4. Launch the installation via the desktop shortcut.

---
*Developed in Cubic on an i7-6700k. Dedicated to Niko and everyone searching for light within the infinite code.*
