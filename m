Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJMV7-0004vy-Sp for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:48:25 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TJMIG-00033f-0E for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 12:35:08 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:35:07 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 12:35:07 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 03 Oct 2012 12:24:19 +0200
Message-ID: <k4h3oh$n4q$4@ger.gmane.org>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <cover.1349107616.git.paul.eggleton@linux.intel.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 10:48:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-10-12 18:14, Paul Eggleton schreef:
> So finally I have got this into a working state; apologies for the delay.
> There were a number of issues affecting cross-compilation as well as some
> problems with the initial configuration; these should now be addressed.
> We may wish to look at a more standard directory layout for Apache as the
> default one doesn't seem to be used by most distributions; we can look at
> this later - for now let's get the recipes out there so people can try
> them out.
> 
> I know there are a few people waiting to submit additional recipes for 
> this layer and I expect we will also want to look at moving some 
> web-server related recipes from meta-oe into here at some point in the 
> near future.
> 
> 
> The following changes since commit
> 7bfff4b1d6b0067ddabf2474320e3e78795b2b4f:
> 
> uhd,fuse: Fix misplaced quotations (2012-09-28 22:50:42 +0200)
> 
> are available in the git repository at:
> 
> git://git.openembedded.org/meta-openembedded-contrib
> paule/meta-webserver-add 
> http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=paule/meta-webserver-add
>
>  Paul Eggleton (6): Add meta-webserver layer apache2: add from
> OE-Classic modphp: add from OE-Classic apache2: update to version 2.4.2
> and fix modphp: update to 5.3.14 and fix xdebug: add new recipe

Squash those "import" with the "fix" commits, no sense in having a broken
recipe in there.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQbBJTMkyGM64RGpERAnW0AKCEqJZSIe3A+BJ7h8VchN/jKfV0BgCeOcM8
sKPvfhNA7x2tyEhwEj6dw/M=
=5Lcn
-----END PGP SIGNATURE-----



