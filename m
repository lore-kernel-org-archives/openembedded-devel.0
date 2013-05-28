Return-Path: <eric@eukrea.com>
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
	by mail.openembedded.org (Postfix) with ESMTP id 1EA6C6A48C
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 08:02:30 +0000 (UTC)
Received: from e6520eb (pac33-2-82-240-38-71.fbx.proxad.net [82.240.38.71])
	(Authenticated sender: eukrea)
	by smtp2-g21.free.fr (Postfix) with ESMTPSA id C04564B01D2;
	Tue, 28 May 2013 10:02:25 +0200 (CEST)
Date: Tue, 28 May 2013 10:02:24 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130528100224.3a9be130@e6520eb>
In-Reply-To: <1369212636-6760-1-git-send-email-schnitzeltony@googlemail.com>
References: <1369212636-6760-1-git-send-email-schnitzeltony@googlemail.com>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe/master/dylan] icon-slicer: fix native build by depending on gdk-pixbuf only
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
X-List-Received-Date: Tue, 28 May 2013 08:02:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Wed, 22 May 2013 10:50:36 +0200,
Andreas M=C3=BCller <schnitzeltony@googlemail.com> a =C3=A9crit :

> | checking for GDK_PIXBUF... no
> | configure: error: GTK+-2.0 is required to compile icon-slicer
> <...>
> ERROR: Task 2643 (virtual:native:/home/andreas/data/oe-core/sources/meta-=
openembedded/meta-oe/recipes-devtools/icon-slicer/icon-slicer_0.3.bb, do_co=
nfigure) failed with exit code '1'
>=20
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

pushed to dylan-next, thanks
Eric

