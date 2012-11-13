Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYFIH-0005vY-TJ for openembedded-devel@lists.openembedded.org;
	Tue, 13 Nov 2012 13:08:41 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TYF50-0000gN-LK for openembedded-devel@lists.openembedded.org;
	Tue, 13 Nov 2012 12:54:58 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2012 12:54:58 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Nov 2012 12:54:58 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 13 Nov 2012 12:54:43 +0100
Message-ID: <k7tcdu$djv$1@ger.gmane.org>
References: <1352716647-8613-1-git-send-email-b40290@freescale.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
In-Reply-To: <1352716647-8613-1-git-send-email-b40290@freescale.com>
X-Enigmail-Version: 1.4.4
Subject: Re: [meta-oe ] inetutils : Update to 1.9.1
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
X-List-Received-Date: Tue, 13 Nov 2012 12:08:42 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 12-11-12 11:37, Chunrong Guo schreef:
> Signed-off-by: Chunrong Guo <b40290@freescale.com> --- 
> .../disable-pre-ANSI-compilers.patch               |   11 ++++ 
> .../inetutils/inetutils-1.9.1/remove-gets.patch    |   16 +++++ 
> .../inetutils/inetutils-1.9.1/version.patch        |   12 ++++ 
> .../inetutils/inetutils_1.9.1.bb                   |   61
> ++++++++++++++++++++ 4 files changed, 100 insertions(+), 0 deletions(-)

When updating please delete the old version as well or explain in the commit
message why the old version needs to be preserved.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQojUDMkyGM64RGpERAk03AJ41V0Hl0cJaGoEV9ooeoTxtR1wFxgCfXy+A
WYoWb+MEpkCNU0pEN6xZ6j0=
=Ag8+
-----END PGP SIGNATURE-----



