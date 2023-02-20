docker cp $(docker-compose ps -q rp-portal):/root/.local/share/caddy/pki/authorities/local/root.crt tmp/ && \
sudo security add-trusted-cert -d -r trustRoot -k "/Library/Keychains/System.keychain" tmp/root.crt && \
rm -f tmp/root.crt