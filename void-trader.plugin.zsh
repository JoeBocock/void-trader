
# DEPENDENCIES
if ! command -v jq >/dev/null 2>&1 ; then
    echo "Dependency Missing: jq. Please install jq to use the Void Trader plugin."
    exit 1
fi

if ! command -v curl >/dev/null 2>&1 ; then
    echo "Dependency Missing: curl. Please install curl to use the Void Trader plugin."
    exit 1
fi

# COMMONS
script_dir=${0:A:h}
cache_file="${script_dir}/.void-trader-cache.json"
current_date=`date +%s`

# FUNCTIONS
function rebuild_cache {
    curl -s 'http://content.warframe.com/dynamic/worldState.php' | jq '. | {NextVisitStart: .VoidTraders[0].Activation."$date"."$numberLong", NextVisitEnd: .VoidTraders[0].Expiry."$date"."$numberLong", Location: .VoidTraders[0].Node}' > "${cache_file}"
}

function outdated_check {
    end_date=`jq '.NextVisitEnd | tonumber' "$cache_file"`
    end_date=`expr $end_date / 1000`

    if [ "$current_date" -gt "$end_date" ] ;
        then
            rebuild_cache
    fi
}

function display_message {
    start_date=`jq '.NextVisitStart | tonumber' "$cache_file"`
    start_date=`expr $start_date / 1000`

    end_date=`jq '.NextVisitEnd | tonumber' "$cache_file"`
    end_date=`expr $end_date / 1000`

    location=`jq -r .Location "$cache_file"`

    if [ "$start_date" -gt "$current_date" ] ;
        then
            days_remaining=$[(start_date-current_date)/(24*60*60)]
            hours_remaining=$[(start_date-current_date)/(60*60)]
            hours_remaining=$[hours_remaining % 24]

            echo "The Void Trader arrives at" "$location" "in" "$days_remaining" "days and" "$hours_remaining" "hours.";

    elif [ "$end_date" -gt "$current_date" ]
        then
            echo "The Void Trader is currently active at at" "$location" "! 🙌"
    fi
}

if test ! -f "$cache_file"; then
    rebuild_cache
fi

if test ! -f "$cache_file"; then
    echo "Could not fetch Warframe data. API might be down or modified. Please wait for an update."
    exit 1
fi

outdated_check
display_message
