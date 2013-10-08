Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id C65B26CEA5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 13:39:06 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so4029720eek.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Oct 2013 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=f0oNtPR0DCAuwSn0EXK/aRT0nPOLUiQYWda0m7Z2q5A=;
	b=IzVqRrzVVCeW9QSpHRYza3Posbp1++1CkPh5sTASwfb8g9yIiAA3ewD8PliroxHGmI
	BJPWBX/GsjBMJn3arLS7VzLCeS2efK9oGJz4WUHdmaCaixvrMzrd98fodu9T70Ht5kkL
	SzctV/vRPSexv4+tWYKedQX0Dq/YF520jbY3US9qe1H57mmWsmMidJUDn1BtA3PCO+ob
	2tCBJk55rSrI9yxy6v0PUkSjFDgJKiS0Xm6z1MzgkJBQRvyx/It6SBD21sagexttzXlX
	tX6agYW4XY5+Avcq2v72jejqs7Jxy84jG9hCgab3duTtuQ70c9moL5P3VsHk5LzpoXo7
	z6RQ==
X-Received: by 10.15.99.205 with SMTP id bl53mr2556189eeb.82.1381239548195;
	Tue, 08 Oct 2013 06:39:08 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	m54sm76061499eex.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 08 Oct 2013 06:39:07 -0700 (PDT)
Date: Tue, 8 Oct 2013 15:39:18 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Laszlo Papp <lpapp@kde.org>
Message-ID: <20131008133918.GB2872@jama>
References: <20131007194922.GE18775@denix.org> <20131007201536.GU6240@jama>
	<20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
	<CAOMwXhORbuT7J8B6evLhcJSx2Z8BUCoAeXKGDe=twQsuY-wtOQ@mail.gmail.com>
	<20131008132109.GA22340@denix.org>
	<CAOMwXhN4C=Lob8ow9utU6hnqDOUjpt=PGj+Rp6W-pbnY5uky1g@mail.gmail.com>
	<20131008132609.GB22340@denix.org>
	<CAOMwXhP_EobkzYT91BQGLjqWWOtsvTwzYSPk9MJHsMRm1q7otQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOMwXhP_EobkzYT91BQGLjqWWOtsvTwzYSPk9MJHsMRm1q7otQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Tue, 08 Oct 2013 13:39:07 -0000
X-Groupsio-MsgNum: 46550
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline

--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 08, 2013 at 02:30:05PM +0100, Laszlo Papp wrote:
> On Tue, Oct 8, 2013 at 2:26 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > Since Dora is a branch of meta-qt5, I don't understand your statements
> > about
> > being orthogonal and not integrated...
> >
>=20
> You will be able to use *any* meta-qt5 on top of Dora, just as you can use
> meta-qt5 on top of denzil nowadays. The "dora branching" sounds like red
> herring to me. The dependencies in Dora will be good enough for 1-2 years,
> if not much more.

That's not true, we were just lucky that there weren't any incompatible
changes in oe-core, but as soon as 1.6. brings e.g. new cmake, master
branch will work only with master and dora only with dora (because of
=2Ebbappend).

So the same branch names are the only supported combination, if you want
to use meta-qt5/master with oe-core/dylan then you're on your own. It
works now, but only because we're lucky.

> 5.2 comes with several fundamental improvements. I would not personally
> recommend Qt 5.1 to anyone in about two months time when the release can
> happen. :)

There are companies still using 5.0.0 just because they fear to upgrade
or because newer qt versions were released to late for their release
cycle of real hw products. I agree that it would be nice for everybody
to just use latest, but there are still meta-qt5 users which cannot do
that.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJUCwYACgkQN1Ujt2V2gByGXgCZAW9V+50oG/eUyjpgOxVEe1sv
0hMAoIavCv6R9P6xjLRoT6xUcpq9hNFK
=/HUl
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--
