Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PypKu-0006OL-0q
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 18:44:12 +0100
Received: by wyb40 with SMTP id 40so3632487wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 10:42:29 -0700 (PDT)
Received: by 10.216.58.207 with SMTP id q57mr8499853wec.63.1300038148839;
	Sun, 13 Mar 2011 10:42:28 -0700 (PDT)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id j49sm3374693wer.14.2011.03.13.10.42.27
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 13 Mar 2011 10:42:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1300035425-15984-2-git-send-email-eric@eukrea.com>
Date: Sun, 13 Mar 2011 18:42:26 +0100
Message-Id: <6B9E3B38-06CC-4BFB-8EDD-71E0330A4241@dominion.thruhere.net>
References: <1300035425-15984-1-git-send-email-eric@eukrea.com>
	<1300035425-15984-2-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] angstrom-2010: use busybox 1.18.4
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
X-List-Received-Date: Sun, 13 Mar 2011 17:44:12 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 13 mrt 2011, om 17:57 heeft Eric B=E9nard het volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>


> Cc: Koen Kooi <koen@dominion.thruhere.net>
> ---
> .../include/angstrom-2010-preferred-versions.inc   |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc =
b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 2ec92ec..46fc765 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -12,7 +12,7 @@ PREFERRED_VERSION_autoconf =3D "2.65"
> PREFERRED_VERSION_autoconf-native =3D "2.65"
> PREFERRED_VERSION_automake =3D "1.11.1"
> PREFERRED_VERSION_automake-native =3D "1.11.1"
> -PREFERRED_VERSION_busybox 	=3D "1.18.3"
> +PREFERRED_VERSION_busybox 	=3D "1.18.4"
> PREFERRED_VERSION_cairo		=3D "1.10.0"
> PREFERRED_VERSION_dbus 		=3D "1.2.24"
> PREFERRED_VERSION_dropbear      =3D "0.52"
> --=20
> 1.7.0.4
>=20



