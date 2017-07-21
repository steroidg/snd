# @param filename Name of the file to search string
# @param search_str Search string
# @param notify_only Display notification only if found

define snd::search_and_destroy (
  String  $file_name = $name,
  String  $search_str,
  Boolean $display_only = true,
) {

  #  notify { "${name} ${search_str}": }
  #  notify { "${name} ${display_only}": }

  if $display_only == true {
    $snd_cmd = "echo ${file_name}"
  } else {
    $snd_cmd = "rm ${file_name}"
  }

  # Remove file if duplicate found.
  exec {
    "snd ${file_name}":
      command => $snd_cmd,
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      onlyif  => "[ -s ${file_name} ] && grep \"${search_str}\$\" ${file_name}",
  }

}
