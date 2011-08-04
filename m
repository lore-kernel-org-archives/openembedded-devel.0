Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoyOY-00019Y-9f for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 15:55:30 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QoyKK-0005zw-T5 for openembedded-devel@lists.openembedded.org;
	Thu, 04 Aug 2011 15:51:08 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:51:08 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Aug 2011 15:51:08 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 04 Aug 2011 15:50:55 +0200
Message-ID: <j1e83v$73t$1@dough.gmane.org>
References: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:5.0) Gecko/20110624 Thunderbird/5.0
In-Reply-To: <1312464763-4063-1-git-send-email-kg4ysn@gmail.com>
X-Enigmail-Version: 1.2
Subject: Re: [PATCH] ptpd: added recipe for v1.1.0.
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
X-List-Received-Date: Thu, 04 Aug 2011 13:55:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 04-08-11 15:32, Chris Verges schreef:
> Signed-off-by: Chris Verges <kg4ysn@gmail.com> --- meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb |   19 +++++++++++++++++++

You're missing the 'meta-oe' tag in subject

> 1 files changed, 19 insertions(+), 0 deletions(-) create mode 100644 meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb
> 
> diff --git a/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb new file mode 100644 index 0000000..87e0a69 --- /dev/null +++ b/meta-oe/recipes-connectivity/ptpd/ptpd_1.1.0.bb @@ -0,0 +1,19 @@ +DESCRIPTION = "Precision Time Protocol (PTP) as defined
> by the IEEE 1588 standard" +HOMEPAGE = "http://sourceforge.net/projects/ptpd" +LICENSE = "BSD" +SECTION = "network" +PR = "r1"

Does this actually build with LIC_FILES_CHKSUM lacking?

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFOOqO/MkyGM64RGpERAjW4AJ9kB3Sw+fIGkSLAOxJMPokWzt6VPgCgsLSh
Qi0j8GjGior8CwyQlKFlEGM=
=9dYd
-----END PGP SIGNATURE-----



