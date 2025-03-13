# MegaTrix

MegaTrix is a high-performance flexible metrics collection and aggregation service stack.

## Overview

Sub-A-Tron is our metrics collector, it gathers logs and metrics and sends them to MegaTrix where they can be easily indexed and queried by dashboards, autoscaling services, and alert systems across your cloud.

## Architecture

MegaTrix consists of two main components:

1. **MegaTrix Core** - Written in Elixir, this is the central metrics aggregation and processing service that:
   - Receives metrics from collectors
   - Processes and stores metrics data
   - Provides query interfaces for monitoring tools
   - Exports data to external systems

2. **Sub-A-Tron** - A lightweight Rust-based metrics collector that:
   - Gathers system and application metrics
   - Collects logs from various sources
   - Efficiently transmits data to MegaTrix Core
   - Operates with minimal resource footprint

## Features

- **High Performance**: Optimized for handling large volumes of metrics data
- **Scalability**: Designed to scale horizontally across your infrastructure
- **Flexible Collection**: Gather metrics from diverse sources and systems
- **Easy Integration**: Simple APIs for dashboards and monitoring tools
- **Alerting Capabilities**: Configure alerts based on metric thresholds
- **Cloud-Native**: Works seamlessly in containerized and cloud environments

## Getting Started

### Prerequisites

- Elixir 1.18 or higher
- Rust (latest stable) for Sub-A-Tron
- Erlang/OTP 26.2.1 or higher

### Installation

#### MegaTrix Core

```bash
# Clone the repository
git clone https://github.com/yourusername/megatrix.git
cd megatrix

# Install dependencies
mix deps.get

# Compile the project
mix compile

# Start the application
mix run --no-halt
```

#### Sub-A-Tron

```bash
# Navigate to Sub-A-Tron directory
cd Sub-A-Tron

# Build
cargo build --release

# Run
./target/release/Sub-A-Tron
```

## Configuration

MegaTrix is configured through environment variables and configuration files. See the [Configuration Guide](docs/configuration.md) for details.

## Development

### Running Tests

```bash
# For MegaTrix Core
mix test

# For Sub-A-Tron
cd Sub-A-Tron
cargo test
```

## License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Roadmap

Coming soon!
