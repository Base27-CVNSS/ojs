{**
 * ERJSSH journal homepage. OJS remains the source of all issue and article data.
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal erjssh_home">
	{call_hook name="Templates::Index::journal"}

	<section class="erjssh_hero" aria-labelledby="erjssh-title">
		<figure class="erjssh_cover">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-cover.webp" alt="ERJSSH journal cover" width="1054" height="1492">
		</figure>
		<div class="erjssh_hero__content">
			<p class="erjssh_label">Peer-reviewed · Open access · Biannual</p>
			<h1 id="erjssh-title">Ethiopian Renaissance Journal of Social Sciences and Humanities</h1>
			<p>Rigorous multidisciplinary scholarship in the social sciences and humanities, published by the College of Social Sciences and Humanities, University of Gondar.</p>
			<dl class="erjssh_facts">
				<div><dt>Publisher</dt><dd>University of Gondar</dd></div>
				<div><dt>Language</dt><dd>English</dd></div>
				<div><dt>Online ISSN</dt><dd>2409-6385</dd></div>
				<div><dt>Print ISSN</dt><dd>2409-6385</dd></div>
			</dl>
			<a class="erjssh_external" href="https://www.scimagojr.com/journalsearch.php?q=21101111533&amp;tip=sid&amp;exact=no" rel="external">SCImago journal profile ↗</a>
		</div>
	</section>

	{if $issue}
		<section class="current_issue" id="current-issue">
			<header class="erjssh_issue_header">
				<p class="erjssh_label">Current issue</p>
				<h2>{$issue->getIssueIdentification()|escape}</h2>
			</header>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
		</section>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
