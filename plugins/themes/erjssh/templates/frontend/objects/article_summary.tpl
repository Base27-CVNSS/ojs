{**
 * ERJSSH DOI-only article summary.
 *}
{assign var=publication value=$article->getCurrentPublication()}
{assign var=doiObject value=$publication->getData('doiObject')}
{if !$heading}
	{assign var="heading" value="h2"}
{/if}

<article class="obj_article_summary erjssh_article">
	<{$heading} class="title">
		{$publication->getLocalizedTitle(null, 'html')|strip_unsafe_html}
		{assign var=localizedSubtitle value=$publication->getLocalizedSubtitle(null, 'html')|strip_unsafe_html}
		{if $localizedSubtitle}<span class="subtitle">{$localizedSubtitle}</span>{/if}
	</{$heading}>
	{if $publication->getData('authors')}
		<p class="authors">{$publication->getAuthorString()|escape}</p>
	{/if}
	{if $doiObject}
		<a class="erjssh_doi" href="{$doiObject->getData('resolvingUrl')|escape}" rel="external">{$doiObject->getData('resolvingUrl')|escape}</a>
	{/if}
</article>
