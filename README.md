# Bookmark Manager

## User Stories

```
As a user,
So I can visit my regular websites,
I would like to view a list of my bookmarks.
```
``
As a user,
So that I can save a website for later,
I would like to be able to save a new bookmark.
```
```
As a user,
So that I can remove bookmarks I no longer need,
I would like to delete a bookmark.
```

## Domain Model

![Bookmark Model](https://i.imgur.com/B05akBC.png)

## Set Up

1. Connect to psql:
```
psql
```
2. Create a database:
```
CREATE DATABASE bookmark_manager;
```
3. Connect to the database:
```
\c bookmark_manager;
```
4. Run the query saved in file 01_create_bookmarks_table.sql:
```
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60))
```

## Test Set Up

1. Connect to psql:
```
psql
```
2. Create the test database:
```
CREATE DATABASE bookmark_manager_test;
```
3. Connect to the database:
```
\c bookmark_manager_test;
```
4. Run the query we have saved in the file 01_create_bookmarks_table.sql:
```
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60))
```