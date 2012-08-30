Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T6zuu-0005ZH-Co for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 10:15:56 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T6zj6-0000wv-Nv for openembedded-devel@lists.openembedded.org;
	Thu, 30 Aug 2012 10:03:44 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:03:44 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:03:44 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 30 Aug 2012 10:03:31 +0200
Message-ID: <k1n6oh$8ve$1@ger.gmane.org>
References: <503E506E.2010002@wisene.pl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <503E506E.2010002@wisene.pl>
X-Enigmail-Version: 1.4.4
Subject: Re: Newbie question: Angstrom on at91sam9g20
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
X-List-Received-Date: Thu, 30 Aug 2012 08:15:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 29-08-12 19:25, Mateusz Nowaczyk schreef:
> Hi, I've been using Angstrom 2011.03 (oe-classic) on a modified
> at91sam9g20ek board. Unfortunately, it seems that it is no longer updated
> - it contains obsolete version of dropbear (0.52) ect. I tried switching
> to the new oe-core based version, but it lacks adequate bsp layer. I also
> tried manually changing the opkg.conf and installing packages from 
> http://www.angstrom-distribution.org/feeds/v2012.05/ipk/eglibc/armv5te/base/
>
> 
but it only caused more problems (can't login at all).
> How can i get an up-to-date Angstrom for this architecture? Should I
> stick to the classic OE and manually update recipies, or rather create a
> bsp layer?

Create a bsp layer
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQPx5TMkyGM64RGpERAm2rAJwNh1Pa3bVvObs/5xBbXCr143E0oQCeMMpT
DhVtDFKZ3TJ4TuFBMtsiXQg=
=f150
-----END PGP SIGNATURE-----



