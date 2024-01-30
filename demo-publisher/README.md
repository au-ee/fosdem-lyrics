# Demo Publisher

The demo publisher pushes a new bogus song text to both messaging servers, waits for three seconds and sends the next one.

## Usage

```bash
chmod +x demopub.sh
./demopub.sh
```

## Configuration

To get it running, you will need to install and configure the following CLI tools:

- NATS
  
  Download here: https://github.com/nats-io/natscli

  Once installed, a context needs to be added:

  ```bash
  nats context add nats --server YOUR_SERVER_NAME:4222  \
      --user=YOUR_USER_NAME --password=YOUR_PASSWORD --select
  ```

- EMQX (alternatively / optionally)

  Download here: https://mqttx.app/cli

  Enter your server name / credentials in `demopub.sh`