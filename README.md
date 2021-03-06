# Dino LiveView Boilerplate

> An opinionated template to create phoenix apps, using live view and tailwind.

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

Install the gen_template_dino_live_view using the following command:

```
mix template.install hex gen_template_dino_live_view
```

## Usage

```
mix gen gen_template_dino_live_view project
```

Then go to into the `project` created and execute the following commands:

```bash
cd project
mix deps.get # get elixir dependencies
cd assets 
yarn # install assets if you prefer npm just run; npm install
cd - # go back to the project root directory
iex -S mix phx.server # start the server
```
![Alt Text](http://g.recordit.co/HPFhP5Kpoz.gif)

## Troubles during the bootstrap

see issue [#1](https://github.com/paridin/gen_template_dino_live_view/issues/1)


Please note you can easy remove the Example LiveView:

* lib/`project`_web/live/example.ex `remove this file`
* lib/`project`_web/templates/layout/app.html.eex `remove the line with the pattern <%= *Web.Live.Example %>`

Remember replace `project` with the name of your `project`.

If you want self-signed trusted certs (only-locally) use [mkcert](https://github.com/FiloSottile/mkcert)

----
* Created:  2019-09-22
