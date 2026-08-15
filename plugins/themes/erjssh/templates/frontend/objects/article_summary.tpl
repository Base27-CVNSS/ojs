{**
 * ERJSSH article summary: title, authors, DOI, abstract, keywords and PDF.
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
	{assign var=abstract value=$publication->getLocalizedData('abstract')}
	{if $abstract}
		<div class="erjssh_abstract"><strong>{translate key="article.abstract"}:</strong> {$abstract|strip_unsafe_html}</div>
	{/if}
	<details class="erjssh_article_details">
		<summary>Article Details</summary>
		<div>
			{assign var=keywords value=$publication->getLocalizedData('keywords')}
			{if $keywords}
				<p><strong>{translate key="article.subject"}:</strong>
				{foreach from=$keywords item=keyword name=erjsshKeywords}{$keyword|escape}{if !$smarty.foreach.erjsshKeywords.last}; {/if}{/foreach}</p>
			{/if}
			{if $doiObject}<p><strong>DOI:</strong> {$doiObject->getData('resolvingUrl')|escape}</p>{/if}
		</div>
	</details>
	{if $publication->getData('galleys')}
		<ul class="erjssh_galleys">
			{foreach from=$publication->getData('galleys') item=galley}
				<li>{include file="frontend/objects/galley_link.tpl" parent=$article galley=$galley purchaseFee=$currentJournal->getData('purchaseArticleFee') purchaseCurrency=$currentJournal->getData('currency')}</li>
			{/foreach}
		</ul>
	{/if}
</article>
