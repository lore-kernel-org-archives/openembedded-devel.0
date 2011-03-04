Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1PvSvu-0006Nr-Iy
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 12:12:30 +0100
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 1007D2C81C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:09:35 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x586KNw4WaoV
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:09:31 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id 899FF2C7D7
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  4 Mar 2011 11:09:30 +0000 (UTC)
Message-ID: <4D70C8BB.1020702@gmail.com>
Date: Fri, 04 Mar 2011 12:10:51 +0100
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299103214-30434-1-git-send-email-tom_rini@mentor.com>
	<1299103214-30434-2-git-send-email-tom_rini@mentor.com>
In-Reply-To: <1299103214-30434-2-git-send-email-tom_rini@mentor.com>
Subject: Re: [PATCH 1/3] kaeilos-2009-preferred-versions.inc: Lock policykit
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
X-List-Received-Date: Fri, 04 Mar 2011 11:12:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Tom Rini ha scritto, Il 02/03/2011 23:00:
> glib-2.0 is locked to a version that will not work with policykit
> newer than 0.97.
>=20
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
> ---
>  .../include/kaeilos-2009-preferred-versions.inc    |    2 ++
>  1 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/=
conf/distro/include/kaeilos-2009-preferred-versions.inc
> index 0125724..e1656cf 100644
> --- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
> +++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
> @@ -52,6 +52,8 @@ PREFERRED_VERSION_pango-native     =3D "1.24.4"
>  #PREFERRED_VERSION_pixman	=3D "0.13.2"
>  PREFERRED_VERSION_pkgconfig	=3D "0.23"
>  PREFERRED_VERSION_pkgconfig-native =3D "0.23"
> +PREFERRED_VERSION_policykit     =3D "0.96"
> +PREFERRED_VERSION_policykit-gnome =3D "0.96"
>  PREFERRED_VERSION_pulseaudio 	=3D "0.9.15"
>  PREFERRED_VERSION_python-pycairo =3D "1.8.0"
> =20

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


