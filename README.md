# Bookmark Manager

## Goals
- Create a Bookmark Manager program meeting the specification of each user story listed below.
- Become more familiar with using SQL, Ruby with Sinatra and Capybara to create a web app.
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
4. Run the query we have saved in the file 01_create_bookmarks_table.sql:
```
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, url VARCHAR(60))
```
5. Add a title column to each table using the query from file 02_add_title_to_bookmarks.sql:
```
ALTER TABLE bookmarks ADD COLUMN title VARCHAR(60);
```
6. Create a comments table using the query from file 03_create_comments_table.sql:
```
CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks (id));
```
7. Create a tags table using the query from file 04_create_tags_table.sql:
```
CREATE TABLE tags(id SERIAL PRIMARY KEY, content VARCHAR(40));
```
8. Create a bookmark_tags table using the query from file 05_create_bookmark_tags_table.sql:
```
CREATE TABLE bookmark_tags(id SERIAL PRIMARY KEY, tag_id INTEGER REFERENCES tags (id), bookmark_id INTEGER REFERENCES bookmarks (id));
```
9. Repeat these steps for a new database 'bookmark_manager_test'.

## How to use
1. Clone this repository:
```
git clone
```
2. Run bundle install:
```
bundle install
```
3. Run configuration file:
```
rackup config.ru
```
4. Visit localhost in browser:
```
http://localhost:9292/bookmarks
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
