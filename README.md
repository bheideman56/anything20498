# Heroku Buildpack for Facebook Messenger Bots
> Creates an associated test user with a test page for the Facebook messenger chatbot

## How to Use
1. Update your `app.json` to include the following buildpacks (`heroku/python`) & (`heroku-buildpack-messenger-bot`)
```json
  "buildpacks": [
    {
      "url": "heroku/python"
    },
    {
      "url": "https://github.com/hey-mako/heroku-buildpack-messenger-bot"
    }
  ]
```
2. Create a `messenger.json` file within the app root updating the following settings
```json
{
  "graph_page_about": "This page is a test page for testing a chatbot", // The description of the test page
  "graph_page_name": "Test Page For Heroku", // The name of the test page, it's best to avoid symbols
  "graph_subscription_callback_url": "https://${HEROKU_APP_NAME}.herokuapp.com/callback" // Callback URL to configure the bot webhook
}
```

Refer to our [Messenger Bot Demo](https://github.com/mako-ai/heroku-messenger-bot-demo) for additional information or to see it in action.

## Feedback
- Submit a [GitHub Issue](https://github.com/hey-mako/heroku-buildpack-messenger-bot)
