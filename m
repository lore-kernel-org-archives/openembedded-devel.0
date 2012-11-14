Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYb6t-0001U1-Aq for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 12:26:24 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYatV-0005E3-Jj for openembedded-devel@lists.openembedded.org;
	Wed, 14 Nov 2012 12:12:33 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2012 12:12:33 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Nov 2012 12:12:33 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Wed, 14 Nov 2012 12:12:15 +0100
Message-ID: <k7vuac$qmu$1@ger.gmane.org>
References: <1352858852-5484-1-git-send-email-b40290@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1352858852-5484-1-git-send-email-b40290@freescale.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe v2 ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Wed, 14 Nov 2012 11:26:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 14-11-12 03:07, Chunrong Guo schreef:
> Signed-off-by: Chunrong Guo <b40290@freescale.com> --- 
> .../inetutils/inetutils-1.8/fix-disable-ipv6.patch |   58 ----------- 
> ...tf-parse-pull-in-features.h-for-__GLIBC__.patch |   27 ----- 
> ...rgp-fix-program_invocation_name-detection.patch |   51 --------- 
> .../inetutils-1.8/inetutils-1.8-0003-wchar.patch   |   12 -- 
> ...me-ruserpass-to-avoid-C-library-collision.patch |   58 ----------- 
> ...detect-__rcmd_errstr-support-in-the-C-lib.patch |   57 ---------- 
> ...e-daemon-from-the-C-library-when-possible.patch |   42 -------- 
> .../inetutils-1.8-1004-detect-fork-support.patch   |   54 ---------- 
> ...-1.8-1005-ftpd-add-daemon-D-nommu-support.patch |  109
> -------------------- .../disable-pre-ANSI-compilers.patch               |
> 11 ++ .../inetutils/inetutils-1.9.1/remove-gets.patch    |   16 +++ 
> .../inetutils/inetutils-1.9.1/version.patch        |   12 ++ 
> .../inetutils/inetutils_1.8.bb                     |   65 ------------ 
> .../inetutils/inetutils_1.9.1.bb                   |   61 +++++++++++

Can you resend it as v3 with -M --find-copies-harder please?

> +LIC_FILES_CHKSUM =
> "file://COPYING;md5=0c7051aef9219dc7237f206c5c4179a7" + +PR = "r1"

Why does the new recipe start at r1?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQo3yPMkyGM64RGpERAgQVAJ0ZAlCicMWOILHHcClTMwD2FcEnQQCfdO3s
eSJvnDDjOmoDL0+KaY1WWB8=
=6sMi
-----END PGP SIGNATURE-----



