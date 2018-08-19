#!/bin/sh

# run this script after fetching news to update unread news count

newsboat -x print-unread | sed 's/[^0-9]//g' > .newscount
