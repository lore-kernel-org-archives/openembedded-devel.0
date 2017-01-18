Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 510F871A54
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jan 2017 01:27:20 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id r126so280686wmr.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jan 2017 17:27:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=hbSWMUTcYjeLPm6v4KMQXOW/LwWPfcuNdT4IF3VwCkI=;
	b=efVR371I9kyHEKqQI9w0xyBYWPwICP4dTjKBdZLPIP9v8JEue84XNDyo6lhVou4SeI
	nf7oPQAMDsOuXbTTeF0R70ouPiyz9Np+xOaVzGNlTkYLMbUwdYrrlbbQJ01buTcZ/wom
	KXwC8wGFHzJjxX9C75ymdciVvKn5/+nHkhj6Vsk3mUiaSrejotSnLl94V7fG0IkBj3R4
	c+nKM7XBY4CeXtjzPLTJwIO4Z+ZELsPMlnVlenScH1RSd7togYwcNbfDsZjGxo7mB/wa
	ffcmh+dOyJZWF1cH7OkTe9Q3DQoh+BZWfqZmI91ek5/fhI7tkTamaowipHzWS5KjOpBl
	p1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=hbSWMUTcYjeLPm6v4KMQXOW/LwWPfcuNdT4IF3VwCkI=;
	b=A8b4tyxDZU8LqFWwsoZ8gE+OKc6zdmZ22N8QDr2YYF4n3ZWUeo3jwCO8DUFsce3B9s
	DWzmrMPTD0mzjTtLrXQZNRqThPoF+LvY/32TrxbZM4+s9QQk3XXdVGRdDPKwN4HYsdBg
	amHjruXRW7ggPe+6b3Ny8mr14g9gJSf61tSjP6MvG3A0qO63VXoVs0ozPj+Au9ekPCN/
	TPlqXtgxpQF+kHAyOPClZtzUHKB6RHE1XQBD6H/8pThv2GEHmqiaPEcFgllzgQ50qvMv
	8idTJTeF7XARyQMLylQ3pEBl+cE3VoRRtyzGkJItdvUNPi+9Ap+E+SF+V/sqQnZyNrGx
	+J8w==
X-Gm-Message-State: AIkVDXKsid98aMD25I5Xi5N0QSzNoeJ3r9pnYp+G8h8y9hBscX8fe4k7vXB/IAgUGQPjDw==
X-Received: by 10.223.171.141 with SMTP id s13mr410416wrc.23.1484702840526;
	Tue, 17 Jan 2017 17:27:20 -0800 (PST)
Received: from localhost ([217.30.68.212])
	by smtp.gmail.com with ESMTPSA id 81sm696318wmw.7.2017.01.17.17.27.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 17 Jan 2017 17:27:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Jan 2017 02:27:20 +0100
To: Denys Dmytriyenko <denis@denix.org>
Message-ID: <20170118012720.GA3279@jama>
References: <1484363626-12770-1-git-send-email-denis@denix.org>
	<72187853-9f6e-e0a0-b09c-c87060ae182e@qt.io>
	<20170117174621.GQ15833@denix.org>
MIME-Version: 1.0
In-Reply-To: <20170117174621.GQ15833@denix.org>
User-Agent: Mutt/1.7.2 (2016-11-26)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5][morty-next][PATCH] qtwebengine: update SRCREV due to old commit no longer being available
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jan 2017 01:27:23 -0000
X-Groupsio-MsgNum: 64765
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="WIyZ46R2i8wDzkSu"
Content-Disposition: inline

--WIyZ46R2i8wDzkSu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2017 at 12:46:21PM -0500, Denys Dmytriyenko wrote:
> Mikko,
>=20
> Are there any estimatest when this commit is finally coming?
>=20
>=20
> Currently, morty is broken for me because it doesn't have the correspondi=
ng=20
> QWaylandIntegration patch from master and Martin doesn't want to apply it=
,=20
> since Qt 5.7.1 is coming any day now. And while 5.7.1 is already in=20
> morty-next, it is also broken for me, because it points to a missing comm=
it=20
> in qtwebengine, which is also coming any day now.
>=20
> I'd like to get unblocked on either of this issues ASAP, as it's been in =
the=20
> limbo for quite some time!
>=20
>=20
> Martin,
>=20
> Would you mind applying the old QWaylandIntegration patch to morty, while=
 we=20
> are still waiting for 5.7.1 update to finalize? You already have the modi=
fied=20
> and squashed version for 5.7.1 in morty-next, so should be easy to rebase=
 and=20
> merge it in the future... Please let me know, thanks.

ok, I've pushed your change from morty-next to morty.

> --=20
> Denys
>=20
>=20
> On Mon, Jan 16, 2017 at 02:43:05PM +0200, Mikko Gronoff wrote:
> > This one commit was missing a merge from 5.7.1 branch to 5.7 but
> > it's coming very soon. The merge commit is already done, it's just a
> > matter of author submitting it in. Should be available very soon.
> >=20
> > -Mikko
> >=20
> >=20
> > On 01/14/2017 05:13 AM, Denys Dmytriyenko wrote:
> > >From: Denys Dmytriyenko <denys@ti.com>
> > >
> > >Previous commit used for 5.7.1 baseline is no longer available on 5.7 =
branch.
> > >
> > >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > >---
> > >  recipes-qt/qt5/qtwebengine_git.bb | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > >diff --git a/recipes-qt/qt5/qtwebengine_git.bb b/recipes-qt/qt5/qtwebe=
ngine_git.bb
> > >index 4712441..210f791 100644
> > >--- a/recipes-qt/qt5/qtwebengine_git.bb
> > >+++ b/recipes-qt/qt5/qtwebengine_git.bb
> > >@@ -122,7 +122,7 @@ SRC_URI +=3D " \
> > >      file://0002-chromium-Change-false-to-FALSE-and-1-to-TRUE-FIX-qtw=
=2Epatch \
> > >  "
> > >-SRCREV_qtwebengine =3D "9cc97f0c63049a8076476acc89c875c9e240abfb"
> > >+SRCREV_qtwebengine =3D "6766290699acd0d73c81cf690012d52729e518b9"
> > >  # This is in git submodule, but we're using the latest in 49-based
> > >  # SRCREV_chromium =3D "c109a95a067af783e48f93d1cdeca870cda98878"
> > >  SRCREV_chromium =3D "b3c79e92f0a631273b639af171e59f4c367ae02e"
> >=20
> > --=20
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--WIyZ46R2i8wDzkSu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWH7EdwAKCRA3VSO3ZXaA
HCqJAJ9MOSSrmgVMk6zQ3HyJ4hq33pXN/wCfQgbgWn2Y/eS+la1j6Ua6HVlYOKI=
=1BlE
-----END PGP SIGNATURE-----

--WIyZ46R2i8wDzkSu--
