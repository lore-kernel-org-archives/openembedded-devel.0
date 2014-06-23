Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f172.google.com (mail-we0-f172.google.com
	[74.125.82.172])
	by mail.openembedded.org (Postfix) with ESMTP id 4D22365F14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 10:59:37 +0000 (UTC)
Received: by mail-we0-f172.google.com with SMTP id u57so6817895wes.17
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 03:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hXHtQDw0mnVsP5U0Fwdoznecb65BpUhSbL2NcNSB1b8=;
	b=PtXxxEUh/0AhU5vbD8xM2d/H2Ac+gSaaTmNvOK1XF63/29AQ5s6wybxf49Wo9W4Ytw
	+rrzptuFBOU1p8zQ32jgHwBfqw2Y8wyolh45B6Nmc68NqY8yDvoOLYrALSvVb6PFhwut
	Emq99Ma4ibNTq/wfhCpa25W1Sgddb6ghcsifhbUCepNvEIOuu0ihl2O/MAjIVhuzNCoi
	nFM7nOXycVlnl5L83Rf5nwzz31VAR/AVaJvI8hJZWfpQ+CB0MqC8gh7q8RbWLevLjU/E
	CsAnXwVnJ4gs+S9WZQa7iQbjgaQ1oFS+2HKNGictXXZiNLMZBaSxjAcukkeAibkl08i8
	HNqg==
X-Received: by 10.194.91.228 with SMTP id ch4mr26780409wjb.59.1403521178693;
	Mon, 23 Jun 2014 03:59:38 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	ev9sm32315132wic.24.2014.06.23.03.59.35
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 23 Jun 2014 03:59:37 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 23 Jun 2014 12:59:31 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140623105931.GA2437@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
	<20140619115701.GP2117@jama>
MIME-Version: 1.0
In-Reply-To: <20140619115701.GP2117@jama>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Mon, 23 Jun 2014 10:59:38 -0000
X-Groupsio-MsgNum: 50515
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline

--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 01:57:01PM +0200, Martin Jansa wrote:
> On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
> > The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e=
2acf:
> >=20
> >   python-efl: add dependency on python-dbus and lua to always build
> > edje and elementary bindings (2014-05-12 10:08:28 +0200)
> >=20
> > are available in the git repository at:
> >=20
> >   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
> >=20
> > for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
> >=20
> >   live555: fix fetch problem (2014-06-18 13:42:35 -0400)
>=20
> Thank you!
>=20
> Acked-By: Martin Jansa <Martin.Jansa@gmail.com>
>=20
> Waiting for ACK from listed maintainers, then I'll merge it.

In this case I wanted ACK from all listed maintainers, but I'm merging
it now without waiting for Otavio's ACK.

> > ----------------------------------------------------------------
> > Cliff Brake (1):
> >       update maintainer info in README's for daisy
> >=20
> > Steffen Sledz (1):
> >       live555: fix fetch problem
> >=20
> >  meta-efl/README                                | 16 ++++++++++++----
> >  meta-filesystems/README                        | 15 +++++++++++----
> >  meta-gnome/README                              | 16 ++++++++++++----
> >  meta-gpe/README                                | 16 ++++++++++++----
> >  meta-initramfs/README                          | 12 +++++++++---
> >  meta-multimedia/README                         | 15 +++++++++++----
> >  meta-networking/MAINTAINERS                    | 11 +++++++++--
> >  meta-networking/README                         |  2 +-
> >  meta-oe/README                                 | 14 +++++++++++---
> >  meta-oe/recipes-multimedia/live555/live555.inc |  4 ++--
> >  meta-perl/README                               | 13 ++++++++++---
> >  meta-ruby/README                               | 17 +++++++++++++----
> >  meta-systemd/README                            | 16 ++++++++++++----
> >  meta-webserver/README                          | 13 ++++++++++---
> >  meta-xfce/README                               | 16 ++++++++++++----
> >  toolchain-layer/README                         | 14 +++++++++++---
> >  16 files changed, 158 insertions(+), 52 deletions(-)
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com



--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOoCJMACgkQN1Ujt2V2gBzx8gCfYVFGrayGfhBiaijRRmc9UQHL
jw4AoIWxCEjB5cIjgNWEi9uPtG/efZWg
=rSi0
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--
