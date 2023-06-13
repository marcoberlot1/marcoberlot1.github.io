---
layout: post
title: "How to Leverage AWS Step Functions to Build an Event-Driven Architecture"
date: 2022-11-20T09:03:20-08:00
tags: aws
description: Introducing AWS Step Functions as an Orchestration Tool
categories: technical
---

## Introduction

Event-driven architectures have grown in popularity as they offer increased flexibility, scalability, and responsiveness to modern application demands. These architectures often involve numerous services and queues or message brokers, which can be challenging to manage. In this blog post, we'll explore how AWS Step Functions can be a powerful tool for building and managing event-driven architectures through orchestration.

## Section 1: Event-Driven Architectures - The Need for Coreography or Orchestration

In event-driven architectures, multiple services interact with each other through events. To manage the processes and ensure that they function smoothly, there are two primary approaches: coreography and orchestration.

1. **Coreography**: In this approach, each service is responsible for its own logic and decision-making. Services communicate with each other through events, and they make decisions based on the events they receive. This approach is more decentralized and requires less centralized management.

2. **Orchestration**: In orchestration, a central conductor or orchestrator manages the flow of events and the decision-making process. The orchestrator is responsible for coordinating the different services and ensuring that the right events are processed at the right time. This approach offers a more centralized control over the event flow.

## Section 2: Introducing AWS Step Functions as an Orchestration Tool

Now, there are both pros and cons for these approaches, but the point of this article is not to consider them, or evaluate how once can be better than the other given a certain context. We're going to focus on the Orchestration approach, and see how AWS Step Functions can be a great tool to build a serverless orchestrator.

AWS Step Functions is a serverless workflow service that enables you to create, coordinate, and manage complex processes across multiple services. It acts as an orchestrator, providing a way to coordinate and manage the flow of events in an event-driven architecture.
In addition to being an orchestrator, Step Functions also provides the following features:

- Visualize and define your workflows using a JSON-based language called the Amazon States Language.
- Automatically handle retries and error handling.
- Easily integrate with other AWS services such as AWS Lambda, Amazon SNS, and Amazon SQS.
- Monitor and track the execution of your workflows in real-time.

## Section 3: Example - Building an Event-Driven Architecture with AWS Step Functions

To better understand how AWS Step Functions can be employed in an event-driven architecture, let's walk through a simple example. Imagine you're building an online retail store and need to process client orders coming from the web application. To simplify, let's assume the following steps must occur:

1. Upon receiving an order, you need to process the payment.
2. After payment is processed, the system should place the item "on hold," ensuring that no one else can purchase it.
3. Finally, the system must initiate the shipping process for the item.

Now, let's envision that we have three separate services to handle these tasks: one for payments, one for updating the item's status, and one for managing the shipping process. Each service reads incoming events from a queue. What we can create is a Step Functions workflow that sends one message per step to the respective queue for each service. Refer to the example from the Step Functions workflow editor below:

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/stepfunction-1.png" class="img-fluid rounded z-depth-1" zoomable=true %}
    </div>
</div>

With this simple approach we got a lot out of the box:

- We guarantee that if one step fails, we're not going to proceed to the next step. For example, if we can't process the payment, we're not going to proceed and update the status of the item. (This only applies if the operation the service is performing is a synchronous operation)
- We can visualize all the workflows, and see when/how they fail
- Serverless and highly scalable

You can easily see how this can be extremely useful with more complex scenarios, that involve more services and longer workflows.

## Cons of using Step Functions

Now let's discuss some of the primary drawbacks of using Step Functions. In my opinion, there are two significant disadvantages:

Step Functions cannot scale indefinitely. There is a limit to the number of state transitions per second allowed on your AWS account. This number depends on the type of workflows you're employing, but it can be a constraint.
Cost. As with all cloud services, there is an associated expense, which can increase significantly at a higher scale.

## Conclusion

Leveraging AWS Step Functions to build event-driven architectures offers a powerful way to manage and coordinate complex processes across multiple services. By using Step Functions as an orchestration tool, you can create robust, scalable, and easy-to-maintain systems, ensuring that your applications are responsive to the dynamic demands of the modern world.
