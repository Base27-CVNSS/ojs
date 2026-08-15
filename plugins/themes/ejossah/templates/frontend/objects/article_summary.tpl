{**
 * Minimal EJOSSAH article summary.
 *
 * The issue page exposes only the scholarly fields needed for discovery and
 * citation: title, authors, DOI, abstract and keywords.
 *}
{assign var=publication value=$article->getCurrentPublication()}
{assign var=doiObject value=$publication->getData('doiObject')}
{assign var=abstract value=$publication->getLocalizedData('abstract')}
{assign var=keywords value=$publication->getLocalizedData('keywords')}

<article class="obj_article_summary">
	<h3 class="title">
		<a id="article-{$article->getId()}" href="{if $doiObject}{$doiObject->getData('resolvingUrl')|escape}{else}{url page="article" op="view" path=$article->getBestId()}{/if}"{if $doiObject} rel="external"{/if}>
			{$publication->getLocalizedTitle()|strip_unsafe_html}
			{if $publication->getLocalizedSubtitle()}
				<span class="subtitle">{$publication->getLocalizedSubtitle()|strip_unsafe_html}</span>
			{/if}
		</a>
	</h3>

	<div class="meta">
		{if !$article->getData('hideAuthor')}
			<span class="authors">{$publication->getAuthorString()|escape}</span>
		{/if}
		{if $publication->getData('pages')}
			<span class="pages">{$publication->getData('pages')|escape}</span>
		{/if}
	</div>

	{if $doiObject}
		<a class="ejossah_doi" href="{$doiObject->getData('resolvingUrl')|escape}" rel="external">
			{$doiObject->getData('doi')|escape}
		</a>
	{/if}

	{if $abstract}
		<section class="ejossah_abstract" aria-label="Abstract">
			<h4 class="ejossah_field_label">Abstract</h4>
			{$abstract|strip_unsafe_html}
		</section>
	{/if}

	{if $keywords}
		<p class="ejossah_keywords">
			<strong>Keywords</strong>
			{foreach from=$keywords item=keyword name=ejossahKeywords}
				{$keyword|escape}{if !$smarty.foreach.ejossahKeywords.last}, {/if}
			{/foreach}
		</p>
	{/if}

	{call_hook name="Templates::Issue::Issue::Article"}
</article>
