{**
 * plugins/themes/ejossah/templates/frontend/pages/indexJournal.tpl
 *
 * EJOSSAH journal homepage. Issue and article data remain dynamic and are
 * supplied by OJS.
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal ejossah_home">

	{call_hook name="Templates::Index::journal"}

	<section class="ejossah_hero" aria-labelledby="ejossah-hero-title">
		<div class="ejossah_hero__body">
			<p class="ejossah_hero__kicker">{translate key="plugins.themes.ejossah.hero.kicker"}</p>
			<h2 id="ejossah-hero-title">{translate key="plugins.themes.ejossah.hero.title"}</h2>
			<p class="ejossah_hero__tagline">{translate key="plugins.themes.ejossah.hero.tagline"}</p>
			<div class="ejossah_hero__actions">
				<a class="ejossah_button ejossah_button--primary" href="{url router=PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="current"}">
					{translate key="plugins.themes.ejossah.hero.currentIssue"}
				</a>
				<a class="ejossah_button ejossah_button--ghost" href="{url router=PKP\core\PKPApplication::ROUTE_PAGE page="about" op="submissions"}">
					{translate key="plugins.themes.ejossah.hero.submit"}
				</a>
			</div>
		</div>
		<div class="ejossah_hero__identity" aria-hidden="true">
			<span class="ejossah_hero__monogram">EJ</span>
			<span class="ejossah_hero__acronym">EJOSSAH</span>
			<span class="ejossah_hero__issn">E-ISSN 2520-582X</span>
		</div>
	</section>

	<dl class="ejossah_facts" aria-label="Journal facts">
		<div>
			<dt>{translate key="plugins.themes.ejossah.fact.since"}</dt>
			<dd>2003</dd>
		</div>
		<div>
			<dt>{translate key="plugins.themes.ejossah.fact.publisher"}</dt>
			<dd>College of Social Sciences, Addis Ababa University</dd>
		</div>
		<div>
			<dt>{translate key="plugins.themes.ejossah.fact.frequency"}</dt>
			<dd>{translate key="plugins.themes.ejossah.fact.biannual"}</dd>
		</div>
		<div>
			<dt>{translate key="plugins.themes.ejossah.fact.apc"}</dt>
			<dd>{translate key="plugins.themes.ejossah.fact.free"}</dd>
		</div>
		<div>
			<dt>{translate key="plugins.themes.ejossah.fact.indexing"}</dt>
			<dd><a href="https://doaj.org/toc/2520-582X" rel="external">DOAJ</a></dd>
		</div>
	</dl>

	{if $highlights->count()}
		{include file="frontend/components/highlights.tpl" highlights=$highlights}
	{/if}

	{if $activeTheme && !$activeTheme->getOption('useHomepageImageAsHeader') && $homepageImage}
		<div class="homepage_image">
			<img src="{$publicFilesDir}/{$homepageImage.uploadName|escape:"url"}"{if $homepageImage.altText} alt="{$homepageImage.altText|escape}"{/if}>
		</div>
	{/if}

	{if $categories && $categories->count() > 0}
		{include file="frontend/components/categoryHeader.tpl" categories=$categories}
	{/if}

	{if $activeTheme && $activeTheme->getOption('showDescriptionInJournalIndex')}
		<section class="homepage_about">
			<a id="homepageAbout"></a>
			<h2>{translate key="about.aboutContext"}</h2>
			{$currentContext->getLocalizedData('description')}
		</section>
	{/if}

	{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}

	{if $publishedPublications && $publishedPublications->count()}
		{include file="frontend/objects/latest_article.tpl" articles=$publishedPublications heading="h2"}
	{/if}

	{if $issue}
		<section class="current_issue">
			<a id="homepageIssue"></a>
			<h2>{translate key="journal.currentIssue"}</h2>
			<div class="current_issue_title">{$issue->getIssueIdentification()|escape}</div>
			{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			<a href="{url router=PKP\core\PKPApplication::ROUTE_PAGE page="issue" op="archive"}" class="read_more">
				{translate key="journal.viewAllIssues"}
			</a>
		</section>
	{/if}

	{if $additionalHomeContent}
		<div class="additional_content">{$additionalHomeContent}</div>
	{/if}
</div>

{include file="frontend/components/footer.tpl"}
