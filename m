Return-Path: <eric@eukrea.com>
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
	by mail.openembedded.org (Postfix) with ESMTP id 8C0366065B
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 26 May 2013 13:38:56 +0000 (UTC)
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id CE31BA61C2;
	Sun, 26 May 2013 15:38:51 +0200 (CEST)
Date: Sun, 26 May 2013 15:38:50 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130526153850.76048726@e6520eb>
In-Reply-To: <knnjhp$9v4$1@ger.gmane.org>
References: <1369388677-15423-1-git-send-email-eric@eukrea.com>
	<knnjhp$9v4$1@ger.gmane.org>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Cc: koen@dominion.thruhere.net
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
X-List-Received-Date: Sun, 26 May 2013 13:38:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Koen,

Le Fri, 24 May 2013 13:39:43 +0200,
Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 24-05-13 11:44, Eric B=C3=A9nard schreef:
> > Signed-off-by: Eric B=C3=A9nard <eric@eukrea.com> ---=20
> > recipes-qt/qt5/qtjsbackend.inc                     |    1 +=20
> > .../qtjsbackend/0001-Fix-hardfloat-detection.patch |   33
> > ++++++++++++++++++++ 2 files changed, 34 insertions(+) create mode 1006=
44
> > recipes-qt/qt5/qtjsbackend/0001-Fix-hardfloat-detection.patch
> >=20
> Does chromium need a similar patch?
>=20
we have one on 19.0.1049.3, no idea if 24.0.1312.52 was tested on
armv7 but v8 seems to integrate the fix (no idea since when).

Eric

