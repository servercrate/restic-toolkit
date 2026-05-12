# Quick start

```bash
git clone https://github.com/servercrate/restic-toolkit /opt/restic-toolkit
cd /opt/restic-toolkit
cp templates/env.example .env
$EDITOR .env

# Create a 256-bit passphrase
openssl rand -base64 48 | sudo tee /etc/restic.pw > /dev/null
sudo chmod 600 /etc/restic.pw

# Initialize the repo (one-time)
./scripts/sc-init.sh

# First backup
./scripts/sc-backup.sh

# Install the systemd timer so it runs nightly
sudo cp systemd/restic-backup@.service /etc/systemd/system/
sudo cp systemd/restic-backup@.timer   /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now restic-backup@nightly.timer
```
