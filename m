Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1PhlfQ-0001DK-Kr
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Jan 2011 17:22:52 +0100
Received: by ewy28 with SMTP id 28so2539669ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 25 Jan 2011 08:22:04 -0800 (PST)
Received: by 10.216.23.18 with SMTP id u18mr3705904weu.92.1295972523811;
	Tue, 25 Jan 2011 08:22:03 -0800 (PST)
Received: from [172.20.0.255] (ip545070eb.adsl-surfen.hetnet.nl
	[84.80.112.235])
	by mx.google.com with ESMTPS id b30sm7248270wen.25.2011.01.25.08.22.02
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 25 Jan 2011 08:22:03 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1082)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <c47809e46ea6a0fa950c961b01213171d4bea774.1295971903.git.vjaquez@igalia.com>
Date: Tue, 25 Jan 2011 17:22:02 +0100
Message-Id: <3C013E58-48F7-4C36-B59C-FF26B4F053E8@dominion.thruhere.net>
References: <cover.1295971903.git.vjaquez@igalia.com>
	<c47809e46ea6a0fa950c961b01213171d4bea774.1295971903.git.vjaquez@igalia.com>
To: =?iso-8859-1?Q?V=EDctor_Manuel_J=E1quez_Leal?= <vjaquez@igalia.com>
X-Mailer: Apple Mail (2.1082)
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCHv2 2/2] python-scons_1.3.0: fix licence type
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
X-List-Received-Date: Tue, 25 Jan 2011 16:22:52 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 25 jan 2011, om 17:16 heeft V=EDctor Manuel J=E1quez Leal het =
volgende geschreven:

> According to the wiki [1], the licence of the project [2] is MIT, not =
GPL.
>=20
> 1. =
http://www.scons.org/wiki/FrequentlyAskedQuestions#head-4fe23271137d5e5e95=
370a1360909ca303157c0d
> 2. =
http://scons.tigris.org/source/browse/scons/trunk/LICENSE?revision=3D557&v=
iew=3Dmarkup

Missing sign-off?

Acked-by: Koen Kooi <koen@openembedded.org>

> ---
> recipes/python/python-scons_1.3.0.bb |    2 +-
> 1 files changed, 1 insertions(+), 1 deletions(-)
>=20
> diff --git a/recipes/python/python-scons_1.3.0.bb =
b/recipes/python/python-scons_1.3.0.bb
> index a0690d1..82231f2 100644
> --- a/recipes/python/python-scons_1.3.0.bb
> +++ b/recipes/python/python-scons_1.3.0.bb
> @@ -1,7 +1,7 @@
> DESCRIPTION =3D "A Software Construction Tool"
> SECTION =3D "devel/python"
> PRIORITY =3D "optional"
> -LICENSE =3D "GPL"
> +LICENSE =3D "MIT"
> SRCNAME =3D "scons"
> PR =3D "r1"
>=20
> --=20
> 1.7.2.3
>=20



