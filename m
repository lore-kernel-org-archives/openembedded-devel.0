Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHdHD-0006nm-AH for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 16:42:07 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QHdEf-0002EM-Ep for openembedded-devel@lists.openembedded.org;
	Wed, 04 May 2011 16:39:29 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2011 16:39:29 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 May 2011 16:39:29 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 04 May 2011 16:39:18 +0200
Message-ID: <iproem$fnt$1@dough.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
X-Enigmail-Version: 1.0.1
Subject: OE weekly changelog for meta-openembedded, 2011-04-25 to 2011-05-02
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
X-List-Received-Date: Wed, 04 May 2011 14:42:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


Khem Raj (7):
  proxy-libintl: Upgrade to proxy-libintl-20100902
  libgpg-error_1.8.bb: No need to add gettext directly to DEPENDS
  tzdata, tzcode: Update 2011e -> 2011g
  xcb-proto: Add recipe for version 1.6
  libx11_1.4.3.bb: Remove --without-xcb
  proxy-libintl_20100902.bb: Specify -fPIC in CFLAGS
  gcc: Upgrade to 4.5.3 and bring in latest linaro updates

Martin Jansa (2):
  gcc-4.5: drop comment from SRC_URI
  gcc-4.5: add checksums
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNwWUWMkyGM64RGpERAt5wAKCQVH3e/AsZ8Ss0y0oXDG7xrDAcQgCgjOWr
0/SuQrQjNzZ34gjLarjAI9g=
=WVVg
-----END PGP SIGNATURE-----



