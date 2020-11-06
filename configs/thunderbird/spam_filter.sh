#!/usr/bin/env bash
#
# spam_filter.sh
# Copyright (C) 2020 Toran Sahu <toran.sahu@yahoo.com>
#
# Distributed under terms of the MIT license.
#


address=$(cat ./toran.sahu@yahoo.com.txt)

echo '{
  "accountName": "imap://toran.sahu%40yahoo.com@imap.mail.yahoo.com",
  "rootFolderURL": "imap://toran.sahu%40yahoo.com@imap.mail.yahoo.com",
  "date": "2019-02-06T06:23:49.331Z",
  "filters": [
    {
      "filterName": "toran.sahu@yahoo.com » Inbox",
      "filterDesc": "",
      "filterType": 17,
      "temporary": false,
      "actionCount": 1,
      "enabled": true,
      "actionList": [
        {
          "type": 1,
          "targetFolderUri": "imap://toran.sahu%40yahoo.com@imap.mail.yahoo.com/Farzi"
        }
      ],
      "searchTerms": ['
for add in $address; do
    echo '{
          "attrib": 1,
          "value": {
            "attrib": 1,
            "str": "'"$add"'"
          },
          "booleanAnd": false,
          "beginsGrouping": false,
          "endsGrouping": false
        },'
done
echo '      ]
    }
  ]
}
'
