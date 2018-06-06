# Heroku Buildpack for Facebook Messenger Bots

> Creates a Facebook test user and test page for a messenger chatbot

The `app.json` file serves as a manifest for describing applications deployed to Heroku. Within the `app.json` file is an optional key-value pair called [`scripts`](https://devcenter.heroku.com/articles/app-json-schema#scripts). Heroku supports both `postdeploy` and `pr-predestroy` scripts that execute at different stages of the build and release process. This buildpack adds custom `postdeploy` and `pr-predestroy` scripts to any Heroku application for creating and destroying Facebook test user accounts for testing purposes. Read more on the motivation [here](https://github.com/hey-mako/ansible-role-facebook-messenger#motivation).

## Usage

1. Update your `app.json` to include the following buildpacks `heroku/python` and `heroku-buildpack-messenger-bot`:

```json
    {
        ...
        "buildpacks": [
            {
                "url": "heroku/python"
            },
            {
                "url": "https://github.com/hey-mako/heroku-buildpack-messenger-bot"
            }
        ]
        ...
    }
```

2. Update your `app.json` to include the following scripts:

```json
    {
        ...
        "scripts": {
            "postdeploy": "bin/postdeploy.sh",
            "pr-predestroy": "bin/pr-predestroy.sh"
        }
        ...
    }
```

Note that `postdeploy` is only run once after the app is created and deployed for the first time. Any subsequent deployments do not invoke the `postdeploy` script; for example, when a pull request branch is updated.

The `pr-predestroy` script applies only to Heroku [Review Apps](https://devcenter.heroku.com/articles/github-integration-review-apps) and is invoked only after closing or merging the associated pull request.

3. Create a `messenger.json` file in the root directory of the application with the following settings:

```js
{
    "graph_page_about": "This page is a test page for testing a chatbot", // The description of the test page
    "graph_page_name": "Test Page For Heroku", // The name of the test page, it is best to avoid symbols
    "graph_subscription_callback_url": "https://${HEROKU_APP_NAME}.herokuapp.com/callback" // Callback URL to configure the bot webhook
}
```

**Note:** The `messenger.json` file supports environment variable expansion. Additional variables for `messenger.json` exist [here](https://github.com/hey-mako/ansible-role-facebook-messenger#variables).

Refer to our [Messenger Bot Demo](https://github.com/mako-ai/heroku-messenger-bot-demo) repository for additional information or to see it in action.

## Feedback

- Submit a [GitHub Issue](https://github.com/hey-mako/heroku-buildpack-messenger-bot/issues)
