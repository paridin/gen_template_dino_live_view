## 0.2.20
- Minor changes
## 0.2.19
- Minor changes
## 0.2.18

- Upgrade to latest JS libraries, Tailwind 2.0
- update dependencies
- fix issues during testing.

## 0.2.17

### Enhancements

- Support build with to identify which version the project is using and discover missing patches.
- Github actions support for testing
- Creation directory use bash instead of sh, since we can reproduce the issue I hope this solve the creation of directories on ubuntu.
- Add `wallaby` testing, dependencies (full support on dino template) or add manually ecto and check for wallaby on source code to check the tips.

## 0.2.16

### Bug Fixes

- Missing files for PurgeCss
- improve docker image creation.
- improve config release to handle dynamic url.

### Enhancements

- allow to close non liveview messages via alpinejs

## 0.2.15

### Bug Fixes

- render header correctly.

## 0.2.14

### Enhancements

- Update JS dependencies (tailwind, babel)

## 0.2.13

### Enhancements

- Handle environment variables (HTTPS) during dev, utils if you customize your router `port forwarding` and get a valid certs. `letsencrypt` with your domain.


## 0.2.12

### Enhancements

- Add support for `Alpine.js`.
- Apply pattern to write `liveview Hooks`.
- Update JS deps.
- Update Elixir deps.
- Add support for `Makefile`
- Improve docker image size, use alpine standard image, add curl support for health check.
- Improve Layout because in practice not everything is a liveview.
- Extracted flash messages to their own files also add a tester in our `weather_example.ex`
- Default tailwindui
