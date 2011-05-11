Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1QKHZ2-0005PK-S4
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 May 2011 00:07:28 +0200
Received: by wye20 with SMTP id 20so827204wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 May 2011 15:04:41 -0700 (PDT)
Received: by 10.216.230.213 with SMTP id j63mr991716weq.20.1305151481724;
	Wed, 11 May 2011 15:04:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl [84.80.112.235])
	by mx.google.com with ESMTPS id o6sm375610wbo.3.2011.05.11.15.04.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 11 May 2011 15:04:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1084)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1305145805-14609-4-git-send-email-eric@eukrea.com>
Date: Thu, 12 May 2011 00:04:38 +0200
Message-Id: <FEADF586-6D32-4F4F-9EAE-2B3DF5CF0E00@dominion.thruhere.net>
References: <1305145805-14609-1-git-send-email-eric@eukrea.com>
	<1305145805-14609-4-git-send-email-eric@eukrea.com>
To: =?iso-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
X-Mailer: Apple Mail (2.1084)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 3/6] angstrom-2010: prefer qt 4.7.3
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
X-List-Received-Date: Wed, 11 May 2011 22:07:28 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 11 mei 2011, om 22:30 heeft Eric B=E9nard het volgende geschreven:

> Signed-off-by: Eric B=E9nard <eric@eukrea.com>
> Cc: Koen Kooi <koen@dominion.thruhere.net>

Acked-by: Koen Kooi <koen@dominion.thruhere.net>

> ---
> .../include/angstrom-2010-preferred-versions.inc   |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/conf/distro/include/angstrom-2010-preferred-versions.inc =
b/conf/distro/include/angstrom-2010-preferred-versions.inc
> index 611c4e7..87da854 100644
> --- a/conf/distro/include/angstrom-2010-preferred-versions.inc
> +++ b/conf/distro/include/angstrom-2010-preferred-versions.inc
> @@ -1,5 +1,5 @@
> ANGSTROM_MESA_VERSION =3D "7.9.1"
> -ANGSTROM_QT_VERSION ?=3D "4.7.2"
> +ANGSTROM_QT_VERSION ?=3D "4.7.3"
> ANGSTROM_LIBTOOL_VERSION =3D "2.4"
> # Use new sysroot feature
> LIBTOOL_HAS_SYSROOT =3D "yes"
> --=20
> 1.7.0.4
>=20



