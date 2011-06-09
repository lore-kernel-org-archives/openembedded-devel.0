Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUf5z-0002mT-7K for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 15:16:23 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QUf2n-00065R-HT for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jun 2011 15:13:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 15:13:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jun 2011 15:13:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 09 Jun 2011 15:12:47 +0200
Message-ID: <isqgsf$ktd$1@dough.gmane.org>
References: <4DF0C472.4030608@dresearch-fe.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4DF0C472.4030608@dresearch-fe.de>
X-Enigmail-Version: 1.0.1
Subject: Re: Distros supporting older kernels?
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
X-List-Received-Date: Thu, 09 Jun 2011 13:16:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 09-06-11 15:02, Steffen Sledz wrote:
> Hi Distro Maintainers,
> 
> as you could read in earlier messages of mine, we're forced to use an
> older kernel version (2.6.24) for our hardware. This brings a lot of
> problems as you can imagine (e.g. we're also bound to udev-141).
> 
> Until now we've used angstrom-2008.1 with some own patches according to
> the linux-libc-headers and udev versions for our hardware which were
> reasonably not accepted by the Angstrom maintainers (see discussions [1]
> or [2]).
> 
> In there current situation (angstrom-2008.1 is deprecated,

Ehm, 2008.1 is not deprecated, it's still fully supported in the 2011.03
maintenance branch.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN8MbPMkyGM64RGpERAgF7AKCGjnsrW63s4rBTAH/ZUVzFAGbRWACeM/Kc
Bc88jtYjU/yuLsJ3Knh9KLc=
=gpMW
-----END PGP SIGNATURE-----



