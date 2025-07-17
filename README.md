# shiftcare-tech-exam

Given a JSON dataset with clients (attached), the application will need to offer two commands:

- Search through all clients and return those with names partially matching a given search query.
- Find out if there are any clients with the same email in the dataset, and show those duplicates if any are found.

## Table of contents

- [shiftcare-tech-exam](#shiftcare-tech-exam)
  - [Setup](#setup)
    - [With Dev Containers](#with-dev-containers)
    - [With Ruby only (latest version preferably)](#with-ruby-only-latest-version-preferably)
  - [Usage](#usage)
  - [Automated testing](#automated-testing)
  - [Assumptions and decisions](#assumptions-and-decisions)
    - [Assumptions](#assumptions)
    - [Decisions](#decisions)
  - [Known limitations and areas for future improvement](#known-limitations-and-areas-for-future-improvement)
    - [Limitations](#limitations)
    - [Areas for future improvement](#areas-for-future-improvement)

## Setup

### With Dev Containers

Run using Dev Containers would the following pre-requisites:

- vscode.
- Dev Containers extension on vscode.
- Docker or Docker Desktop(depends on your system).
- For a first time build open the repo with vscode then run the vscode's command palette and run `Dev Containers: Rebuild and Reopen Container.
- Then it's ready for [use](#Usage). The advantage of using this setup would be the absence of installing ruby versions.

### With Ruby only (latest version preferably)

Run using the installed ruby on system with the following pre-requisites

- Ruby version manager.
- Ruby version 3+ but 3.4.4 is preferred.
- Install the gems from the Gemfile.
- Then it's ready for [use](#Usage). The advantage of using this setup is the absence of setting up Docker, and vscode.

## Usage

Using the command below we can use the command-line application.

```bash
ruby bin/app.rb <input-file> <options>
```

- `input-file` - File to be accepted by the app for parsing and searching.
- `options` - Parameters to be used for commands like `--search 'id=3'` or `--findSimilarEmails`.

## Automated testing

## Assumptions and decisions

### Assumptions

- Base on the first command requirement I assumed the search query encompasses all fields or attributes from the input data.
- For the cli runner I assumed it only returns logs.

### Decisions

- I decided to separate the cli runner in preparation for REST API routes via sinatra preferably since this is not made via rails.
- I made the cli options or params easily pluggable so I can just add new options in the future. Each option handles its own logic and can be tested independently.
- I made the validations not separated as time is short.

## Known limitations and areas for future improvement

### Limitations

- No validation for invalid fields, like when search for field that does not exists in the input dataset

### Areas for future improvement
