# Cartoon Creator

To be able to create cartoons via a form?
List out cartoons to be able to view other user's cartoons
Edit and delete your own cartoon

## User

username
first_name
last_name
password_digest

has many cartoons

## Cartoon

has many characters
has many episodes

belongs to a user

## Episodes

has many scenes
belongs to a cartoon

## Scenes

dialog

has many characters
belongs_to episodes

## character_scenes

belong to character
belong to scene

## Characters

name
description
belongs_to cartoon
has many scenes

# Features

- user authentication (first)
- cartoon creation (very basic)
- character creation
- Episode creation for cartoon
- Scene creation for episode
