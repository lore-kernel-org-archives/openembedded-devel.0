Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PpfuU-00040e-23
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Feb 2011 12:51:06 +0100
Received: by wyb40 with SMTP id 40so1193770wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Feb 2011 03:49:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.216.3.200 with SMTP id 50mr399007weh.34.1297856994688; Wed, 16
	Feb 2011 03:49:54 -0800 (PST)
Received: by 10.216.246.69 with HTTP; Wed, 16 Feb 2011 03:49:54 -0800 (PST)
In-Reply-To: <1297852433-31160-8-git-send-email-eric@eukrea.com>
References: <1297852433-31160-1-git-send-email-eric@eukrea.com>
	<1297852433-31160-8-git-send-email-eric@eukrea.com>
Date: Wed, 16 Feb 2011 12:49:54 +0100
Message-ID: <AANLkTikiF9jz+OcGkDFwh1aNHK=HzhO0=bYMBhka9vxF@mail.gmail.com>
From: Koen Kooi <koen@dominion.thruhere.net>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 08/10] angstrom-2010: prefer busybox-1.18.3
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
X-List-Received-Date: Wed, 16 Feb 2011 11:51:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Acked-by: Koen Kooi <koen@openembedded.org>

I must admit the busybox churn is getting a bit much, how many days till .4=
?

2011/2/16 Eric B=C3=A9nard <eric@eukrea.com>

> this is the latest stable version
>
> Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> Cc: Koen Kooi <koen@openembedded.org>
> ---
>  .../include/angstrom-2010-preferred-versions.inc   |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc
> b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 5532f29..006dc74 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -12,7 +12,7 @@ PREFERRED_VERSION_autoconf =3D "2.65"
>  PREFERRED_VERSION_autoconf-native =3D "2.65"
>  PREFERRED_VERSION_automake =3D "1.11.1"
>  PREFERRED_VERSION_automake-native =3D "1.11.1"
> -PREFERRED_VERSION_busybox      =3D "1.18.2"
> +PREFERRED_VERSION_busybox      =3D "1.18.3"
>  PREFERRED_VERSION_cairo                =3D "1.10.0"
>  PREFERRED_VERSION_dbus                 =3D "1.2.24"
>  PREFERRED_VERSION_dropbear      =3D "0.52"
> --
> 1.7.0.4
>
>

