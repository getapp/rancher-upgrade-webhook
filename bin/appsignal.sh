#!/bin/sh

# Usage: appsignal "<api_key>" "<name>" "<environment>" "<revision>" "<repository>" "<user>"

# ------------
api_key=$1
if [[ $api_key == "" ]]
then
        echo "No api_key specified"
        exit 1
fi

# ------------
shift
name=$1
if [[ $name == "" ]]
then
        echo "No name specified"
        exit 1
fi

# ------------
shift
environment=$1
if [[ $environment == "" ]]
then
        echo "No environment specified"
        exit 1
fi

# ------------
shift
revision=$1
if [[ $revision == "" ]]
then
        echo "No revision specified"
        exit 1
fi

# ------------
shift
repository=$1
if [[ $repository == "" ]]
then
        echo "No repository specified"
        exit 1
fi

# ------------
shift
user=$*
if [[ $user == "" ]]
then
        echo "No user specified"
        exit 1
fi

json="{ \"revision\":\"$revision\", \"repository\":\"$repository\", \"user\":\"$user\" }"
url="https://push.appsignal.com/1/markers?api_key=$api_key&name=$name&environment=$environment"

curl -s -d "$json" "$url"
