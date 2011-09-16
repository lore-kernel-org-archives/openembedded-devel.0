Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4ZIr-0004qE-7y for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:22:06 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1R4ZDj-0000Y3-MO for openembedded-devel@lists.openembedded.org;
	Fri, 16 Sep 2011 16:16:47 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 16:16:47 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Sep 2011 16:16:47 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 16 Sep 2011 16:16:34 +0200
Message-ID: <j4vlo2$au4$1@dough.gmane.org>
References: <6b5477acbb0bbaf15b13f6dbc2121ba0e2fe7100.1316181283.git.Martin.Jansa@gmail.com>
	<443990646f24d1018edc048aff09230ebab2b94f.1316181283.git.Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:6.0.1) Gecko/20110830 Thunderbird/6.0.1
In-Reply-To: <443990646f24d1018edc048aff09230ebab2b94f.1316181283.git.Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.3.1
Subject: Re: [meta-oe][PATCH 03/10] xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc to RDEPENDS on xserver-xf86-config from oe-core and bsp layers
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
X-List-Received-Date: Fri, 16 Sep 2011 14:22:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-09-11 15:56, Martin Jansa schreef:

> xserver-xorg-conf: drop from meta-oe, update xorg-xserver-common.inc to 
> RDEPENDS on xserver-xf86-config from oe-core and bsp layers

Which BSP layers are that? Do you have an example on how to convert from
xserver-xorg-conf to xserver-xf86-config while keeping upgrade paths sane?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOc1pCMkyGM64RGpERAo9NAKCI2bHqJkOz8S/3iiclI7YmoYSOKgCdE+iq
5/ncCRm2sMkS1Y+PnQN630k=
=A1II
-----END PGP SIGNATURE-----



