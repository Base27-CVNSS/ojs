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
			<p>Published by the University of Gondar, ERJSSH is an open-access, peer-reviewed journal indexed in Scopus. It publishes multidisciplinary research across anthropology, history, sociology, geography, international relations, linguistics, political science and media studies.</p>
			<div class="erjssh_overview" aria-label="Journal overview">
				<dl class="erjssh_facts">
					<div><dt>Publisher</dt><dd>University of Gondar</dd></div>
					<div><dt>Established</dt><dd>2014</dd></div>
					<div><dt>ISSN</dt><dd>2409-6377 · eISSN 2409-6385</dd></div>
					<div><dt>Frequency</dt><dd>Biannual · 28 February / 31 August</dd></div>
				</dl>
				<a class="erjssh_sjr" href="https://www.scimagojr.com/journalsearch.php?q=21101111533&amp;tip=sid&amp;clean=0" rel="external noopener" aria-label="View ERJSSH on SCImago Journal Rank">
					<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-sjr.png" alt="ERJSSH SCImago Journal Rank 2025" width="200" height="200">
					<span>Scopus · SJR 2025: 0.143</span>
				</a>
			</div>
			<p class="erjssh_foreign_policy">No APC is charged. Article counts vary by issue; all submissions follow the same review standards. International authors should consult the ERJSSH Editorial Office.</p>
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
			<div><strong>APC</strong><p>None</p></div>
			<div><strong>Access</strong><p>100% open access</p></div>
			<div><strong>Frequency</strong><p>Two issues annually</p></div>
			<div><strong>Review</strong><p>Double-blind · two reviewers</p></div>
		</div>
		<p>ERJSSH publishes multidisciplinary research in English. All articles undergo editorial screening and double-blind peer review. Article counts may vary by issue.</p>
		<div class="erjssh_marks">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-open-access.png" alt="Open access" width="300" height="120">
			<img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-ajol.png" alt="African Journals Online" width="938" height="232">
			<a href="https://www.scimagojr.com/journalsearch.php?q=21101111533&amp;tip=sid&amp;clean=0" rel="external noopener"><img src="{$baseUrl}/plugins/themes/erjssh/assets/erjssh-sjr.png" alt="SCImago Journal Rank profile" width="200" height="200"></a>
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
		<p>ERJSSH processes only the identity, affiliation, account, manuscript, review and correspondence data required for scholarly publishing.</p>
		<p>Data are shared only with reviewers, editors and essential service providers. ERJSSH does not sell personal data. Users may request access, correction or deletion, object to eligible processing, or withdraw consent where applicable.</p>
	</section>

	<section class="erjssh_guidelines" id="guidelines">
		<header><p class="erjssh_label">For contributors</p><h2>Guidelines</h2></header>
		<details id="author-guideline"><summary>Author Guidelines</summary><p>Submit original English-language work as an anonymized review file and a complete author file. Use APA 7th edition, include a 140–200 word abstract and five to eight keywords, and provide all ethics and permissions documentation. No APC is charged.</p></details>
		<details id="reviewer-guideline"><summary>Reviewer Guidelines</summary><p>Assess originality, methodology, evidence, argument, ethics and contribution. Reviews must be objective, constructive and confidential. Declare conflicts and report suspected misconduct to the editor.</p></details>
		<details id="editorial-process"><summary>Editorial Process</summary><p>Screening is followed by editorial assessment, double-blind review by at least two independent reviewers, revision, final decision, copyediting, production and author approval.</p></details>
	</section>
</div>

{include file="frontend/components/footer.tpl"}
