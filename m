Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBmKr-0007tt-8j for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 13:09:43 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QBmIW-0007s1-9k for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 13:07:16 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:07:16 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 13:07:16 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 18 Apr 2011 13:07:01 +0200
Message-ID: <ioh60l$vaq$1@dough.gmane.org>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
	<20110418104421.GG2268@xora-eee.xora.org.uk>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <20110418104421.GG2268@xora-eee.xora.org.uk>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 00/13] Pull request #8
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
X-List-Received-Date: Mon, 18 Apr 2011 11:09:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 18-04-11 12:44, Graeme Gregory wrote:
> Not an issue with this checkin, but it raises a question for me,
> 
> Should xorg stuff be in OE core? Its not really that core in my mind.

OE-core still isn't fleshed out completely, but the current way of
thinking is "if enough layers depend on <foo>, <foo> should get
considered for oe-core".
I have been thinking out a meta-xorg this morning, but I'm trying to
stop myself from creating a gazillion layers just because I can :)

Can you move this discussion to the oe-core ml?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrBtVMkyGM64RGpERAt17AKCrHPk0DWz1bdfFBFjde+NZwc1P0ACgkzvf
rGFlMDD5qwP6lR0o/wgL3HE=
=YC6b
-----END PGP SIGNATURE-----



