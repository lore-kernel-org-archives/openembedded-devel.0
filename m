Received: from smtpfb2-g21.free.fr ([212.27.42.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1UCAP6-0002cN-9H
	for openembedded-devel@lists.openembedded.org;
	Sun, 03 Mar 2013 16:00:46 +0100
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by smtpfb2-g21.free.fr (Postfix) with ESMTP id 8D484D19944
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  3 Mar 2013 15:44:16 +0100 (CET)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 14BECA6248;
	Sun,  3 Mar 2013 15:44:06 +0100 (CET)
Date: Sun, 3 Mar 2013 15:44:05 +0100
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130303154405.3f877ded@e6520eb>
In-Reply-To: <cover.1362053615.git.Martin.Jansa@gmail.com>
References: <cover.1362053615.git.Martin.Jansa@gmail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.13; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH][for-danny 0/3] backport meta-ruby
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
X-List-Received-Date: Sun, 03 Mar 2013 15:00:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Thu, 28 Feb 2013 13:20:06 +0100,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> I know that adding new layer is not typical "backport", but we need ruby=
=20
> in danny and IIRC Koen also needs.
>=20
> Also because it's separate layer, there is no danger to users which don't=
=20
> need or use it.
>=20
> The following changes since commit c02834a7cc5fda525c7ebeec545625233bab4c=
b5:
>=20
>   xf86-video-geode: Update to 2.11.14 (2013-02-15 12:16:55 +0100)
>=20
> are available in the git repository at:
>=20
>   git://git.openembedded.org/meta-openembedded-contrib jansa/for-danny3
>   http://cgit.openembedded.org/cgit.cgi/meta-openembedded-contrib/log/?h=
=3Djansa/for-danny3
>=20
pushed to danny-next.

Thanks
Eric


