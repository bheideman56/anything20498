# Heroku Buildpack for Facebook Messenger Bots

> Creates a Facebook test user and test page for a messenger chatbot

## How to Use

1. Update your `app.json` to include the following buildpacks (`heroku/python`) & (`heroku-buildpack-messenger-bot`) and scripts:

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
        "scripts": {
            "postdeploy": "bin/postdeploy.sh",
            "pr-predestroy": "bin/pr-predestroy.sh"
        }
    }
```

2. Create a `messenger.json` file in the root directory of the application with the following settings:

```json
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
