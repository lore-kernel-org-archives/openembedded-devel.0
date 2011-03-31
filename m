Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q5Odc-0003gv-Kr
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Mar 2011 22:38:42 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q5Obh-00076d-Aw from Tom_Rini@mentor.com ;
	Thu, 31 Mar 2011 13:36:41 -0700
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Thu, 31 Mar 2011 13:36:41 -0700
Received: from [172.30.80.77] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Thu, 31 Mar 2011 13:36:40 -0700
Message-ID: <4D94E5CE.3010801@mentor.com>
Date: Thu, 31 Mar 2011 13:36:30 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.14) Gecko/20110223 Lightning/1.0b2 Thunderbird/3.1.8
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20110331180721.GD23178@denix.org>
In-Reply-To: <20110331180721.GD23178@denix.org>
X-Enigmail-Version: 1.1.1
X-OriginalArrivalTime: 31 Mar 2011 20:36:41.0175 (UTC)
	FILETIME=[57514670:01CBEFE3]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance] Pull request for new TI machines, angstrom and qt4 fixes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 31 Mar 2011 20:38:42 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 03/31/2011 11:07 AM, Denys Dmytriyenko wrote:
> Tom,
> 
> Please pull these 8 commits for the external Angstrom toolchain fix,
> qt4 security advisory fix, as well as for addition of new TI machines.
> All are cherry picked from oe.dev
> 
> The machine commits were reordered to add kernel and u-boot recipes before the 
> actual machine configs.
> 
> 
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>   Branch: 2011.03-maintenance
>   Browse: http://arago-project.org/git/people/?p=denix/openembedded.git;a=shortlog;h=refs/heads/2011.03-maintenance
> 
> Thanks,
>     Denys Dmytriyenko <denys@ti.com>
> ---
> 
> 
> Chase Maupin (6):
>   linux-omap3: add PSP recipe for am387x-evm
>   u-boot: Add PSP version for am387x-evm
>   sort: Add ti814x machine types
>   ti814x: Add new machine definitions
>   am-benchmarks: Add support for am387x-evm machine
>   matrix-gui: Add support for am387x-evm machine
> 
> Denys Dmytriyenko (2):
>   external-toolchain-angstrom: don't stage .la files
>   qt4: security advisory - blacklist fraudulent comodo certificates

Applied, thanks.

- -- 
Tom Rini
Mentor Graphics Corporation
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iQEcBAEBAgAGBQJNlOXOAAoJEI4NMjfc3nJxtzoIAKvyaue1FpcI8KiRCDADIsqH
hp3bS7R2XSymVqj13NGXjRzZsjAZcwK1gwFYiHsoLDvTg8Zbq3MNB6YuTBqYrN5h
ZbpzuG8RGuFvTONGlTCaQRluh+82nk6w3M2oqejGua9NcENu1fnfgC+jTy1K38v6
yzF4zOYDCP62DbJFW/VUf3X7TY5qrRdAl8DazkSJ4pXRDXTqYYbaWLdbmAvYMSPK
vnpyesWKv8etkWHgOIIGqwBQGnA9Db5Qnlya0QU/VqpGqzPLprnJkirrHShGq2GL
8YXnMffsAdqiaB0KL0da3wlL5UEc3H2qGrBqz/171btgYjx3ZpiCkMtGbAbTSx0=
=sD4J
-----END PGP SIGNATURE-----


