---
layout: post
title: "Unlocking the Power of Time Series Databases"
date: 2023-08-07T09:03:20-08:00
description: A simple overview on how time series technologies work and how they can improve the performance and scalability of your apis, as well as your
tags: databases
categories: technical
---

# Why and when to use Time Series Databases

![enter image description here](https://www.imsl.com/sites/default/files/image/2020-07/image-blog-time-series-analysis.jpg)

## A common scenario

Imagine that you're building a trading platform. Your software processes millions of orders a day. One key feature you need to build is an api to access the prices of these trades. You need to be able to return the prices for a given stock, over a particular time frame.
Additionally you might need to return an aggregate of the results, such as the weekly price for a given stock over a period of 12 months. Or potentially a more complex use case, such as "the highest price of each day over a period of 6 months".
When you think about the fact that this api will be used in several UIs to build very complex graphs you can easily see how storing these data in the right format is key to the success of this feature. And we just mentioned what the api needs to returns, but of course we need to think about scalability, performance and cost. What I gave you is a simple example, but it can translate into several use cases. From data acquired through sensors that need to be visualized through dashboards and graphs, all the way to scientific use cases that need to deal with million of data points that describe events over time (think of number of covid cases in each city in a given country)
Well, all of these, are perfect use case for time series databases

## First things first: What's a time series?

![enter image description here](https://lh4.googleusercontent.com/OVnEMWIFN_bwoyiEGYu2xsFdTuG9pF4sR4k4-CTx9EN7zZ5Ee47dSWjaWwg4gLqchJoB7no18KEpxVXcaAAKvrVpuq_82lEoMj6D0Dg7gIxXNoiZ7kbEgMN81OA8ySNJArYGirhqYCTB1M9B_vC-jKvaNDCOZqEnNBq-j9OkZDCWRQhqMBZfSdr8vg)

Think of time series as data that exists exclusively in relation to time. For instance, a trade price only holds meaning when accompanied by a specific point in time. If I told you, this Google stock is worth $100, you might assume, this is the _latest_ price, or maybe the _average_ price of this week. But without giving the time relation, this data point doesn't hold any meaning.
This is different if we compare this case to, for example, data about the account of a user. The name, email, address of a user have their own meaning, even without the concept of time.
Another crucial attribute of time series data is its immutability; once recorded, it typically remains unaltered. The price of a google stock a week ago, will always be the same. Same thing for the number of covid cases in NYC January 1st 2021.

Now, if you think about this, we're already describing a dataset that holds some unique properties:

- Data immutability over time
- Each point exists in relation with a timestamp

These are exactly the two properties that time series technology use to build an ad hoc solution that allows the storing and retrieval of this data in a much more optimized way compared to traditional SQL databases.

## How do Time Series Databases Work?

As we mentioned, time series databases are engines optimized to store, manage, and query time series data. These technologies offer several advantages over a traditional SQL database:

- **Time series databases are easier to scale.** With time series databases we get partitioning out of the box. Forget about sharding, or similar techniques, thanks to the fact that each record is associated with a specific time stamp, it's much easier for the database to manage the partitions for us. If you're unfamiliar with partitions, think of a partitioned database as a very well organized set of files. The more the database grows, the more file it needs to hold all the records. The hard thing about this process is, how do you divide records across these files? You might need a key, or an id, to group them, so that records with the same key, can be found in the same file. The great thing about time series, is that they do not need this key, because they all have a timestamp. So you can imagine each of these files as a group of dates (such as all the records of a given month, day or week)

- **Time series databases can have different storage layers based on the timestamp.** Newer records may be cached in memory, older records can be stored on disks, and the oldest records can be saved directly on a file. Several time series technology offer these type of configurations, and they end up in better performance and reduced cost.

- **They facilitate support for rollups.**
  Explaining rollups in depth in this article would be out of scope. But think of them as a way of aggregating data into smaller samples. For example, thinking about our trade prices: we might store thousands of trades a day. But we need to have an api that returns just the average price for each day. Instead of calculating the average price at query time, a better approach would be to pre-aggregate those averages in a different table. This pre-aggregation process is not always trivial, but most timeseries technologies have great features to support that, such as [Timestream Scheduled Queries](https://docs.aws.amazon.com/timestream/latest/developerguide/scheduledqueries.html) or [Timescales continuous aggregates](https://docs.timescale.com/use-timescale/latest/continuous-aggregates/hierarchical-continuous-aggregates/)

- **Data Compression**
  Similar to sound compression algorithms, time series databases can store the difference between consecutive data points rather than the actual values. Leveraging this intuition most time series technology use [state of the art compression algorithm](https://www.timescale.com/blog/time-series-compression-algorithms-explained/). To give you an idea, some timescale db customers claimed to have saved up [to 94% of](https://www.timescale.com/features/compression) storage thanks to compression. You can imagine, how this can have a huge impact on costs.

- **Ad Hoc Functions to Manipulate Time**
  Timeseries have a much better support to handle queries that deal with time, compared to traditional SQL databases. A non exhaustive list includes: interpolation, date extration, and support for several time formats. You can get an idea by taking a look at [Timestream's date/time functions](https://docs.aws.amazon.com/timestream/latest/developerguide/date-time-functions.html) [and InfluxDB time functions](https://docs.influxdata.com/influxdb/cloud-serverless/reference/sql/functions/time-and-date/)

## When Should You Use a Time Series Database

Now that we have explored how time series databases work and the problems they address, the question of when to use them becomes straightforward. Consider employing a time series database if you are dealing with time series data and anticipate one or more of the following use cases:

- Extracting data over specific periods of time
- Aggregating data into different time frames
- Needing scalability for handling large volumes of time series data
  In such scenarios, utilizing a time series database is highly recommended.

Here are some of the main time series database products available in the market today:

- **InfluxDB**: InfluxDB is a widely adopted open-source time series database known for its high performance and scalability. It offers a flexible data model, supports efficient data compression, and provides a query language (InfluxQL or Flux) tailored for time series analysis.
- **TimescaleDB**: Built on top of PostgreSQL, TimescaleDB combines the reliability and robustness of a traditional relational database with the scalability and performance required for time series workloads. It offers automatic partitioning, supports continuous aggregates, and provides an SQL interface.
- **Timestream**: Developed by Amazon Web Services (AWS), Timestream is a fully managed time series database designed for handling large-scale, high-resolution data. It integrates well with other AWS services, offers built-in time series functions, and provides easy data ingestion and querying capabilities.
  Timeseries
  Database
