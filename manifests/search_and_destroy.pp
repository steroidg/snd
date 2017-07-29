# @param filename Name of the file to search string
# @param search_str Search string
# @param notify_only Display notification only if found

define snd::search_and_destroy (
  String  $search_str,
  String  $file_name = $name,
  Boolean $display_only = true,
) {

  if $display_only == true {
    $snd_cmd = "echo ${file_name}"
  } else {
    $snd_cmd = "rm ${file_name}"
  }

  # Remove file if string found.
  exec {
    "snd ${file_name}":
      command => $snd_cmd,
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      onlyif  => "[ -s ${file_name} ] && grep \"${search_str}\" ${file_name}",
  }

}
