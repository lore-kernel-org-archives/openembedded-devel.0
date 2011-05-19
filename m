Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QN8kJ-0007ID-KY for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 21:18:55 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QN8hS-0000WD-9K for openembedded-devel@lists.openembedded.org;
	Thu, 19 May 2011 21:15:58 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 21:15:58 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 May 2011 21:15:58 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Thu, 19 May 2011 21:15:43 +0200
Message-ID: <ir3q8v$eqc$1@dough.gmane.org>
References: <1305290080.2448.3.camel@gnutoo-laptop>
	<1305290588-7057-5-git-send-email-GNUtoo@no-log.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1305290588-7057-5-git-send-email-GNUtoo@no-log.org>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 05/12] angstrom-2010-preferred-versions.inc: remove xserver-common prefered version
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
X-List-Received-Date: Thu, 19 May 2011 19:18:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 13-05-11 14:43, Denis 'GNUtoo' Carikli wrote:
> Without that fix Angstrom keep choosing xserver-common 1.33 instead of the 1.34 version
> 
> Signed-off-by: Denis 'GNUtoo' Carikli <GNUtoo@no-log.org>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    1 -
>  1 files changed, 0 insertions(+), 1 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 611c4e7..8d4c8ef 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -71,7 +71,6 @@ UDEV_GE_141 = "1"
>  PREFERRED_VERSION_usbutils = "0.86"
>  PREFERRED_VERSION_wpa-supplicant = "0.7.3"
>  PREFERRED_VERSION_wget = "1.11.4"
> -PREFERRED_VERSION_xserver-common = "1.33"
>  PREFERRED_VERSION_xserver-kdrive = "1.4.0.90"
>  
>  #

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFN1WxfMkyGM64RGpERAoC3AJ9ClB7ncb3A/E0qtLWXFVBlWJ4cZgCgpYph
p5/R5/DZGEqYCfUt5BFj9pw=
=+mNZ
-----END PGP SIGNATURE-----



