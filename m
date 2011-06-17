Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QXf6x-0002MH-SC
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Jun 2011 21:53:47 +0200
Received: by wyb34 with SMTP id 34so144982wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Jun 2011 12:50:19 -0700 (PDT)
Received: by 10.227.207.196 with SMTP id fz4mr2546703wbb.42.1308340218758;
	Fri, 17 Jun 2011 12:50:18 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id ex2sm1201936wbb.31.2011.06.17.12.50.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Jun 2011 12:50:17 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1308338871-31968-2-git-send-email-eric@eukrea.com>
Date: Fri, 17 Jun 2011 21:50:15 +0200
Message-Id: <F6D910E1-5B2A-492E-AB88-223BE090C6D2@dominion.thruhere.net>
References: <1308338871-31968-1-git-send-email-eric@eukrea.com>
	<1308338871-31968-2-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 2/4] angstrom-2010: prefer busybox 1.18.5
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
X-List-Received-Date: Fri, 17 Jun 2011 19:53:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 17 jun 2011, om 21:27 heeft Eric B=E9nard het volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Koen Kooi <koen@dominion.thruhere.net

> ---
> .../include/angstrom-2010-preferred-versions.inc   |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc =
b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 7a59df9..8ce3ee7 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -13,7 +13,7 @@ PREFERRED_VERSION_autoconf-native =3D "2.65"
> PREFERRED_VERSION_automake =3D "1.11.1"
> PREFERRED_VERSION_automake-native =3D "1.11.1"
> PREFERRED_VERSION_avahi		=3D "0.6.30"
> -PREFERRED_VERSION_busybox 	=3D "1.18.4"
> +PREFERRED_VERSION_busybox 	=3D "1.18.5"
> PREFERRED_VERSION_cairo		=3D "1.10.0"
> PREFERRED_VERSION_dbus 		=3D "1.4.1"
> PREFERRED_VERSION_dropbear      =3D "0.52"
> --=20
> 1.7.0.4
>=20



