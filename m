Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QOWBG-0003Mb-2l for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 16:32:26 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QOW8K-0006OA-PR for openembedded-devel@lists.openembedded.org;
	Mon, 23 May 2011 16:29:24 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 16:29:24 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 May 2011 16:29:24 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 23 May 2011 16:29:13 +0200
Message-ID: <irdqvp$7b8$1@dough.gmane.org>
References: <cover.1306157341.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1306157341.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/4] Pull request with udev changes from O.S. Systems tree
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
X-List-Received-Date: Mon, 23 May 2011 14:32:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-05-11 15:30, Otavio Salvador wrote:
> The following changes since commit c6b34871dc0fdd3c1e6a24f2a635505deaa28b20:
> 
>   freerdp: fix homepage field (2011-05-21 08:27:10 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe.git master
>   https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (4):
>   udev: fix init script indenting
>   udev: fix action used during startup
>   udev: remove udev.inc since it was not being in use
>   udev: move ConsoleKit files to udev-consolekit

Thanks for the changes, I will push them after some testing.


> 
>  meta-oe/recipes-core/udev/udev.inc    |  101 ---------------------------------
>  meta-oe/recipes-core/udev/udev/init   |   44 +++++++-------
>  meta-oe/recipes-core/udev/udev_168.bb |    9 ++-
>  3 files changed, 29 insertions(+), 125 deletions(-)
>  delete mode 100644 meta-oe/recipes-core/udev/udev.inc
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN2m84MkyGM64RGpERAl3rAJwInyhCcQ7KdkkjPemMCRxranyNmQCePVSJ
EThW8Soef07bvPn1CMaELNM=
=cquM
-----END PGP SIGNATURE-----



