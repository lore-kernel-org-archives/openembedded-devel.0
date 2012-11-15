Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYuEo-0008Fi-Us for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 08:51:51 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYu1U-0002SD-4e for openembedded-devel@lists.openembedded.org;
	Thu, 15 Nov 2012 08:38:04 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2012 08:38:04 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Nov 2012 08:38:04 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 15 Nov 2012 08:37:47 +0100
Message-ID: <k82646$lqg$1@ger.gmane.org>
References: <1352947199-10649-1-git-send-email-b40290@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1352947199-10649-1-git-send-email-b40290@freescale.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe v3 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Thu, 15 Nov 2012 07:51:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1


> --- a/meta-oe/recipes-connectivity/inetutils/inetutils_1.8.bb +++
> b/meta-oe/recipes-connectivity/inetutils/inetutils_1.9.1.bb @@ -6,21
> +6,17 @@ SECTION = "libs" DEPENDS = "ncurses" LICENSE = "GPLv3"
> 
> -LIC_FILES_CHKSUM =
> "file://COPYING;md5=adefda309052235aa5d1e99ce7557010" +LIC_FILES_CHKSUM =
> "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7"

What changed in the license?

> + +PR = "r0"

THat's the default, drop that.

Should this also be moved to meta-networking?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQpJvLMkyGM64RGpERApvkAJ9MAyhstIG9GZyYZaovoRq1o+SFogCgvC+c
IvCRM7oT6IfaC5BsAe6ZOC4=
=ZWBQ
-----END PGP SIGNATURE-----



