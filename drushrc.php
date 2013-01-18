<?php
/**
 * @file
 * Custom settings for Drush.
 */

// Load a drushrc.php file from the 'drush' folder at the root
// of the current git repository. Customize as desired.
// (Script by grayside; @see: http://grayside.org/node/93)
exec('git rev-parse --git-dir 2> /dev/null', $output);
if (!empty($output)) {
  $repo = $output[0];
  $options['config'] = $repo . '/../drush/drushrc.php';
  $options['include'] = $repo . '/../drush/commands';
  $options['alias-path'] = $repo . '/../drush/aliases';
}
