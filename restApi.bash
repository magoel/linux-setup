##!/bin/bash 

#fetch access-token from az-cli
token=$(az account get-access-token | jq .accessToken | tr '"' ' ')
# make ado api for code-search
curl -X POST \
     -H 'Content-Type: application/json'   \
     -H 'User-Agent: Microsoft ReSearch'   \
     -H "Authorization: Bearer ${token}"   \
     -H 'X-TFS-FedAuthRedirect : Suppress' \
	 https://office.almsearch.visualstudio.com/_apis/search/advancedCodeSearchResults?api-version=6.0-preview.1 \
	--data '
{
  "searchText": "EidSaveFile",
  "$skip": 0,
  "$top": 10,
  "filters": {
    "Project": [
      "office"
    ],
    "Repository": [
      "office"
    ],
    "Path": [
      "/word"
    ],
    "Branch": [
      "main"
    ],
    "CodeElement": [
    ]
  },
  "$orderBy": [
    
  ],
  "includeFacets": false
}
'
# download dlgsave.cpp file
curl --verbose -X GET \
     -H 'User-Agent: Microsoft ReSearch'   \
     -H 'X-TFS-FedAuthRedirect : Suppress' \
     -H "Authorization: Bearer ${token}"   \
	 https://office.visualstudio.com/office/_apis/git/repositories/office/items \
	 --get \
	 --data-urlencode "scopePath=/word/client/desktop/dlgsave.cpp" \
	 --data-urlencode "versionType=commit" \
	 --data-urlencode "version=3029d15cf58b5ac079aa2bd06721b13621bd1a7a" \
	 --data-urlencode "api-version=6.1-preview.1"
