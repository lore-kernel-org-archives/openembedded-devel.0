Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9F0B-0002Fs-5M for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 13:14:23 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1S9Ere-0000ng-TW for openembedded-devel@lists.openembedded.org;
	Sun, 18 Mar 2012 13:05:34 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:05:34 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2012 13:05:34 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sun, 18 Mar 2012 13:05:20 +0100
Message-ID: <jk4j25$dat$1@dough.gmane.org>
References: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <1331926860-2964-1-git-send-email-gary@mlbassoc.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe][PATCH] midori: Add project home page info
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
X-List-Received-Date: Sun, 18 Mar 2012 12:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-03-12 20:41, Gary Thomas schreef:
> Signed-off-by: Gary Thomas <gary@mlbassoc.com> --- 
> meta-oe/recipes-connectivity/midori/midori.inc |    1 + 1 files changed,
> 1 insertions(+), 0 deletions(-)
> 
> diff --git a/meta-oe/recipes-connectivity/midori/midori.inc
> b/meta-oe/recipes-connectivity/midori/midori.inc index 4c7147e..dccb3ee
> 100644 --- a/meta-oe/recipes-connectivity/midori/midori.inc +++
> b/meta-oe/recipes-connectivity/midori/midori.inc @@ -1,4 +1,5 @@ 
> DESCRIPTION = "Midori is a lightweight web browser." +HOMEPAGE =
> "http://www.twotoasts.de/index.php?/pages/midori_summary.html" LICENSE =
> "LGPLv2.1" LIC_FILES_CHKSUM =
> "file://COPYING;md5=fbc093901857fcd118f065f900982c24"

Missing PR bump

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9lz34ACgkQMkyGM64RGpEHOgCgmul2etT83MmnsD4ni6ran/Ov
xR4AnRzwgCEErm1FotEmwRd4lEui5wNN
=Gdj4
-----END PGP SIGNATURE-----



