Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 7903C6A428
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 10:47:25 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 392C64B0152;
	Tue, 28 May 2013 12:47:20 +0200 (CEST)
Date: Tue, 28 May 2013 12:47:19 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130528124719.218baddb@e6520eb>
In-Reply-To: <20130528095926.GH3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
	<20130528084655.GB3192@jama> <20130528105056.62ea3b76@e6520eb>
	<20130528092518.GE3192@jama> <20130528112724.32aa801d@e6520eb>
	<20130528093013.GF3192@jama> <20130528113313.39eb5f68@e6520eb>
	<20130528095926.GH3192@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 8/8] qtbase: add option to enable tslib support
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
X-List-Received-Date: Tue, 28 May 2013 10:47:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 28 May 2013 11:59:26 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> On Tue, May 28, 2013 at 11:33:13AM +0200, Eric B=C3=A9nard wrote:
> > Le Tue, 28 May 2013 11:30:13 +0200,
> > Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :
> >=20
> > > On Tue, May 28, 2013 at 11:27:24AM +0200, Eric B=C3=A9nard wrote:
> > > > Le Tue, 28 May 2013 11:25:18 +0200,
> > > > Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :
> > > > > On Tue, May 28, 2013 at 10:50:56AM +0200, Eric B=C3=A9nard wrote:
> > > > > > true do you want a v2 ?
> > > > >=20
> > > > > No, I've already added it and merged it :)
> > > > >=20
> > > > perfect.
> > > >=20
> > > > > Normally I would take longer for testing it, but I know about oth=
er
> > > > > people starting to work on 5.0.2 so I wanted them to start with y=
our
> > > > > fixes included.
> > > > >=20
> > > > FWIW all my tests were done with you patch
> > > > e7a477a171bf0560939196eb7ebe8e0b05061072 applied so maybe it's
> > > > interesting to also apply it.
> > >=20
> > > But that will require to abandon 5.0.0 and 5.0.1, well I can at least
> > > update that pull request to remove 5.0.0 and 5.0.1 together with this
> > > SRCREV bump.
> > >=20
> > maybe you can create a dylan branch with 5.0.0 and 5.0.1 and switch
> > master to 5.0.2 ?
>=20
> Sounds good, will do
>=20
> Btw is this patch backport of
> commit bb4e2e4faf76d4b2992231891a9d640cfdac5196
> Author: Michael Brasser <michael.brasser@live.com>
> Date:   Tue Mar 26 09:22:51 2013 -0500
>=20
>     Allow tslib to be specified at configure time.
> ?
>=20
> I'm forward porting patches needed for qtbase_git and this one seems to
> be resolved in upstream.
>=20
no that was not a backport else I would have made a patch of this
commit if I had seen it ...

Eric

