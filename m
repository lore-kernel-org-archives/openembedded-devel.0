Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 59ADB6A990
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jun 2013 07:01:35 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 9D6674B008E;
	Tue, 11 Jun 2013 09:01:30 +0200 (CEST)
Date: Tue, 11 Jun 2013 09:01:29 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130611090129.6ec799e5@e6520eb>
In-Reply-To: <20130604120343.GE3279@jama>
References: <20130528094347.GG3192@jama>
	<20130604120343.GE3279@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.18; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-efl][dylan][PATCH] 2 backports
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 11 Jun 2013 07:01:37 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Martin,

Le Tue, 4 Jun 2013 14:03:43 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> On Tue, May 28, 2013 at 11:43:47AM +0200, Martin Jansa wrote:
> > Hi Eric,
> >=20
> > please backport 2 commits from meta-efl
> >=20
> > It's minor upgrade (I know we shouldn't backport upgrades, but this=20
> > is from stable bugfix-only branch) and together with following patch
> > fixes evas segfaults).
> >=20
> > commit 8b94591a585e4fb261599a9796f4199d650e24a5
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Wed May 22 13:54:06 2013 +0200
> >=20
> >     evas: Add patch to fix segfaults
> >    =20
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> >=20
> > commit 4514f8ca26dac646e7e26fc1585e70304d9ef8ae
> > Author: Martin Jansa <Martin.Jansa@gmail.com>
> > Date:   Tue May 14 22:20:31 2013 +0200
> >=20
> >     meta-efl: upgrade efl to 1.7.7, e-wm to 0.17.3
> >    =20
> >     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> And one more for meta-oe
>=20
> commit 2cab9ba0d4d72496633b92b67ac1a63f605c5ada
> Author: Martin Jansa <Martin.Jansa@gmail.com>
> Date:   Sat Jun 1 14:59:02 2013 +0200
>=20
>     claws-plugins-*: Update SRC_URI
>    =20
>     * modules are now in one bigger tarball on sourceforge
>       http://sourceforge.net/projects/sylpheed-claws/files/extra%20plugin=
s/
>     * old tarballs are still available in plugins_obsolete directory
>    =20
>     Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>=20
the 3 commits were pushed to dylan-next

thanks
Eric

