{* $Id: layout_view.tpl 48366 2013-11-08 16:12:24Z lphuberdeau $ *}<!DOCTYPE html>
<html lang="{if !empty($pageLang)}{$pageLang}{else}{$prefs.language}{/if}"{if !empty($page_id)} id="page_{$page_id}"{/if}>
	<head>
		{include file='header.tpl'}
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
	</head>
	<body{html_body_attributes}>
		{$cookie_consent_html}

		{if $prefs.feature_ajax eq 'y'}
			{include file='tiki-ajax_header.tpl'}
		{/if}
			{assign var="banner_img" value="24"}
  	<div class="labalab-banner layer{if !($page eq 'Accueil')} tiny-banner{/if}" style="background-image:url(display{$banner_img});">
		  <!-- Utiliser cette ligne si on souhaite mettre la texture du Labalab par-dessus une image 
			div class="banner layer-top" style="height:192px;background-image:url(display51);background-size:contain;opacity:0.5"-->
				{if $page eq 'Accueil'}
					<h1 class="sitetitle">{$prefs.sitetitle}</h1>
				{/if}
			</div>
		</div>
		<div class="container">
            <div class="row page-header">
				<div class="col-md-12">
					{modulelist zone=top}
                </div>
			</div>
			<div class="row">
				<div class="col-md-12">
					{modulelist zone=topbar}
				</div>
			</div>

			<div class="row">
				{if zone_is_empty('left') and zone_is_empty('right')}
					<div class="col-md-12" id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						<div class="pull-right">{block name=quicknav}{/block}</div>
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
				{elseif zone_is_empty('left')}
					<div class="col-md-9" id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						<div class="pull-right">{block name=quicknav}{/block}</div>
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-3" id="col3">
						{modulelist zone=right}
					</div>
				{elseif zone_is_empty('right')}
					<div class="col-md-9 col-md-push-3" id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						<div class="pull-right">{block name=quicknav}{/block}</div>
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-3 col-md-pull-9" id="col2">
						{modulelist zone=left}
					</div>
				{else}
					<div class="col-md-8 col-md-push-2" id="col1">
                        {if $prefs.module_zones_pagetop eq 'fixed' or ($prefs.module_zones_pagetop ne 'n' && ! zone_is_empty('pagetop'))}
                            {modulelist zone=pagetop}
                        {/if}
						<div class="pull-right">{block name=quicknav}{/block}</div>
						{block name=title}{/block}
						{block name=navigation}{/block}
						{error_report}
						{block name=content}{/block}
                        {if $prefs.module_zones_pagebottom eq 'fixed' or ($prefs.module_zones_pagebottom ne 'n' && ! zone_is_empty('pagebottom'))}
                            {modulelist zone=pagebottom}
                        {/if}
					</div>
					<div class="col-md-2 col-md-pull-8" id="col2">
						{modulelist zone=left}
					</div>
					<div class="col-md-2" id="col3">
						{modulelist zone=right}
					</div>
				{/if}
			</div>

		</div>

		<div class="zone-bottom">
			<div class="container">
				<div class="col-md-12">
					{modulelist zone=bottom}
				</div>
			</div>
		</div>

		{include file='footer.tpl'}
	</body>
</html>
{if !empty($smarty.request.show_smarty_debug)}
	{debug}
{/if}
