Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 937276A4F4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:51:33 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id 46F3D4B0072;
	Tue, 28 May 2013 10:51:29 +0200 (CEST)
Date: Tue, 28 May 2013 10:51:27 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: Martin Jansa <martin.jansa@gmail.com>
Message-ID: <20130528105127.74fe9b06@e6520eb>
In-Reply-To: <20130524105959.GT32431@jama>
References: <1369388677-15423-1-git-send-email-eric@eukrea.com>
	<20130524105959.GT32431@jama>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][PATCH 1/2] qtjsbackend: fix hardfloat detection in v8
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
X-List-Received-Date: Tue, 28 May 2013 08:51:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Fri, 24 May 2013 12:59:59 +0200,
Martin Jansa <martin.jansa@gmail.com> a =C3=A9crit :

> On Fri, May 24, 2013 at 11:44:36AM +0200, Eric B=C3=A9nard wrote:
> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com>
> > ---
> >  recipes-qt/qt5/qtjsbackend.inc                     |    1 +
> >  .../qtjsbackend/0001-Fix-hardfloat-detection.patch |   33 ++++++++++++=
++++++++
> >  2 files changed, 34 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detec=
tion.patch
>=20
> Looks good, but have you tried that the same patch does apply to all 4
> versions we currently have?
> =20
still need to test it on _git.

Eric

