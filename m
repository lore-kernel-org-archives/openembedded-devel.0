Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcID0-0008KV-FJ for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 14:54:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PcICU-0005WW-Hg for openembedded-devel@lists.openembedded.org;
	Mon, 10 Jan 2011 14:54:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 14:54:22 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 10 Jan 2011 14:54:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Mon, 10 Jan 2011 14:54:09 +0100
Message-ID: <igf321$ujo$1@dough.gmane.org>
References: <1294653360-27612-1-git-send-email-Martin.Jansa@gmail.com>
	<1294653360-27612-3-git-send-email-Martin.Jansa@gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1294653360-27612-3-git-send-email-Martin.Jansa@gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 3/6] angstrom-2010: prefer newer mesa 7.9.1
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
X-List-Received-Date: Mon, 10 Jan 2011 13:54:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 10-01-11 10:55, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index a36cb21..7fc8df1 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -1,4 +1,4 @@
> -ANGSTROM_MESA_VERSION = "7.8.2"
> +ANGSTROM_MESA_VERSION = "7.9.1"
>  ANGSTROM_QT_VERSION ?= "4.7.1"
>  ANGSTROM_LIBTOOL_VERSION = "2.4"
>  # Use new sysroot feature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNKw+BMkyGM64RGpERAnx6AJ4m+zfiB3WNOMiuMQEurqzMNELd4gCdH8MN
NU9OS/wz2ycDfj2MfuyHuuQ=
=HEp/
-----END PGP SIGNATURE-----



