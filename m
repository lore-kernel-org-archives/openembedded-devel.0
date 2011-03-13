Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Pykop-0008Gj-AS for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 13:54:47 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PyknF-0003hq-FG for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 13:53:09 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:53:09 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 13:53:09 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 13 Mar 2011 13:52:58 +0100
Message-ID: <iliena$dgk$1@dough.gmane.org>
References: <ileat6$gdk$2@dough.gmane.org>
	<1299887126-24886-1-git-send-email-eric@eukrea.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1299887126-24886-1-git-send-email-eric@eukrea.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] angstrom-20101: prefer qt 4.7.2
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
X-List-Received-Date: Sun, 13 Mar 2011 12:54:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-03-11 00:45, Eric Bénard wrote:
> Signed-off-by: Eric Bénard <eric@eukrea.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 7a19f2d..2ec92ec 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -1,5 +1,5 @@
>  ANGSTROM_MESA_VERSION = "7.9.1"
> -ANGSTROM_QT_VERSION ?= "4.7.1"
> +ANGSTROM_QT_VERSION ?= "4.7.2"
>  ANGSTROM_LIBTOOL_VERSION = "2.4"
>  # Use new sysroot feature
>  LIBTOOL_HAS_SYSROOT = "yes"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNfL4qMkyGM64RGpERAlc2AKCGX8BXp4dpp5gTqpctxpV2fyIgMQCfXwv4
Fp1tLprleeCzgnfxVpC/3mA=
=1CX/
-----END PGP SIGNATURE-----



