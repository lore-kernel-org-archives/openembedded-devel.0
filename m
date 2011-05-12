Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QKRN7-0007Tx-Jj
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:35:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 924622C835
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:23:37 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VS1M9Z5dXQq
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:23:30 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 65C582C7DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:23:29 +0000 (UTC)
Message-ID: <4DCB991B.70202@gmail.com>
Date: Thu, 12 May 2011 10:23:55 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1298214559-9650-1-git-send-email-tom_rini@mentor.com>
	<1298214559-9650-3-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1298214559-9650-3-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH 2/4] kaeilos 2009: Pin gvfs to 1.6.6
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
X-List-Received-Date: Thu, 12 May 2011 08:35:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tom Rini ha scritto, Il 20/02/2011 16:09:
> We're doing this since glib-2.0 is pinned.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../include/kaeilos-2009-preferred-versions.inc    |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/=
conf/distro/include/kaeilos-2009-preferred-versions.inc
> index cf0f65d..0125724 100644
> --- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
> +++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
> @@ -26,6 +26,7 @@ PREFERRED_VERSION_gst-pulse 	=3D "0.9.7"
>  PREFERRED_VERSION_gtk+		=3D "2.20.1"
>  PREFERRED_VERSION_gtk+-native	=3D "2.20.1"
>  PREFERRED_VERSION_gtkmm		=3D "2.20.0"
> +PREFERRED_VERSION_gvfs		=3D "1.6.6"
>  PREFERRED_VERSION_hal		=3D "0.5.14"
>  PREFERRED_VERSION_libgemwidget	=3D "1.0"
>  PREFERRED_VERSION_libgpephone	=3D "0.4"


Acked-by: Marco Cavallini <m.cavallini@koansoftware.com>


Thank you

Cordiali Saluti / Kindest Regards / mit freundlichen Gr=C3=BCssen
--
Marco Cavallini | KOAN sas | Bergamo - Italia
 embedded and real-time software engineering
   Atmel third party certified consultant
Phone:+39-035-255.235 - Fax:+39-178-22.39.748
      http://www.KoanSoftware.com
        http://www.KaeilOS.com


