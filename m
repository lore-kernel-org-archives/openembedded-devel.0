Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPYZP-0005g8-2r for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 12:13:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OPYV3-0005KX-56 for openembedded-devel@lists.openembedded.org;
	Fri, 18 Jun 2010 12:08:37 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 12:08:37 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Jun 2010 12:08:37 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 18 Jun 2010 12:08:28 +0200
Message-ID: <hvfgis$jkb$1@dough.gmane.org>
References: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.10) Gecko/20100524 Shredder/3.0.6pre
In-Reply-To: <AANLkTimG439FroM6HmVePh9WeX2nlxdkn1RVtBqI1y96@mail.gmail.com>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] purge recipes/linux-kexecboot and move to recipes/linux
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
X-List-Received-Date: Fri, 18 Jun 2010 10:13:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 17-06-10 14:24, Andrea Adami wrote:
> Hello,
> 
> I plan to move soon the kernel recipes of linux-kexecboot in the
> standard recipes/linux location.
> 
> Being that the kernel directory is already overpopulated I was
> thinking to remove some obsolete versions before moving the recipes.
> I know that obsolete != unused, that's why I'm asking:
> 
> Who is using linux-kexecboot kernels?
> Which machines apart some Zaurus are needing older 2.6.2x kernels?
> 
> If it's only about Zaurus I'd *only* keep an older version (still to
> decide if 2.6.24 or 2.6.26) for a while and the latest 2.6.34.
> 
> Please make your comments.

I'm confused if you're RFC'ing one or more things, could you please show
patches to illustrate what you want?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFMG0WcMkyGM64RGpERAq4WAJwPHCB8k4YdIeBbsgdis8KH3a4G9QCdHYxb
Xf3Pk5E78uPS109SXm3fQWk=
=lnSK
-----END PGP SIGNATURE-----



