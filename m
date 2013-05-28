Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 492816A4D1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:51:02 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id F36964B00BF;
	Tue, 28 May 2013 10:50:57 +0200 (CEST)
Date: Tue, 28 May 2013 10:50:56 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528105056.62ea3b76@e6520eb>
In-Reply-To: <20130528084655.GB3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
	<20130528084655.GB3192@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
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
X-List-Received-Date: Tue, 28 May 2013 08:51:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Tue, 28 May 2013 10:46:55 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :
> > +# if you want to enable tslib in your .bbappend, don't forget to add t=
slib dependencies
> > +# TSLIB_DEPENDS =3D "tslib"
> > +# QT_TSLIB =3D "-tslib"
>=20
> I've added
> TSLIB_DEPENDS ?=3D ""
> here, otherwise it's uninitialized for DEPENDS.
>=20
true do you want a v2 ?

Eric

