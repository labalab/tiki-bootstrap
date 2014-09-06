{if !isset($navbar_count)}
	{assign var='navbar_count' value=1}
{else}
	{assign var='navbar_count' value=$navbar_count+1}
{/if}

<div class="navbar-header">
  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#collapsible-navbar-{$navbar_count}">
		<span class="sr-only">Toggle navigation</span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
		<span class="icon-bar"></span>
	</button>
	<a class="navbar-brand" href="{$prefs.wikiHomePage}">
		<i class="labalab-icon labalab-logo"></i>
		<span class="site-title">
			{$prefs.sitetitle}
		</span>
	</a>
</div>

<div id="collapsible-navbar-{$navbar_count}" class="collapse navbar-collapse navbar-left">
	<ul class="nav navbar-nav">
		{foreach from=$list item=item}
			{if $item.children|count}
				<li class="dropdown{if $item.selected} active{/if}">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						{tr}{$item.name|escape}{/tr}
						<b class="caret"></b>
					</a>
					<ul class="dropdown-menu">
						{foreach from=$item.children item=sub}
							<li{if $sub.selected} class="active"{/if}><a href="{$sub.sefurl|escape}">{tr}{$sub.name|escape}{/tr}</a></li>
						{/foreach}
					</ul>
				</li>
			{else}
				<li{if $item.selected} class="active"{/if}><a href="{$item.sefurl|escape}">{tr}{$item.name|escape}{/tr}</a></li>
			{/if}
		{/foreach}
	</ul>
</div>
<!-- Search -->
<form class="navbar-form navbar-left" role="search" action="/tiki-searchresults.php" method="POST">
	<div class="input-group">
		<input type="text" name="highlight" class="form-control" value="{$smarty.post.highlight}" />
		<span class="input-group-btn">
			<button type="submit" class="btn btn-default">
				<i class="glyphicon glyphicon-search"></i>
			</button>
		</span>
	</div>
</form>
<!-- / Search -->

<!-- Lang switcher -->
<div class="navbar-right lang-switcher navbar-collapse">
	<ul class="nav navbar-nav">
		{section name=ix loop=$prefs.available_languages}
			{assign var='lang' value=$prefs.available_languages[ix]|escape}
			<li{if $prefs.language eq $lang} class="active"{/if}>
				<a href="/tiki-switch_lang.php?language={$lang}">
					{$lang}
				</a>
			</li>
		{/section}
	</ul>
</div>
<!-- / Lang switcher -->
