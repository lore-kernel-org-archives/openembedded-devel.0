Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PrBFn-0007XK-Lo for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:31:19 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PrBEb-00047f-NN for openembedded-devel@lists.openembedded.org;
	Sun, 20 Feb 2011 16:30:05 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 16:30:05 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Feb 2011 16:30:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sun, 20 Feb 2011 16:20:22 +0100
Message-ID: <ijrbfm$3gb$2@dough.gmane.org>
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
	<1298214559-9650-2-git-send-email-tom_rini@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <1298214559-9650-2-git-send-email-tom_rini@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH 1/4] angstrom-2008: Pin gvfs at 1.6.6
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
X-List-Received-Date: Sun, 20 Feb 2011 15:31:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 20-02-11 16:09, Tom Rini wrote:
> We're doing this since glib-2.0 is pinned.
> 
> Signed-off-by: Tom Rini <tom_rini@mentor.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
>  .../include/angstrom-2008-preferred-versions.inc   |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
> index 85d9a07..feaa2a7 100644
> --- a/conf/distro/include/angstrom-2008-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
> @@ -19,6 +19,7 @@ PREFERRED_VERSION_gst-pulse 	= "0.9.7"
>  PREFERRED_VERSION_gtk+		= "2.20.1"
>  PREFERRED_VERSION_gtk+-native	= "2.20.1"
>  PREFERRED_VERSION_gtkmm		= "2.20.0"
> +PREFERRED_VERSION_gvfs		= "1.6.6"
>  PREFERRED_VERSION_hal		= "0.5.14"
>  PREFERRED_VERSION_libgemwidget	= "1.0"
>  PREFERRED_VERSION_libgpephone	= "0.4"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNYTE2MkyGM64RGpERAsARAJ9vx5/alDXPAmfMdCTnipv+mTV0vACgpZ9h
LQneVTso2HCGyRI+e5Spdgs=
=awsI
-----END PGP SIGNATURE-----



