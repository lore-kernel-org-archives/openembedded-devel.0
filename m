Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1ZXw-0005NK-NR for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 11:05:48 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T1ZMP-0002VX-Ea for openembedded-devel@lists.openembedded.org;
	Wed, 15 Aug 2012 10:53:53 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 10:53:53 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 15 Aug 2012 10:53:53 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 15 Aug 2012 10:53:42 +0200
Message-ID: <k0fo2k$fqc$1@dough.gmane.org>
References: <CAL2sKTn13OQ4edHfMwEVzLrpEO1prWGJ_V-1ueZj4KH4BBTDtA@mail.gmail.com>
	<k0d7ds$odu$2@dough.gmane.org>
	<CAL2sKTm8xG5o7MfWiALcXrzTsvqk-vR0VmkJbC4Wt4ecCZVxPQ@mail.gmail.com>
	<502A8D7E.1000009@communistcode.co.uk> <502B613B.4020200@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <502B613B.4020200@gmail.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [RFC][PATCH v2] plowshare: Add Git version (initial recipe)
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
X-List-Received-Date: Wed, 15 Aug 2012 09:05:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 15-08-12 10:43, Matthieu Crapet schreef:
> Hi,
> 
> Thanks for answer! The path in the "diff --git" line is not good. 
> "meta-openembedded-contrib/meta-oe/recipes-support" is my suggestion. 
> However, I don't know if this kind of software is suitable for oe-devel.
> I just wanted to create a "valid" recipe.
> 
> I'm still confused with this SRCREV thing. Just want to retrieve HEAD
> from git master branch.

That's not allowed, all SRCREVs must be locked down. If there's an update
you want/need, send a patch. Most people stop looking after AUTOREV recipes
after a month or so and everyone else gets to live with the breakage.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQK2OWMkyGM64RGpERAlWtAKCMwXpuClb8p1obLjU7PVMlni1d6gCcDsDI
CWuOwmaAtY+bHTFZO/F/g/s=
=eBzs
-----END PGP SIGNATURE-----



