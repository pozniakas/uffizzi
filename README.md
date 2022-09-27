<<<<<<< HEAD
![banner](docs/images/banner.png)

# [Uffizzi](https://uffizzi.com)

Uffizzi is a cloud-native REST API for managing lightweight, event-driven, and ephemeral test environments on Kubernetes. Uffizzi provides test environments as a service to Development teams while reducing management and resource overhead for Operations teams.

Uffizzi allows you to define your application in Docker Compose and is designed to integrate with any CI/CD system.

Uffizzi uses namespaces to isolate containerized, production-like replicas of your application within a single cluster. These environments are designed to host any number of containerized services and can be used for PR/MR environments, preview environments, release environments, demo environments, and staging environments. They require minimal compute resources and can be quickly created, updated, and deleted in response to CI/CD events.

While Uffizzi depends on Kubernetes, it does not require end-users to interface with Kubernetes directly. Developers can define their application in docker-compose and Uffizzi translates this into Kubernetes API calls that create an environment within a namespace. Uffizzi coordinates a dynamic DNS and TLS certificate for a secure, shareable URL endpoint. New commits automatically update the environment, and the environment with all associated elements can be deleted in response to CI/CD events.
=======

![banner](docs/images/banner.png)

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
>>>>>>> develop

## What is Uffizzi?

Uffizzi is a cloud-native REST API for managing lightweight, event-driven test environments on Kubernetes. It provides Development teams with an environments-as-a-service capability, while eliminating the need for Operations teams to configure and manage test infrastructure and tooling. 

## Use cases
Uffizzi is designed to integrate with any CI/CD platform as a step in your pipeline. Example use cases include rapidly creating PR environments, preview environments, release environments, demo environments, and staging environments. 

## Why Uffizzi?

- **👩‍💻 Developer-friendly** - The Uffizzi API provides a simplified interface to Kubernetes, allowing you to define your application with Docker Compose.

- **🪶 Lightweight** - Uffizzi test environments are isolated namespaces within a single cluster. This level of abstraction helps reduce a team's infrastructure footprint and associated overhead.

- **🔁 Event-driven** - Designed to integrate with any CI/CD system, Uffizzi environments are created, updated, or deleted via triggering events, such as pull requests or new release tags. Uffizzi generates a secure HTTPS URL for each environment, which is continually refreshed in response to new events.

- **🧼 Clean** - The ephemeral nature of Uffizzi test environments means your team can test new features or release candidates in clean, parallel environments before merging or promoting to production.

## Project roadmap

See our high-level [project roadmap](https://github.com/orgs/UffizziCloud/projects/2/views/1?layout=board), including already delivered milestones.

## Getting started

The easiest way to get started with Uffizzi is via the managed API service provided by Uffizzi Cloud, as describe in the [quickstart guide](https://docs.uffizzi.com). This option is free for small teams and is recommended for those who are new to Uffizzi. Alternatively, you can get started creating on-demand test environments on your own cluster by following the [self-hosted installation guide](INSTALL.md).

## Documentation
- [Main documentation](https://docs.uffizzi.com)
- [Docker Compose for Uffizzi ](https://docs.uffizzi.com/references/compose-spec/)

## Community

- [Slack channel](https://join.slack.com/t/uffizzi/shared_invite/zt-ffr4o3x0-J~0yVT6qgFV~wmGm19Ux9A) - Get support or discuss the project  
- [Subscribe to our newsletter](http://eepurl.com/hsws0b) - Receive monthly updates about new features and special events  
- [Contributing to Uffizzi](CONTRIBUTING.md) - Start here if you want to contribute
- [FAQ](https://uffizzi.com/#faqs) - Frequently Asked Questions
- [Code of Conduct](CODE_OF_CONDUCT.md) - Let's keep it professional
- [Engineering Blog](https://docs.uffizzi.com/engineeringblog/ci-cd-registry/) - Lessons learned and best practices from Uffizzi maintainers
- Give us a star ⭐️ - If you are using Uffizzi or just think it's an interesting project, star this repo! This helps others find out about our project.

## License

This library is licensed under the Apache License, Version 2.0: http://www.apache.org/licenses/LICENSE-2.0

## Security

If you discover a security related issues, please do **not** create a public github issue. Notify the Uffizzi team privately by sending an email to security@uffizzi.com.
