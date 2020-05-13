# Dino Boilerplate

> An opinionated template to create phoenix apps, using ecto and live view with tailwind.

## Prerequisites

You'll need to install the `mix_templates` and `mix_generator` packages by Dave Thomas
* [mix_templates](https://github.com/pragdave/mix_templates)
* [mix_generator](https://github.com/pragdave/mix_generator)
* [screencast](https://pragdave.me/blog/2017/04/18/elixir-project-generator.html)

```
mix archive.install hex mix_templates
mix archive.install hex mix_generator
```

## Install

Install the gen_template_dino using the following command:

```
mix template.install hex gen_template_dino
```

## Usage

Note: Since it depends on `gen_template_dino`, be sure override all files when the installer asks you. Otherwise, you need to add this configuration manually.

```
mix gen gen_template_dino project
```

Then go to into the `project` created and execute the following commands:

```bash
cd project && mix deps.get && npm i --prefix assets && mix phx.gen.cert -o priv/ssl/project
```
full instruccion inside on the project readme.


Please note you can easy remove the Example LiveView:

* lib/`project`_web/live/example.ex `remove this file`
* lib/`project`_web/templates/layout/app.html.eex `remove the line with the pattern <%= *Web.Live.Example %>`

Remember replace `project` with the name of your `project`.

If you want self-signed trusted certs (only-locally) use [mkcert](https://github.com/FiloSottile/mkcert)

----
Created:  2020-05-09Z
