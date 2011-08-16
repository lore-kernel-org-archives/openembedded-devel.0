Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtLoq-0001oB-Eo for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 17:44:44 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QtLkL-0004S5-VJ for openembedded-devel@lists.openembedded.org;
	Tue, 16 Aug 2011 17:40:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 17:40:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Aug 2011 17:40:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 16 Aug 2011 17:37:15 +0200
Message-ID: <j2e2rb$g94$2@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
X-Enigmail-Version: 1.2
Subject: meta-oe patch status
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
X-List-Received-Date: Tue, 16 Aug 2011 15:44:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hi,

The current set of patches I have q'd:

+ 246b0b07f771ef6d096d0ef3e488ea28c56e13c5 binutils-2.20.1: import several patches from Debian
+ 7de84a29b3dc9b5a8987e3ba6df07de8224debf1 ckermit: import from OE rev 5350bbef01b8979617e3d0fd38939f94f1fa5315
+ f5ac255987f6ca361ea960296925f46681a2495a ckermit: update to version 9.0
+ 7f5254273ab360dd53672323896e3579223a2100 nodejs 0.4.2: import from OE rev e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
+ 0520132f3087eaa2a74a1b985760f15cc28b8d6b libvpx 0.9.5: import from OE rev e02237d7e46e60fbd9eb4a05a308e6adcf916ebb
+ 567d7b4502679288fa0679e18982a3d90d44922e libav: enable libvpx
+ 198f50f12b15ee701fdc3bfd99d2955b445d4d0a emprint: add LIC_FILES_CHKSUM
+ 2bef2cb4ea697f3ff8d18719afe62a405587485b klibc: initial commit of version 1.5.24
+ a1600343feea4a22da7bfa9ddb817cba787f949b klibc.bbclass: shared include for building against klibc
+ cbcabe1ca34892c12285418c043ead8ee08d519c openssl-1.0.0d: use openssl.inc from meta-oe
+ 403753cc6580f283a89d89fa8958bc92e895db4a connman: conditionally enable wifi and bluetooth

You can view them at https://github.com/koenkooi/meta-oe/commits/master

If you have any patches I have missed for some reason or another (e.g. missing [meta-oe]) or want to get some fixups in (e.g. reset PR to r0 for new recipes), please respond to this message.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOSo6rMkyGM64RGpERAq2OAJ4pF3eM4Ee8R/yQHb3gXunKC5gLlwCeLxV1
dN3d+DglZWDoXhYLiKiXSAI=
=/Q7h
-----END PGP SIGNATURE-----



