# Symfony Microservices POC

### Directory Structure:

Considering the double root strategy, the directory structure has the following format:

```
your-project/
│
├── packages/
│   ├── Reservations/
│   │   └── (Symfony structure for Reservations service)
│   ├── Auth/
│   │   └── (Symfony structure for Auth service)
│   ├── Permissions/
│   │   └── (Symfony structure for Permissions service)
│   ├── Payments/
│   │   └── (Symfony structure for Payments service)
│   └── Notifications/
│       └── (Symfony structure for Notifications service)
│
└── libs/
    ├── SharedLibrary1/
    └── SharedLibrary2/
```

### Microservices Breakdown:

1. **Reservations Service**:
    - Handles CRUD operations for reservations.
    - Manages different user roles (Admins, Owners, Front Desk, etc.).
    - Transacts payments for reservations.
    - Components: Controller, Service, Repository, Models.

2. **Auth Service**:
    - Manages authentication and authorization.
    - Responsible for user creation and role assignment.
    - Handles role-based permissions.
    - Components: Auth and Users Controllers, Services, Repositories, Models.

3. **Permissions Service**:
    - Manages role creation and permission assignments.
    - Utilizes a shared database module.
    - Components: Role and Permissions Controllers, Services, Repositories, Models.

4. **Payments Service**:
    - Handles payment transactions (e.g., using Stripe).
    - Interacts with the Reservations service.
    - Components: Payment Controller, Service, Repository, Models.

5. **Notifications Service**:
    - Sends notifications (email, SMS) for reservation activities.
    - Components: Notification Controller, Service, Repository, Models.

### Shared Resources (`libs` Directory):

The `libs` directory will contain shared libraries or modules that are used across different services. This could include:

- **Shared Database Module**: A common module for database interactions.
- **Shared Utilities**: Common utilities like logging, error handling, etc.
- **API Clients**: For external services like Stripe or email/SMS providers.
- **Common Interfaces**: For ensuring consistent service interfaces.

### Considerations:

- **Service Communication**: Determine how these services will communicate (e.g., REST, gRPC, message queues).
- **Database Management**: Decide whether each service will have its own database (database per service) or if some will share databases.
- **Configuration Management**: How to manage and inject configurations in each service.
- **Security**: Ensure secure communication between services, especially for sensitive operations in the Auth and Payments services.
- **Testing**: Plan for unit and integration testing for each service.

### Symfony Specifics:

- Use Symfony's bundle system to encapsulate the logic of each microservice.
- Leverage Symfony's security component for the Auth service.
- Utilize Symfony's event system for decoupling and asynchronous processing, particularly in the Notifications service.

### Installation of Symfony:

To install the latest version of Symfony, you can use the Symfony CLI or Composer. For a microservices setup, you might install Symfony in each of your service directories within `packages`.

```bash
cd packages/Reservations
composer create-project symfony/skeleton .
```

Repeat this for each microservice, tailoring the installation to the needs of each service. Remember to maintain consistency in the version of Symfony and PHP across all services to avoid compatibility issues.

## ARCHITECTURE
>Setting up your microservices architecture with gRPC, RabbitMQ, and Kafka is a robust approach that leverages the strengths of each technology. Here's how you can implement each component:

### 1. gRPC for Controller Route Handlers:

gRPC is a high-performance RPC framework. It uses HTTP/2 for transport and Protocol Buffers as its interface description language.

- **Implement gRPC Services**: Define your service methods in Protocol Buffers (`.proto` files). Then, generate the server and client code using gRPC tools.
- **gRPC Server**: Each microservice will have a gRPC server that implements the defined service methods.
- **gRPC Client**: Services will use gRPC clients to call methods on other services.
- **Advantages**: Efficient binary serialization, low latency, supports streaming, language-agnostic.

### 2. RabbitMQ for Inter-Service Communication:

RabbitMQ can be used for asynchronous communication between services.

- **Setup RabbitMQ**: Install and configure RabbitMQ server.
- **Define Queues and Exchanges**: Services will publish messages to exchanges, and messages will be routed to queues to which other services are subscribed.
- **Message Producers and Consumers**: Services will act as producers and/or consumers of messages.
- **Asynchronous Processing**: This setup is ideal for operations that don't require immediate response and can be processed asynchronously.
- **Reliability**: RabbitMQ ensures that messages are not lost, even if a consumer is temporarily unavailable.

### 3. Kafka for Event-Driven Architecture:

Apache Kafka serves as the backbone for an event-driven architecture.

- **Setup Kafka**: Deploy a Kafka cluster.
- **Produce and Consume Events**: Services will produce events to Kafka topics and consume events from them.
- **Event Listeners**: Implement event listeners in services that react to specific events.
- **Scalability and Real-Time Processing**: Kafka is highly scalable and supports real-time event processing.
- **Decoupling**: Services are decoupled, as they only interact through events.

### Implementation Considerations:

- **Security**: Secure all communication channels. For gRPC, use SSL/TLS. For RabbitMQ and Kafka, use SASL/SSL for authentication and encryption.
- **Service Discovery**: Implement a service discovery mechanism to help services locate each other in the network.
- **Monitoring and Logging**: Implement comprehensive monitoring and logging to track the health and performance of your services and the communication between them.
- **Error Handling**: Design robust error handling and retry mechanisms, especially for message queueing and event-driven communication.
- **Documentation**: Maintain clear documentation for service APIs, message formats, and event types.

### Development and Testing:

- **Local Development**: For development purposes, you can run RabbitMQ, Kafka, and the gRPC environment using Docker containers.
- **Testing**: Test inter-service communication thoroughly, including testing the behavior under failure conditions.

By combining gRPC for direct service-to-service calls, RabbitMQ for asynchronous tasks, and Kafka for event-driven communication, we are setting up a powerful, scalable, and flexible microservices architecture. This approach allows us to leverage the strengths of each technology and create a system that can handle a wide range of communication patterns and use cases.

### Watching Containers for Changes

- **WatchTower**: Watchtower is an application that will monitor your running Docker containers and watch for changes to the images that those containers were originally started from. If watchtower detects that an image has changed, it will automatically restart the container using the new image.

### API Documentation
