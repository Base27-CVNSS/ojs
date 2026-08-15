{**
 * ERJSSH journal homepage. OJS remains the source of all issue and article data.
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page_index_journal erjssh_home">
	{call_hook name="Templates::Index::journal"}
	<div class="erjssh_masthead" aria-hidden="true">
		<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-masthead.jpg" alt="" width="1155" height="238">
	</div>

	<section class="erjssh_hero" aria-labelledby="erjssh-title">
		<figure class="erjssh_cover">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-cover.webp" alt="ERJSSH journal cover" width="1054" height="1492">
		</figure>
		<div class="erjssh_hero__content">
			<p class="erjssh_label">Peer-reviewed · 100% open access · Biannual</p>
			<h1 id="erjssh-title">Ethiopian Renaissance Journal of Social Sciences and Humanities</h1>
			<p>Rigorous multidisciplinary scholarship in the social sciences and humanities, published by the College of Social Sciences and Humanities, University of Gondar.</p>
			<dl class="erjssh_facts">
				<div><dt>Publication fee</dt><dd>APC free</dd></div>
				<div><dt>Access</dt><dd>100% open access</dd></div>
				<div><dt>Frequency</dt><dd>Two selected issues per year</dd></div>
				<div><dt>Peer review</dt><dd>Two independent reviewers</dd></div>
			</dl>
			<p class="erjssh_foreign_policy">The article count may vary by issue; editorial quality remains the primary criterion. International authors are covered by a separate policy. Please contact the ERJSSH Editorial Office.</p>
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

	<section class="erjssh_policy" id="about-journal">
		<header><p class="erjssh_label">About the Journal</p><h2>Aims, access and review</h2></header>
		<div class="erjssh_policy_grid">
			<div><strong>APC</strong><p>Free of charge</p></div>
			<div><strong>Access</strong><p>100% open access</p></div>
			<div><strong>Frequency</strong><p>Two issues per year</p></div>
			<div><strong>Review</strong><p>Double-blind; two independent reviewers</p></div>
		</div>
		<p>ERJSSH publishes English-language multidisciplinary scholarship across the social sciences and humanities. Article capacity may increase or decrease between issues, while publication remains conditional on successful editorial screening and peer review.</p>
		<div class="erjssh_marks">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-open-access.png" alt="Open access" width="300" height="120">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-ajol.png" alt="African Journals Online" width="938" height="232">
			<a href="https://www.scimagojr.com/journalsearch.php?q=21101111533&amp;tip=sid&amp;exact=no" rel="external"><img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-sjr.png" alt="SCImago Journal Rank profile" width="200" height="200"></a>
		</div>
	</section>

	<section class="erjssh_info" id="editorial-team">
		<header><p class="erjssh_label">Governance</p><h2>Editorial Team</h2></header>
		<div class="erjssh_people">
			<div><strong>Editor in Chief</strong><p>Prof. Busha Taa · Ph.D., Sociology · Professor, University of Gondar</p></div>
			<div><strong>Managing Editor</strong><p>Dr. Addisu Gedlu · Ph.D., Anthropology · Assistant Professor, University of Gondar</p></div>
			<div><strong>Associate Editors</strong><p>Dr. Assefa Alemu; Dr. Sisay Sahile; Dr. Meseret Kassie; Mr. Menychle Meseret; Dr. Aemero Asmamaw; Dr. Yared Debebe</p></div>
			<div><strong>International Advisory Board</strong><p>Prof. Mammo Muchie; Prof. John (Jack) Veugelers; Taye Nigusie; Prof. Kelly Askew; Prof. Peitro Togalia; Kateline Albert; Prof. Laura German; Solomon Gebryes Beyene; Dirk Bustorf; Hewan Semon</p></div>
		</div>
	</section>

	<section class="erjssh_info" id="privacy">
		<header><p class="erjssh_label">Data governance</p><h2>Privacy Statement</h2></header>
		<p>ERJSSH collects only the identity, affiliation, account, manuscript, review and correspondence data necessary for scholarly publishing. Information is used to manage submission, peer review, editorial decisions, publication and the integrity of the scholarly record.</p>
		<p>Data may be shared only with reviewers, editors and service providers required for journal operations. ERJSSH does not sell personal information. Authors, reviewers and readers may request access, correction or deletion, object to certain processing, or withdraw consent where applicable.</p>
	</section>

	<section class="erjssh_guidelines" id="guidelines">
		<header><p class="erjssh_label">For contributors</p><h2>Guidelines</h2></header>
		<details id="author-guideline"><summary>Author Guideline</summary><p>Submit original English-language work in an anonymized review file and a complete author file. Use APA 7th edition, provide a 140–200 word abstract and five to eight keywords, and include all required ethics and permission documentation. Submission and publication are free.</p></details>
		<details id="reviewer-guideline"><summary>Reviewers Guideline</summary><p>Assess originality, method, evidence, argument, ethics and contribution objectively and confidentially. Declare conflicts and report suspected misconduct privately to the editor.</p></details>
		<details id="editorial-process"><summary>Editorial Process</summary><p>Administrative screening is followed by editorial assessment, double-blind review by two independent specialists, revision, final decision, copy-editing, production and author approval.</p></details>
	</section>
</div>

{include file="frontend/components/footer.tpl"}
