Received: from smtp3-g21.free.fr ([212.27.42.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eric@eukrea.com>) id 1Ua7jD-0006Yo-1h
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 May 2013 19:00:46 +0200
Received: from e6520eb (tal33-3-82-233-81-124.fbx.proxad.net [82.233.81.124])
	(Authenticated sender: eukrea)
	by smtp3-g21.free.fr (Postfix) with ESMTPSA id 25693A60F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 May 2013 18:42:24 +0200 (CEST)
Date: Wed, 8 May 2013 18:42:23 +0200
From: Eric =?UTF-8?B?QsOpbmFyZA==?= <eric@eukrea.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130508184223.67168340@e6520eb>
In-Reply-To: <kmdavo$etd$1@ger.gmane.org>
References: <1367966513-12566-1-git-send-email-schnitzeltony@googlemail.com>
	<kmdavo$etd$1@ger.gmane.org>
Organization: =?UTF-8?B?RXVrcsOpYQ==?= Electromatique
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.16; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Subject: Re: [meta-oe/meta-gnome 00/15] outstanding patches with fixes
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
X-List-Received-Date: Wed, 08 May 2013 17:00:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le Wed, 08 May 2013 12:55:57 +0200,
Koen Kooi <koen@dominion.thruhere.net> a =C3=A9crit :

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Op 08-05-13 00:41, Andreas M=C3=BCller schreef:
> > [01-03] further glib 2.36 [04-05] reanimate gnome-terminal [06-11]
> > pdf-viewer [11-15] postinst improvements
> >=20
> > The following changes since commit
> > 8fec906a4584f9cbc467fb0e406bb6a705848b64:
> >=20
> > smartmontools: import from OE classic (2013-05-07 18:59:01 +0200)
> >=20
> > are available in the git repository at:=20
> > git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git
> > fixes-here-and-there
> >=20
> > Andreas M=C3=BCller (15): libbonobo: fix build with glib 2.36 libbonobo:
> > remove unreferenced patch gnome-vfs: fix build with glib 2.36=20
> > gnome-terminal: move out of nonworking gnome-terminal: update to 2.30.2=
=20
> > poppler: remove unrecognized configure options poppler: merge include
> > files into poppler - only poppler requires them poppler: update to
> > 0.22.3 poppler-data: update to 0.4.6 and stylize a bit epdfview: move to
> > nonworking evince: fix/remove postinst by inheriting gsettings dconf:
> > fix/remove postinst by inheriting gsettings proftpd: remove postinst -
> > directory can be setup offline in do_install gnome-panel: let
> > gconf.bblass take care for postinst rp-pppoe: move chmod form postinst =
to
> > offline do_install
>=20
> These look good to me, can we also include them in the dylan branch?
>=20
yes, that will be done.

Eric


