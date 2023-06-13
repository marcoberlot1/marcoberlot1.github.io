---
layout: post
title: "What Are Database Migrations and Why You Should Use Them"
date: 2022-09-20T09:03:20-08:00
description: The Critical Role of Database Migrations in Software Development
tags: databases
categories: technical
---

## The Critical Role of Database Migrations in Software Development

As the complexity of software systems has increased over time, so too has the intricacy of managing the foundational component of these systems. Databases are one of the most integral part of these systems. In this post, we'll delve into the importance of using database migrations to track and control changes in your database schema, and why they serve as a vital tool in your software development lifecycle.

## The Issue in Not Tracking the Database Schema

The state of your database is critical to the operation of your software. Imagine a database as a warehouse where your application stores and retrieves its data. The warehouse needs to be organized in a certain way for the application to work properly. This organization, in terms of a database, is the schema.

If you aren't properly tracking changes to this schema, you can end up with a myriad of issues. For instance, a new feature might require a change in the database schema, which, if not managed properly, could cause inconsistencies between environments. An example of such inconsistency would be a feature working perfectly fine in the development environment, but failing in the production environment due to a schema discrepancy.

This lack of control and visibility can lead to bugs, system downtime, data loss, and significant issues during scaling, not to mention the time and resources spent on troubleshooting and resolving these issues.

I've seen several companies running databases in production, without a schema versioning system, for which, no one really knew what was the latest status of the database. The only way for you to know was to go and actually check the schemas of the tables in production.

## Migrations: A Functional and Elegant Solution

Database migrations provide a functional and elegant solution to these challenges. A database migration is essentially a set of instructions that makes changes to the database schema, such as creating a table, adding a column, or updating data within the table.

Database migrations are version-controlled, which means that they not only track the changes but also the sequence in which they were made. This enables you to replicate your database schema in a new environment reliably and accurately, or roll back changes if something goes wrong.

In essence, database migrations bring predictability, visibility, and control to your database management, while facilitating collaboration between team members.

## A Practical Example

To illustrate the concept, consider a scenario where we are developing a blog platform. Initially, we create a Posts table with columns title and body. After some time, we decide to add a feature to like a post. For this, we need a new column likes in the Posts table.

Instead of manually adding this column in every environment, we write a migration. This migration contains instructions to alter the Posts table and add the likes column.

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/migration-1.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    A simple, elegant caption looks good between image rows, after each row, or doesn't have to be there at all.
</div>

We then run this migration in each environment (development, testing, production), ensuring the database schema is consistent across all of them.

Now, our database schema is built based off the two migrations you can see below. This means that simply from the code we can know what the schema looks like for each version, without the need to go and check our database

<div class="row mt-3">
    <div class="col-sm mt-3 mt-md-0">
        {% include figure.html path="assets/img/migration-2.png" class="img-fluid rounded z-depth-1" %}
    </div>
</div>
<div class="caption">
    A simple, elegant caption looks good between image rows, after each row, or doesn't have to be there at all.
</div>

If, in the future, we decide to remove this feature, we can simply write another migration to remove the likes column.

## Integration Tests: An Additional Benefit

Suppose we need to conduct a minor integration test involving a method that interacts with our database. Leveraging migrations simplifies this process immensely. We can effortlessly spin up a local database container and construct its schema using these migrations. Consequently, the test will always incorporate the latest schema changes. If a new migration is introduced into the main branch, the test will also incorporate that migration when spinning up the local container.

## Common Migration Frameworks

There are many robust migration frameworks available that support various languages and databases. Here are a few:

Flyway: This is a popular choice for Java-based applications, though it does offer command-line tools for non-Java applications. It's easy to set up and supports both SQL-based and Java-based migrations.

Liquibase: Another strong contender, particularly for complex database schemas. Liquibase supports XML, YAML, JSON, and SQL format migrations and offers robust rollbacks.

Django Migrations: If you're working with Django (a Python web framework), Django's migrations are baked right into the framework and are easy to work with.

Rails Active Record Migrations: Similarly, if you're working with Ruby on Rails, Active Record provides a powerful ORM tool, which includes migrations.

Knex.js: For JavaScript applications, Knex.js is a popular choice.
