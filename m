Return-Path: <martin.jansa@gmail.com>
Received: from mail-wg0-f42.google.com (mail-wg0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id ED91C6A533
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 09:59:16 +0000 (UTC)
Received: by mail-wg0-f42.google.com with SMTP id n12so2903215wgh.5
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2013 02:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=9p7hPV/wBjFWCPH4AjKLfGBjcX22urIcVJhFW0p0IMQ=;
	b=AAIMNn8L+bFYB2tydQyi5fHdLdybh9z5z3VIyq63L3vRnAJWIr5De7cDb3nT4A/ZmN
	z0Y9mLCTyNDiRUSPanHw0pRk9F1XyCFZB30GR2DQ6M2M++TNUXB9tPSQxL0Hp39O1hof
	4QIbFe6Fgz8Z9vhVY/6Urb984v5EqSdkO4hXKR6n33I0vV7yB8S0bjIz6ECeDHHx/7Va
	rvXCmrzFzyzGz2poS/70QhQUCnE9jGB6V95mrjaIGg9+LKeZPVAmoSsaQS/4VIwNqY8D
	rpULqmF9Vo8IlxU8Gu1za3bvlLzp7sUCfXWAp1tgYkjSiDl3dqArUhrLMZQwIaHkXUsl
	1T2g==
X-Received: by 10.180.187.234 with SMTP id fv10mr11213005wic.29.1369735157081; 
	Tue, 28 May 2013 02:59:17 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	en3sm23203801wid.1.2013.05.28.02.59.16 for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 28 May 2013 02:59:16 -0700 (PDT)
Date: Tue, 28 May 2013 11:59:26 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Eric =?iso-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Message-ID: <20130528095926.GH3192@jama>
References: <1369698233-4500-1-git-send-email-eric@eukrea.com>
	<1369698233-4500-8-git-send-email-eric@eukrea.com>
	<20130528084655.GB3192@jama> <20130528105056.62ea3b76@e6520eb>
	<20130528092518.GE3192@jama> <20130528112724.32aa801d@e6520eb>
	<20130528093013.GF3192@jama> <20130528113313.39eb5f68@e6520eb>
MIME-Version: 1.0
In-Reply-To: <20130528113313.39eb5f68@e6520eb>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
X-List-Received-Date: Tue, 28 May 2013 09:59:17 -0000
X-Groupsio-MsgNum: 44896
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Yia77v5a8fyVHJSl"
Content-Disposition: inline

--Yia77v5a8fyVHJSl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2013 at 11:33:13AM +0200, Eric B=E9nard wrote:
> Le Tue, 28 May 2013 11:30:13 +0200,
> Martin Jansa <martin.jansa@gmail.com> a =E9crit :
>=20
> > On Tue, May 28, 2013 at 11:27:24AM +0200, Eric B=E9nard wrote:
> > > Le Tue, 28 May 2013 11:25:18 +0200,
> > > Martin Jansa <martin.jansa@gmail.com> a =E9crit :
> > > > On Tue, May 28, 2013 at 10:50:56AM +0200, Eric B=E9nard wrote:
> > > > > true do you want a v2 ?
> > > >=20
> > > > No, I've already added it and merged it :)
> > > >=20
> > > perfect.
> > >=20
> > > > Normally I would take longer for testing it, but I know about other
> > > > people starting to work on 5.0.2 so I wanted them to start with your
> > > > fixes included.
> > > >=20
> > > FWIW all my tests were done with you patch
> > > e7a477a171bf0560939196eb7ebe8e0b05061072 applied so maybe it's
> > > interesting to also apply it.
> >=20
> > But that will require to abandon 5.0.0 and 5.0.1, well I can at least
> > update that pull request to remove 5.0.0 and 5.0.1 together with this
> > SRCREV bump.
> >=20
> maybe you can create a dylan branch with 5.0.0 and 5.0.1 and switch
> master to 5.0.2 ?

Sounds good, will do

Btw is this patch backport of
commit bb4e2e4faf76d4b2992231891a9d640cfdac5196
Author: Michael Brasser <michael.brasser@live.com>
Date:   Tue Mar 26 09:22:51 2013 -0500

    Allow tslib to be specified at configure time.
?

I'm forward porting patches needed for qtbase_git and this one seems to
be resolved in upstream.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--Yia77v5a8fyVHJSl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlGkf/4ACgkQN1Ujt2V2gBz3uwCePmgvTi03lMuzYEOvi+M4BIWV
AmwAnjNw39gM+h5CfWyI8OZFpGFUJ4nb
=/EpC
-----END PGP SIGNATURE-----

--Yia77v5a8fyVHJSl--
