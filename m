Received: from smtpfb1-g21.free.fr ([212.27.42.9])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1U7hJV-0007Ks-WF
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Feb 2013 08:08:46 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb1-g21.free.fr (Postfix) with ESMTP id DD86A79435D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2013 07:52:21 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id E2D02A60E8;
	Tue, 19 Feb 2013 07:52:14 +0100 (CET)
Date: Tue, 19 Feb 2013 07:52:13 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130219075213.0e2ff123@e6520eb>
In-Reply-To: <cover.1361235235.git.Martin.Jansa@gmail.com>
References: <cover.1361235235.git.Martin.Jansa@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: martin.jansa@gmail.com
Subject: Re: [PATCH][for-danny 0/2] ca-certificates, e-wm
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
X-List-Received-Date: Tue, 19 Feb 2013 07:08:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Tue, 19 Feb 2013 02:08:41 +0100,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> e-wm change is not in master, because it was resolved in newer e-wm relea=
se
>=20
> ca-certificates is upgraded even with old sources now available on source=
s.oe.org,=20
> to remove turktrust certificates:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D697366
>=20
> The following changes since commit c02834a7cc5fda525c7ebeec545625233bab4c=
b5:
>=20
>   xf86-video-geode: Update to 2.11.14 (2013-02-15 12:16:55 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny2
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/for-danny2
>=20
> Lukas M=C3=A4rdian (1):
>   meta-efl: include illume home button fix
>=20
> Martin Jansa (1):
>   ca-certificates: upgrade to 20130119
>=20
>  .../e17/e-wm/Fix-Illume-Home-Button.diff           | 166 +++++++++++++++=
++++++
>  meta-efl/recipes-efl/e17/e-wm_svn.bb               |   3 +-
>  ...tes_20120623.bb =3D> ca-certificates_20130119.bb} |   4 +-
>  3 files changed, 170 insertions(+), 3 deletions(-)
>  create mode 100644 meta-efl/recipes-efl/e17/e-wm/Fix-Illume-Home-Button.=
diff
>  rename meta-oe/recipes-support/ca-certificates/{ca-certificates_20120623=
.bb =3D> ca-certificates_20130119.bb} (89%)
>=20
pushed to danny-next.

Thanks,
Eric


