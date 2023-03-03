token=$(az account get-access-token | jq .accessToken | tr '"' ' ')
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
