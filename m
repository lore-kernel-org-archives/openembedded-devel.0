Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1DB6373C8C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 22:57:02 +0000 (UTC)
Received: by wgdm6 with SMTP id m6so152205042wgd.2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Mar 2015 15:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=mIrcmbgy2Ir68ab7+fYcRLzi8NRi7eevKg4g204Mjos=;
	b=hKWepRZZKArfp98l5sOXt1R0IdZWFxHQsYlyPnhRWuAsSLzWI1tP9aEW0Ppds1OTTO
	zJOqUB4thqSnvLEL2Mon0N8LSrQKQP4MYO6VhAZ5vYHB4WD85OK5zbSjamT3lGbGh6GO
	4UDeRkwQP0HXM1926/UYc8nNaSupwSGDJxxmXTxTXclbVTVaIl/EGE8smNHgcO9kP3um
	Nfk+hTRGONSjlIS9nOP8gXFJf3+dex/XU+ONIoK5uTrdlD6k1BS59De1dB43Hu5AguCH
	VMfHjHJUt9bch7IMuJd20NCWEQpZbuTzncyiIIrlP8pDL8RojUl6xA4FnjKyDSFedLum
	4TyA==
X-Received: by 10.180.20.144 with SMTP id n16mr16253397wie.44.1427669823359;
	Sun, 29 Mar 2015 15:57:03 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	g8sm13021514wiy.19.2015.03.29.15.57.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 Mar 2015 15:57:02 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 30 Mar 2015 00:57:24 +0200
To: openembedded-devel@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>,
	Michael Halstead <michael@yoctoproject.org>
Message-ID: <20150329225724.GH2343@jama>
References: <cover.1427426569.git.akuster808@gmail.com>
	<CAP9ODKrNJSW-aN5UfK9A7O5CMiTLsTiMUnaP9U+mZXN9qxmhbg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAP9ODKrNJSW-aN5UfK9A7O5CMiTLsTiMUnaP9U+mZXN9qxmhbg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [PATCH 00/18] Dizzy pull request
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
X-List-Received-Date: Sun, 29 Mar 2015 22:57:03 -0000
X-Groupsio-MsgNum: 54896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OFj+1YLvsEfSXdCH"
Content-Disposition: inline

--OFj+1YLvsEfSXdCH
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2015 at 08:25:50AM -0300, Otavio Salvador wrote:
> Hello Armin,
>=20
> On Fri, Mar 27, 2015 at 12:26 AM, Armin Kuster <akuster808@gmail.com> wro=
te:
> > Please consider this changes for meta-openembedded dizzy-next
> >
> > The following changes since commit 853dcfa0d618dc26bd27b3a1b49494b98d6e=
ee97:
> >
> >   rsyslog: fix name of syslogd ua group (2015-03-03 21:13:17 +0100)
> >
> > are available in the git repository at:
> >
> >   https://github.com/akuster/meta-openembedded akuster/dizzy-next
> >   https://github.com//tree/akuster/dizzy-next
> >
> > Andre McCurdy (1):
> >   log4c: fix undeclared dependency on expat
> >
> > Andreas M=FCller (1):
> >   samba: add mirrors
> >
> > Armin Kuster (4):
> >   wireshark: update to 1.12.3
> >   wireshark: fix rdepends issue
> >   wireshark: fix pcap-config issue
> >   wireshark: update to 12.4
> >
> > Ash Charles (2):
> >   xfce4-xkb-plugin: Specify GPLv2 license
> >   xfce4-diskperf-plugin: Specify BSD license
> >
> > Bian Naimeng (1):
> >   xbitmaps: fix build warning.
> >
> > Dan McGregor (1):
> >   lxdm: RDEPEND on libsvg-gtk
> >
> > Paul Eggleton (1):
> >   tmux: remove sed-native from DEPENDS
> >
> > Philip Balister (4):
> >   python-pyqt: Update to 4.11.3.
> >   sip: Update to 4.14.2.
> >   anki: python-sip package replaces with just sip.
> >   sip: Split python into a new package for runtime support.
> >
> > Sven Ebenfeld (2):
> >   claws-mail: Fix SRC_URI
> >   pxaregs: Add source file and fix SRC_URI
> >
> > Zhenhua Luo (1):
> >   python-pip: add python-distribute in RDEPENDS
>=20
> Alright. All seem sensible for be.
>=20
> Acked-by: Otavio Salvador <otavio@ossystems.com.br>

It looks like someone changed permissions on git server:

remote: + refs/heads/dizzy-next meta-openembedded martin_jansa DENIED by fa=
llthru
remote: error: hook declined to update refs/heads/dizzy-next
To git@git.openembedded.org:meta-openembedded
 ! [remote rejected] dizzy-next -> dizzy-next (hook declined)
error: failed to push some refs to 'git@git.openembedded.org:meta-openembed=
ded'

Khem, Michael: any idea?
--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--OFj+1YLvsEfSXdCH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlUYg1QACgkQN1Ujt2V2gBzEkQCfa/0qwsqEip5E+6lY5fgYGqCe
wJ4AnRNyZOc0qHZEJzxpVrCP+rFCfbIy
=Ci6z
-----END PGP SIGNATURE-----

--OFj+1YLvsEfSXdCH--
