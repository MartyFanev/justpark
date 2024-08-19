## Introduction

Hello, my name is Martin, and I've completed the exercise to what I believe is a good standard. I will walk you through each model and how it works. I will then provide the advantages and disadvantages of this approach and explain why I chose it. Later on, I will give you feedback on how I found this exercise, which may help you improve in the future.

## The Models

### Base

The DBT project is split into four parts. The base part is the initial ingestion stage; it simply ingests the raw data as it is. We have two models that correspond to the prices and the rules.

### Intermediate

The intermediate models apply preparatory data transformations to the base models. The only transformation done here is a JSON flattening of the tariff data.

### Kimball Schema

The Kimball schema is where we have our models. This schema employs the use of two FACT tables: one for the pricing and one for the rules. It also uses one DIM table to store the days that a rule is active. This approach makes querying by active days easier.

You will notice that there isn't another DIM table apart from this. The reason for this is that I aimed to keep the coding as impactful as possible. Redundant information that was not necessary for the final product was excluded from the model. Additionally, there isn't any further nested information for attributes of the price and rule tables, with the exception of active days and applied-between dates.

The `DIM_AVAILABLE_DATES` table was created to simplify querying and to further normalize the model (at least to 1NF). This approach has the drawback of creating a large table, as each rule ID has certain dates on which it operates. This can be improved by understanding the business logic further (e.g., using weekends or weekdays as days instead of numbers) and possibly including days when a rule is NOT applied.

`FACT_PRICE` is the fact table for the price data. The most recent addition is a flag indicating whether a `price_id` is the currently used one. This allows for tracking both historical and current records with a simple CASE statement.

`FACT_PRICING_RULE` is essentially a copy of the intermediate table for the tariff data but includes only the essential information.

## Products

In this section, I show how you can use the model.

The current pricing information is obtained through two inner joins: from `FACT_PRICE` to `FACT_PRICING_RULE` and then to `DIM_AVAILABLE_DATES` to get the necessary information. You can filter by location ID and active days of the rule, and the currently used pricing can be identified by setting the `CURRENT_FLAG` to 'Y'.

The time series price query involves filtering the `FACT_PRICE` table so that the duration of the stay is 1 hour. This simple query allows us to analyze the entire history, order by the `created_at` date, and perform some interesting time series analysis.

## Feedback

In the README, there was an example of how to read data in DuckDB. However, that method requires `pandas` and `numpy`, which were not included in the lock file.

Overall, it was a very nice and enjoyable exercise. Some data did not make much sense (e.g., a duration of 60 hours, or 164 hours for only 30 bucks, is criminal) but it was funny to see.

This took about 1 hour. Most of the time was spent understanding the data and writing the documentation.

I also wanted to express my personal thanks and apologies for the delay and the extension of the deadline.

