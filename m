Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9G66-0006gh-BU for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:56:50 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1T9FuB-0005eF-6b for openembedded-devel@lists.openembedded.org;
	Wed, 05 Sep 2012 15:44:31 +0200
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:44:31 +0200
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Sep 2012 15:44:31 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 05 Sep 2012 15:44:28 +0200
Message-ID: <k27kvd$e10$1@ger.gmane.org>
References: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
In-Reply-To: <1346852108-16462-1-git-send-email-sander@outrightsolutions.nl>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe][PATCH 1/2] libimobiledevice: add recipe for Apple products protocol support
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
X-List-Received-Date: Wed, 05 Sep 2012 13:56:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 05-09-12 15:35, Sander van Grieken schreef:
> Signed-off-by: Sander van Grieken <sander@outrightsolutions.nl> --- 
> .../libimobiledevice/libimobiledevice_1.1.4.bb     |   22
> ++++++++++++++++++++ 1 file changed, 22 insertions(+) create mode 100644
> meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> 
> diff --git
> a/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
> b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>
> 
new file mode 100644
> index 0000000..a4ebeab --- /dev/null +++
> b/meta-oe/recipes-connectivity/libimobiledevice/libimobiledevice_1.1.4.bb
>
> 
@@ -0,0 +1,22 @@
> +LICENSE = "GPLv2 & LGPLv2.1" +LIC_FILES_CHKSUM = "\ +
> file://COPYING;md5=ebb5c50ab7cab4baeffba14977030c07 \ +
> file://COPYING.LESSER;md5=6ab17b41640564434dda85c06b7124f7 \ +    " + 
> +HOMEPAGE ="http://www.libimobiledevice.org/" + +DEPENDS = "libplist
> usbmuxd libtasn1 gnutls libgcrypt" + +PR = "r0"

Default, drop that

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQR1c8MkyGM64RGpERAhWWAJ0dsNi3Z8i4/NMhyefM0SaLiKn9ggCgugwU
N/t44VZZoKGrAwCkxGP8kls=
=clsZ
-----END PGP SIGNATURE-----



