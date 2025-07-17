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
- `options` - Parameters to be used for commands like `[--search 'key=value']` or `[--findSimilarEmails]`.

## Automated testing

Used Rake for running the automation testing.

List of tasks:

- `[all]`
- `[search_by_id]`
- `[search_by_name]`
- `[search_by_email]`
- `[invalid_search_key]`
- `[search_by_invalid_id]`
- `[search_by_non_existent_client_by_param]`
- `[search_by_invalid_email]`
- `[find_similar_emails]`
- `[skip_client_no_email]`
- `[found_no_similar_emails]`
- `[missing_query_error]`
- `[empty_input_data_error_search_query]`
- `[empty_input_data_error_find_similar_emails]`
- `[input_file_error]`

Using the command below we can run the testing.

```bash
rake run_cli_tasks:<task>
```

## Assumptions and decisions

### Assumptions

- Base on the first command requirement I assumed the search query encompasses all fields or attributes from the input data.
- For the cli runner I assumed it only returns logs.

### Decisions

- I decided to separate the cli runner in preparation for REST API routes via sinatra preferably since this is not made via rails.
- I made the cli options or params easily pluggable so I can just add new options in the future. Each option handles its own logic and can be tested independently.
- Separated some validations to different classes or modules.

## Known limitations and areas for future improvement

- Needs to add unit tests specially when the app is scaled to make sure nothing in the code is broken.
- Non-deep or non-critical validations are return early and in the service instead of the validators.
- Needs some code changes for database integration for when the app is scaled so we can optimize how we extract, load and transform the data.
