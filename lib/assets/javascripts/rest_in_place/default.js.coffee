$ = jQuery

$.on('rest_in_place:update', (target, xhr, settings) -> 
  target.html('saving...')
)
