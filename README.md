# Jimsegalcom

Portfolio / Playground for Jim Segal.

## Setup

### Language versions

This project uses [asdf](https://asdf-vm.com/) to manage the Elixir and Erlang versions of the project.

Follow the instructions on [asdf#getting-started](https://asdf-vm.com/guide/getting-started.html) to install asdf.

Once complete, run the following command to install the correct versions Elixir and Erlang:

```sh
asdf install
```

### Local Environment Variables

This project uses .env file for local secrets and keys, please create a .env file and fill in the needed keys for the application to work properly

```sh
cp .env_example .env
```

### Application Dependencies

Install needed serverside and clientside dependencies as well as setting up the database.

```sh
mix setup
```

## Run Locally

```sh
mix phx.server
```

or with interactive shell

```sh
iex -S mix phx.server
```

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.
