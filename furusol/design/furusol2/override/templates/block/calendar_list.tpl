{def $valid_nodes = $block.valid_nodes}

<div class="block-type-5items block-view-{$block.view}">
<!-- BLOCK CONTENT: START -->

{foreach $valid_nodes as $valid_node }

{* Event Calendar - Full Calendar view *}

{def

    $event_node    = $valid_node
    $event_node_id = $event_node.node_id

    $curr_ts = currentdate()
    $curr_today = $curr_ts|datetime( custom, '%j')
    $curr_year = $curr_ts|datetime( custom, '%Y')
    $curr_month = $curr_ts|datetime( custom, '%n')

    $temp_ts = cond( and(ne($view_parameters.month, ''), ne($view_parameters.year, '')), makedate($view_parameters.month, cond(ne($view_parameters.day, ''),$view_parameters.day, eq($curr_month, $view_parameters.month), $curr_today, 1 ), $view_parameters.year), currentdate() )

    $temp_month = $temp_ts|datetime( custom, '%n')
    $temp_year = $temp_ts|datetime( custom, '%Y')
    $temp_today = $temp_ts|datetime( custom, '%j')

    $days = $temp_ts|datetime( custom, '%t')

    $first_ts = makedate($temp_month, 1, $temp_year)
    $dayone = $first_ts|datetime( custom, '%w' )

    $last_ts = makedate($temp_month, $days, $temp_year)
    $daylast = $last_ts|datetime( custom, '%w' )

    $span1 = $dayone
    $span2 = sub( 7, $daylast )

    $dayofweek = 0

    $day_array = " "
    $loop_dayone = 1
    $loop_daylast = 1
    $day_events = array()
    $loop_count = 0

	$temp_oldest_event = ''
    $temp_newest_event = ''

    $temp_offset = cond( ne($view_parameters.offset, ''), $view_parameters.offset, 0)
    $daymode = false()
    $direction = ""
    $newer_event_count = fetch( 'content', 'list_count', hash(
            'parent_node_id', $event_node,
            'class_filter_type',  'include',
            'class_filter_array', array( 'event' ),
               'attribute_filter',    array( 'or',
                    array( 'event/from_time', '>=', $curr_ts  ),
                    array( 'event/to_time', '>=', $curr_ts  )
            )    ))
    }

{if ne($temp_month, 12)}
    {set $last_ts=makedate($temp_month|sum( 1 ), 1, $temp_year)}
{else}
    {set $last_ts=makedate(1, 1, $temp_year|sum(1))}
{/if}

{def    $events=fetch( 'content', 'list', hash(
            'parent_node_id', $event_node_id,
            'sort_by', array( 'attribute', true(), 'event/from_time'),
            'class_filter_type',  'include',
            'class_filter_array', array( 'event' ),
            'main_node_only', true(),
             'attribute_filter',
            array( 'or',
                    array( 'event/from_time', 'between', array( sum($first_ts,1), sub($last_ts,1)  )),
                    array( 'event/to_time', 'between', array( sum($first_ts,1), sub($last_ts,1) )) )
                ))

    $url_reload=concat( $event_node.url_alias, "/(day)/", $temp_today, "/(month)/", $temp_month, "/(year)/", $temp_year, "/offset/2")
    $url_back=concat( $event_node.url_alias,  "/(month)/", sub($temp_month, 1), "/(year)/", $temp_year)
    $url_forward=concat( $event_node.url_alias, "/(month)/", sum($temp_month, 1), "/(year)/", $temp_year)
}

{if eq($temp_month, 1)}
    {set $url_back=concat( $event_node.url_alias,"/(month)/", "12", "/(year)/", sub($temp_year, 1))}
{elseif eq($temp_month, 12)}
    {set $url_forward=concat( $event_node.url_alias,"/(month)/", "1", "/(year)/", sum($temp_year, 1))}
{/if}

{foreach $events as $event}
    {if eq($temp_month|int(), $event.data_map.from_time.content.month|int())}
        {set $loop_dayone = $event.data_map.from_time.content.day}
    {else}
        {set $loop_dayone = 1}
    {/if}
    {if $event.data_map.to_time.content.is_valid}
       {if eq($temp_month|int(), $event.data_map.to_time.content.month|int())}
            {set $loop_daylast = $event.data_map.to_time.content.day}
        {else}
            {set $loop_daylast = $days}
        {/if}
    {else}
         {set $loop_daylast = $loop_dayone}
    {/if}
    {for $loop_dayone|int() to $loop_daylast|int() as $counter}
        {set $day_array = concat($day_array, $counter, ', ')}
        {if eq($counter,$temp_today)}
            {set $day_events = $day_events|append($event)}
        {/if}
    {/for}
{/foreach}

{if $events|count|gt(0)}
<div class="block-header standard">
<h1><a href={$valid_node.url_alias|ezurl} title="{$valid_node.name|wash}">{$valid_node.name|wash()}</a></h1>
</div>


{if ge($temp_offset,0)}
{set $temp_offset = $temp_offset|abs}
{def $events_new = fetch( 'content', 'list', hash(
            'parent_node_id', $valid_node.node_id,
            'sort_by', array( 'attribute', true(), 'event/from_time' ),
            'class_filter_type',  'include',
            'class_filter_array', array( 'event' ),
            'limitation', 15,
            'offset', $temp_offset|mul(15),
            'attribute_filter', array( 'or',
                    array( 'event/from_time', '>=', $curr_ts  ),
                    array( 'event/to_time', '>=', $curr_ts  )
            )    ))
}
{set $newer_event_count = $newer_event_count|sub( 15|mul( $temp_offset|inc ) )}
{/if}

{foreach $events_new as $event}
{if or(eq($temp_newest_event,''),gt($event.object.data_map.from_time.content.timestamp, $temp_newest_event))}
    {set $temp_newest_event=$event.object.data_map.from_time.content.timestamp}
{/if}
{/foreach}
{foreach $events_new as $event max 5}
    <a href={$event.url_alias|ezurl}>{$event.name|wash}</a>
   <div class="attribute-date">
    <strong>{$event.object.data_map.from_time.content.timestamp|datetime(custom,"%j. %F")}
    {if and($event.object.data_map.to_time.has_content,  ne( $event.object.data_map.to_time.content.timestamp|datetime(custom,"%j. %F"), $event.object.data_map.from_time.content.timestamp|datetime(custom,"%j. %F") ))}
        - {$event.object.data_map.to_time.content.timestamp|datetime(custom,"%j. %F")}
    {/if}</strong>
	</div>

    {if $event.object.data_map.category.has_content}
    <span class="ezagenda_keyword">
    	{attribute_view_gui attribute=$event.object.data_map.category}
    </span>
    {/if}
    {if $event.object.data_map.text.has_content}
       {$event.object.data_map.text.data_text}
    {undef}
    {/if}
    {set $loop_count = inc($loop_count)}
{/foreach}

{/if}

{undef}

{/foreach}
<!-- BLOCK CONTENT: END -->

</div>

{undef $valid_nodes}