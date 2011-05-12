Received: from li19-45.members.linode.com ([64.22.125.45] helo=wiki.koala.it)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1QKRNF-0007YC-T3
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 10:35:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by wiki.koala.it (Postfix) with ESMTP id 782962C823
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:22:52 +0000 (UTC)
Received: from wiki.koala.it ([127.0.0.1])
	by localhost (wiki.koala.it [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIH1ZDyJ8zTq
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:22:46 +0000 (UTC)
Received: from [192.168.0.5] (host56-7-static.30-87-b.business.telecomitalia.it
	[87.30.7.56]) by wiki.koala.it (Postfix) with ESMTPSA id ED71A2C7DB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 May 2011 08:22:45 +0000 (UTC)
Message-ID: <4DCB98F0.6020009@gmail.com>
Date: Thu, 12 May 2011 10:23:12 +0200
From: Marco Cavallini <koansoftware@gmail.com>
Organization: Marco Cavallini
User-Agent: Thunderbird 2.0.0.24 (X11/20101027)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-5-git-send-email-eric@eukrea.com>
In-Reply-To: <1305145805-14609-5-git-send-email-eric@eukrea.com>
Subject: Re: [PATCH 4/6] kaeilos-2009: prefer qt 4.7.3
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
X-List-Received-Date: Thu, 12 May 2011 08:35:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Eric B=C3=A9nard ha scritto, Il 11/05/2011 22:30:
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Cc: Marco Cavallini <m.cavallini@koansoftware.com>
> ---
>  .../include/kaeilos-2009-preferred-versions.inc    |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/kaeilos-2009-preferred-versions.inc b/=
conf/distro/include/kaeilos-2009-preferred-versions.inc
> index 498f5fb..27c78d6 100644
> --- a/conf/distro/include/kaeilos-2009-preferred-versions.inc
> +++ b/conf/distro/include/kaeilos-2009-preferred-versions.inc
> @@ -61,7 +61,7 @@ PREFERRED_VERSION_python-pycairo =3D "1.8.0"
>  KAEILOS_WX_VERSION ?=3D "2.8.10"
>  PREFERRED_VERSION_wxwidgets =3D "${KAEILOS_WX_VERSION}"
> =20
> -KAEILOS_QT_VERSION ?=3D "4.7.2"
> +KAEILOS_QT_VERSION ?=3D "4.7.3"
>  PREFERRED_VERSION_qt4-tools-native =3D "${KAEILOS_QT_VERSION}"
>  PREFERRED_VERSION_qt4-tools-sdk =3D "${KAEILOS_QT_VERSION}"
>  PREFERRED_VERSION_qt4-embedded =3D "${KAEILOS_QT_VERSION}"


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


