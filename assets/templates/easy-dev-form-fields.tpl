<style>
.{$field_prefix}_url_display {
    width: 100%; 
    background-color: #FFFFFF; 
    padding: 3px; 
    border: #c6d9e9 1px solid; 
    font-size: 13px;
}
.{$field_prefix}_image_info
 {
	position: relative;
    margin-left: 220px;
 }
</style>
<div class="form-group {$field_prefix}_form_element" id="{$field.name}_container_div" style="">
	<label for="{$field.id}" class="col-sm-3 control-label">{$field.label}</label>
	<div class="col-sm-9">
	{if $field.type == 'INPUT'}
	   <input class="{$class} form-control" id="{$field.id}" name="{$field.name}" value="{$field.value}" />
	{elseif $field.type == 'TEXTAREA'}
	   <textarea class="{$class} form-control" id="{$field.id}" name="{$field.name}">{$field.value}</textarea>
	{elseif $field.type == 'CHECKBOX'}
		{foreach $field.options as $okey => $ovalue}
            {if $okey > 0}
                <label for="{$field.id}">&nbsp;</label>
            {/if}
	   		<input type="checkbox" class="level-0 form-control" id="{$field.id}[]" name="{$field.name}[]" value="{$ovalue}" {if $field.value|is_array && $ovalue|in_array:$field.value}checked{/if}>{$ovalue}<br/>
		{/foreach}
	{elseif $field.type == 'SELECT'}
	   <select class="{$class} form-control" id="{$field.id}" name="{$field.name}" >
	   		{foreach $field.options as $okey => $ovalue}
	   			<option class="level-0" value="{$ovalue}" {if $field.value == $ovalue}selected='selected'{/if}>{$okey}</option>
	   		{/foreach}
	   </select>
	{elseif $field.type == 'SELECT_PAGES'}
	   <div id="{$field.name}-box">
	   <select class="{$class} form-control" id="{$field.id}" name="{$field.name}{if $field.multiple}[]{/if}" {if $field.size}size="{$field.size}"{/if} {if $field.multiple}multiple{/if} {if $field.other}{$field.other}{/if}>
	   		{foreach $field.options as $okey => $ovalue}
			    {if $field.multiple && $field.value|is_array}
	   			<option class="level-0" value="{$okey}" {if $okey|in_array:$field.value}selected='selected'{/if}>{$ovalue}</option>
				{else}
	   			<option class="level-0" value="{$okey}" {if $field.value == {$okey}}selected='selected'{/if}>{$ovalue}</option>
				{/if}
				
	   		{/foreach}
	   </select>
	   </div>
	{elseif $field.type == 'IMAGE'}
		<input type="hidden" id="{$field.id}" name="{$field.name}" value="{$field.value}" />
		<input type="hidden" id="{$field.id}_prefix" name="{$field.name}_prefix" value="{$field_prefix}_{$field.name}" />
    	
    	<div id="{$field_prefix}_{$field.name}_image_info" name="{$field_prefix}_{$field.name}_image_info" class="{$field_prefix}_image_info">
	    	<div id="{$field_prefix}_{$field.name}_selected_image" name="{$field_prefix}_{$field.name}_selected_image" class="{$field_prefix}_selected_image">
	      		{if $field.value != ''}<img src="{$field.value}" /><br/>{/if}
	    	</div>
	    	<div name="{$field_prefix}_{$field.name}_url_display" id="{$field_prefix}_{$field.name}_url_display" class="{$field_prefix}_url_display">
	      		{if $field.value != ''}{$field.value}{else}No image selected{/if}
	    	</div>
	    	
    		<div id="{$field_prefix}_{$field.name}_image_funcs" name="{$field_prefix}_{$field.name}_image_funcs" class="{$field_prefix}_image_funcs">
		        <img src="images/media-button-image.gif" alt="Add photos from your media" /> 
				
				<a href="#" onclick="tspedev_show_media_window()" class="thickbox" title="Add an Image"> <strong>Click here to add/change your image</strong></a><br />
				<small>Note: To choose image click the "insert into post" button in the media uploader</small><br />
				
				<img src="images/media-button-image.gif" alt="Remove existing image" /> 
				<a href="#" onclick="tspedev_remove_image_url('{$field.id}', 'No image selected')"><strong>Click here to remove the existing image</strong></a><br />
    		</div>
    	</div>
    	
   		<script>
			{literal}
			jQuery(document).ready(function() {
			 
				window.send_to_editor = function(html) {
				  
					imgurl = jQuery('img',html).attr('src');
			{/literal}
					field_id = "{$field.id}";
			{literal}
					tspedev_save_image_url(imgurl, field_id);
					tb_remove();
				}
			 
			})
			{/literal}
		</script>
	{/if}
	</div>
	<div class="clear"></div>
	<div id="error-message-name"></div>
</div>

