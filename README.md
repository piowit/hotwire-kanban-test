# README

A simple application to experiment with Turbo.

## Setup

This application uses:
- ruby 3.3.0
- sqlite 3

Have them installed, clone repo and run:

```
$ bundle
$ rails db:setup
$ bin/dev
```

## Testing

Run `$ rspec` for tests.
Run `$ rubocop` for linter check.

## Dependecies

### sortable js
1. yarn add @rails/request.js sortablejs
2.
```
./bin/importmap pin @rails/request.js
./bin/importmap pin sortablejs
```

3. add act_as_list gem https://github.com/brendon/acts_as_list
