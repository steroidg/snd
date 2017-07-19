# This is an example of how to document a defined type.
# @param filename Name of the file to search string
# @param search_str Search string
# @param notify_only Display notification only if found

define snd::search_and_destroy (
  String  $file_name = $name,
  String  $search_str,
  Boolean $display_only = true,
) {
  if $::snd::params::display_only == true {
    $snd_cmd = "echo ${filename}"
  } else {
    $snd_cmd = "rm ${file_name}"
  }

  # Remove file if duplicate found.
  exec {
    "snd ${filename}":
      command => $snd_cmd,
      path    => '/bin:/sbin:/usr/bin:/usr/sbin',
      onlyif  => "[ -s ${file_name} ] && sed s/\<*.duid\>//g ${file_name} | grep ${duid}",
  }

}
