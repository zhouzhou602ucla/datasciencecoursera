## Read from API
library(httr)
library(httpuv)
library(jsonlite)
# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

#2. To make your own application, register at
#    https://github.com/settings/developers. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
myapp <- oauth_app("github",
                   key = "1e51771b25022d58dbb6",
                   secret = "392001d16a8be64e5ae3a523e8cb1266b6255388"
)


# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)

## Extract content from a request
json1 = content(req)


## Convert to a data.frame
gitDF = jsonlite::fromJSON(jsonlite::toJSON(json1))

## subset data.frame
gitDF[gitDF$full_name == "jtleek/datasharing", "created_at"]