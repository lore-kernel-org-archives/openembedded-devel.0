Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkaWe-0000Yp-KM for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 14:14:48 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TkaIe-0004eo-1y for openembedded-devel@lists.openembedded.org;
	Mon, 17 Dec 2012 14:00:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 14:00:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Dec 2012 14:00:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 17 Dec 2012 13:55:54 +0100
Message-ID: <kan4oj$786$2@ger.gmane.org>
References: <1355742261-14593-1-git-send-email-ross.burton@intel.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <1355742261-14593-1-git-send-email-ross.burton@intel.com>
X-Enigmail-Version: 1.4.6
Subject: Re: [PATCH] waffle: new package, a GL deferred resolution library.
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
X-List-Received-Date: Mon, 17 Dec 2012 13:14:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-12-12 12:04, Ross Burton schreef:
> Signed-off-by: Ross Burton <ross.burton@intel.com>

> diff --git a/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb
> b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb new file mode 100644 
> index 0000000..6bdeb1e --- /dev/null +++
> b/meta-oe/recipes-graphics/waffle/waffle_1.2.2.bb @@ -0,0 +1,21 @@ 
> +SUMMARY = "cross-platform C library to defer selection of GL API and of
> window system" +LICENSE = "BSD-2-Clause" +LIC_FILES_CHKSUM =
> "file://LICENSE.txt;md5=4c5154407c2490750dd461c50ad94797 \ +
> file://include/waffle/waffle.h;endline=24;md5=61dbf8697f61c78645e75a93c585b1bf"
>
> 
+
> +PR = "r0"

*insert usual comment about PR=r0 being a nuisance*



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQzxZaMkyGM64RGpERApjGAJ9UF7l5PcvEcKqHT6RW8JZ2uh5FEACgt1Eu
DTMV8WOs8cVWE2OCoUGmq/w=
=gawy
-----END PGP SIGNATURE-----



