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

Enter expected values and run the following command:

```sh
source .env
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

## Building production image locally

This repo uses [Nixpacks](https://nixpacks.com/docs) as it is currently deployed to [railway.app](https://railway.app/).

There is a [nixpacks.toml](nixpacks.toml) to code how the production build is created. To test any changes made to this file, run the following command from the root of this project:

```sh
nixpacks build .
```

Prerequisites:

- [nixpacks](https://nixpacks.com/docs/install)
- [docker](https://docs.docker.com/engine/install/)

## Troubleshooting

### User logging in with correct credentials

If you want to log in with a user you will need to update the user's `is_active` property via a direct DB update. I did this to restrict users that are allowed to interact with the site.
