#
# This is an example of how to document a defined type.
# @param search_str Search string
# @param notify_only Display notification only if found

define snd::search_and_destroy (
  String  $search_str,
  Boolean $display_only = true,
) {
  notify { "$name search_str = $search_str": }
  notify { "$name display_only = $display_only": }
}
