{**
 * EJOSSAH journal homepage.
 *
 * OJS remains the source of truth for issue and publication data. The theme
 * deliberately keeps this page focused on the current issue and its articles.
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<main class="page_index_journal ejossah_home">
	{call_hook name="Templates::Index::journal"}

	{if $issue}
		<header class="ejossah_issue_header">
			<div>
				<p class="ejossah_issue_header__label">Current issue · Articles</p>
				<h1>{$issue->getIssueIdentification()|escape}</h1>
				<p class="ejossah_issue_header__description">
					Original research in the social sciences and humanities, with a focus on Ethiopia and the Horn of Africa.
				</p>
			</div>
			<dl class="ejossah_issue_header__meta" aria-label="Issue information">
				<div>
					<dt>Journal</dt>
					<dd>EJOSSAH</dd>
				</div>
				<div>
					<dt>Language</dt>
					<dd>English</dd>
				</div>
				<div>
					<dt>eISSN</dt>
					<dd>2520-582X</dd>
				</div>
			</dl>
		</header>

		<section class="current_issue" aria-labelledby="ejossah-articles-title">
			<h2 id="ejossah-articles-title">Research articles</h2>
			<div class="current_issue_title">{$issue->getIssueIdentification()|escape}</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{else}
		<header class="ejossah_issue_header">
			<div>
				<p class="ejossah_issue_header__label">EJOSSAH · Articles</p>
				<h1>Current issue</h1>
				<p class="ejossah_issue_header__description">No current issue has been published.</p>
			</div>
		</header>
	{/if}
</main>

{include file="frontend/components/footer.tpl"}
