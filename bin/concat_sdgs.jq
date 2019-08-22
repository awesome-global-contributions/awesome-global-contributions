# https://stackoverflow.com/a/57587384/885053

def group_by_keys:
  reduce .[] as $o ({};
  reduce ($o | to_entries[]) as $kv (.; .[$kv.key] += [$kv.value]));

def sort_by_keys:
  to_entries
  | sort_by(.key|tonumber)
  | from_entries;


[inputs | {(.sdgs[]|tostring): del(.sdgs) }]
  | group_by_keys
  | sort_by_keys
