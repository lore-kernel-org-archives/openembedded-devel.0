Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNfj9-0001YX-Kn for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 08:31:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QNfgJ-0005Jv-N6 for openembedded-devel@lists.openembedded.org;
	Sat, 21 May 2011 08:28:59 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2011 08:28:59 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 May 2011 08:28:59 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 21 May 2011 08:28:42 +0200
Message-ID: <ir7m2q$k18$1@dough.gmane.org>
References: <cover.1305917406.git.otavio@ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <cover.1305917406.git.otavio@ossystems.com.br>
X-Enigmail-Version: 1.0.1
Subject: Re: [meta-oe][PATCH 0/3] Pull request from O.S. Systems tree
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
X-List-Received-Date: Sat, 21 May 2011 06:31:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-05-11 21:23, Otavio Salvador wrote:
> The following changes since commit 5d96769da5d7acdd700f6f1a45f417e840e5a7d8:
> 
>   uclibc: Rename uclibc-libargp -> uclibc-argp and uclibc-libbacktrace -> uclibc-backtrace (2011-05-20 09:08:09 +0200)
> 
> are available in the git repository at:
>   git://github.com/OSSystems/meta-oe.git master
>   https://github.com/OSSystems/meta-oe/tree/master
> 
> Otavio Salvador (3):
>   xorg-xserver/xorg-xserver-common.inc: do not install modules' .la
>     files
>   freerdp-extension-xpunlimited: add git version
>   freerdp: fix homepage field

Thanks, applied

> 
>  .../xorg-xserver/xorg-xserver-common.inc           |    4 +-
>  .../freerdp/freerdp-extension-xpunlimited_git.bb   |   23 ++++++++++++++++++++
>  meta-oe/recipes-support/freerdp/freerdp.inc        |    2 +-
>  3 files changed, 26 insertions(+), 3 deletions(-)
>  create mode 100644 meta-oe/recipes-support/freerdp/freerdp-extension-xpunlimited_git.bb
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN11uaMkyGM64RGpERAgxWAKCbyjSHGrIz2dBRDspG4daRTeW6RwCfQapF
HfexCieUv50c1L+DXBdtmkw=
=i8FC
-----END PGP SIGNATURE-----



