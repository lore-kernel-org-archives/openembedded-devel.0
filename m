Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PekCV-0004WL-Ec
	for openembedded-devel@lists.openembedded.org;
	Mon, 17 Jan 2011 09:12:31 +0100
Received: by wwi18 with SMTP id 18so1845855wwi.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Jan 2011 00:11:52 -0800 (PST)
Received: by 10.216.17.3 with SMTP id i3mr1926284wei.80.1295251912707;
	Mon, 17 Jan 2011 00:11:52 -0800 (PST)
Received: from [172.20.1.5] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id
	j49sm2211072wer.14.2011.01.17.00.11.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 17 Jan 2011 00:11:52 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1295215324-10460-3-git-send-email-eric@eukrea.com>
Date: Mon, 17 Jan 2011 09:11:51 +0100
Message-Id: <278C6F3F-1A52-483E-A013-7449E4422E95@dominion.thruhere.net>
References: <1295215324-10460-1-git-send-email-eric@eukrea.com>
	<1295215324-10460-2-git-send-email-eric@eukrea.com>
	<1295215324-10460-3-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 3/4] angstrom-2010: prefer busybox 1.18.2
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
X-List-Received-Date: Mon, 17 Jan 2011 08:12:31 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 jan 2011, om 23:02 heeft Eric B=E9nard het volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Cc: Koen Kooi <koen@openembedded.org>

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> .../include/angstrom-2010-preferred-versions.inc   |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc =
b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index cc910c2..5532f29 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -12,7 +12,7 @@ PREFERRED_VERSION_autoconf =3D "2.65"
> PREFERRED_VERSION_autoconf-native =3D "2.65"
> PREFERRED_VERSION_automake =3D "1.11.1"
> PREFERRED_VERSION_automake-native =3D "1.11.1"
> -PREFERRED_VERSION_busybox 	=3D "1.18.1"
> +PREFERRED_VERSION_busybox 	=3D "1.18.2"
> PREFERRED_VERSION_cairo		=3D "1.10.0"
> PREFERRED_VERSION_dbus 		=3D "1.2.24"
> PREFERRED_VERSION_dropbear      =3D "0.52"
> --=20
> 1.6.3.3
>=20



