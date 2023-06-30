---
layout: post
title: "Why and when to use Time Series Databases"
date: 2022-11-20T09:03:20-08:00
tags: aws
description: A quick intro to time series data and technologies
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
- (This is an extensive topic, so I'll just share a resource: **[https://www.sqlservertutorial.net/sql-server-basics/sql-server-rollup/**](https://www.sqlservertutorial.net/sql-server-basics/sql-server-rollup/**))

- **They support horizontal compression of data.** (Similar to sound compression algorithms, time series databases store the differences between consecutive data points rather than the actual values. This approach can save up to 90% of storage costs. More info: **[https://www.timescale.com/blog/time-series-compression-algorithms-explained/**](https://www.timescale.com/blog/time-series-compression-algorithms-explained/**))
