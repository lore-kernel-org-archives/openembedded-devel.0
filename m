Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRtXA-0001uV-Td for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 00:05:01 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QRtU8-0000qF-55 for openembedded-devel@lists.openembedded.org;
	Thu, 02 Jun 2011 00:01:52 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 00:01:52 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jun 2011 00:01:52 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 02 Jun 2011 00:01:39 +0200
Message-ID: <is6cs3$u7r$1@dough.gmane.org>
References: <cover.1306959338.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1306959338.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/5] Pending patches on O.S. Systems tree
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
X-List-Received-Date: Wed, 01 Jun 2011 22:05:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'll push these if the test builds succeed. Tomorrow is a national
holiday over here, so it might take till the TSC meeting before it
actually gets out.

On 01-06-11 22:16, Otavio Salvador wrote:
> The following changes since commit 7da05acc4665dcfcd008e6ce698169b8e9503b33:
> 
>   udev-extra-rules: remove modprobe rule, it has moved back to udev (2011-05-31 20:37:45 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe master
>   https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (5):
>   inih: bump SRCREV
>   freerdp: bump SRCREV to 20110530 snapshot
>   udev-extra-rules: refactor mount.sh script
>   ccid: add 1.4.4 version recipe
>   pcsc-lite: rdepends on ccid and drop init script
> 
>  meta-oe/recipes-core/udev/udev-extra-rules.bb      |    2 +-
>  .../recipes-core/udev/udev-extra-rules/mount.sh    |   28 +++++++------------
>  meta-oe/recipes-support/ccid/ccid_1.4.4.bb         |   18 ++++++++++++
>  meta-oe/recipes-support/freerdp/freerdp_git.bb     |    4 +-
>  meta-oe/recipes-support/inih/libinih_git.bb        |    4 +-
>  .../recipes-support/pcsc-lite/pcsc-lite_1.7.2.bb   |   15 ++--------
>  6 files changed, 36 insertions(+), 35 deletions(-)
>  create mode 100644 meta-oe/recipes-support/ccid/ccid_1.4.4.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN5rbDMkyGM64RGpERAi2eAJ9RT1yCnJB73pPWeniDwPPpEyI+ZgCfePsh
ug+ynDRgA+IKa9UIDB1Gmio=
=J7Fo
-----END PGP SIGNATURE-----



