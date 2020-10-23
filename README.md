# Bookmark Manager

## Goals
- Create a Bookmark Manager program meeting the specification of each user story listed below.
- Become more familiar with using Ruby with Sinatra and Capybara to create a web app.
- Use databases to store data used within the program and become familiar with postgres, psql, the ruby gem, 'pg', and TablePlus.

## My Approach
- Use first user story to create a basic domain model.
- Test drive the web app, focusing on a cycle of feature tests, unit tests, refactor.

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

## Next Set Up Steps
- Repeat the below steps for both the test and development databases after connecting to the relevent dastabase.
1. Add a title column to each table using the query from file 02_add_title_to_bookmarks.sql:
```
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
```
2. Create a comments table using the query from file 03_create_comments_table.sql:
```
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));
```
3. Create a tags table using the query from file 04_create_tags_table.sql:
```
CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(40));
```
4. Create a bookmark_tags table using the query from file 05_create_bookmark_tags_table.sql:
```
CREATE TABLE bookmark_tags(id SERIAL PRIMARY KEY, tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));
```

## User Stories

```
As a user,
So I can visit my regular websites,
I would like to view a list of my bookmarks.
```
```
As a user,
So that I can save a website for later,
I would like to be able to save a new bookmark.
```
```
As a user,
So that I can remove bookmarks I no longer need,
I would like to delete a bookmark.
```
```
As a user,
So that I can edit my bookmarks,
I would like to update a bookmark.
```
```
As a user,
So that I can share my opinion,
I'd like to be able to comment on bookmarks.
```
```
As a user,
So that I can organise my bookmarks,
I'd like to be able to add a tag.
```

## Initial Domain Model

![Bookmark Model](https://i.imgur.com/B05akBC.png)
