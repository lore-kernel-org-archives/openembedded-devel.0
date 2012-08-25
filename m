Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T5Ae1-0003Mg-4Y for openembedded-devel@lists.openembedded.org;
	Sat, 25 Aug 2012 09:18:57 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T5ASH-0001WL-6q for openembedded-devel@lists.openembedded.org;
	Sat, 25 Aug 2012 09:06:49 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Aug 2012 09:06:49 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 25 Aug 2012 09:06:49 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 25 Aug 2012 09:06:35 +0200
Message-ID: <k19thr$cur$1@ger.gmane.org>
References: <1345831918-15547-1-git-send-email-joe.macdonald@windriver.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1345831918-15547-1-git-send-email-joe.macdonald@windriver.com>
X-Enigmail-Version: 1.4.3
Subject: Re: [meta-oe][PATCH v2] meta-networking: add layer
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
X-List-Received-Date: Sat, 25 Aug 2012 07:18:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 24-08-12 20:11, Joe MacDonald schreef:
> A home for networking-related packages.  This includes protocol support, 
> servers / daemons and utilities.
> 
> Signed-off-by: Joe MacDonald <joe.macdonald@windriver.com> ---

> --- /dev/null +++ b/meta-networking/README @@ -0,0 +1,16 @@ 
> +meta-networking +=============== + +This layer is intended to be a
> central point for networking-related +packages and configuration.  It
> should be useful directly on top of +oe-core and compliments
> meta-openembedded.  It should be primarily useful +to the following
> groups: + +      - Anyone building a small networking device (eg. a home
> router / +        bridge / switch). + +      - Anyone wanting to add
> network services to their device (eg. +        anything that might
> benefit from a small ftp/tftp server) + +Please see the MAINTAINERS file
> for information on contacting the +maintainers of this layer, as well as
> instructions for submitting patches.

This is missing the dependency info, e.g.

This layer depends on:

URI: git://git.openembedded.org/openembedded-core
branch: master
revision: HEAD
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQOHl7MkyGM64RGpERAnR4AKCNIGWmim0yh0aPwUv0bF7yy4LRrgCdHvGi
Z0LeQSFZXzfX6wchkLC8zHY=
=thVi
-----END PGP SIGNATURE-----



