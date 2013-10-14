Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 2330A6CBAC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 12:11:32 +0000 (UTC)
Received: by mail-ee0-f49.google.com with SMTP id d41so3340393eek.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Oct 2013 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4JPGkc/Z/TUDSDh5nydXew3K6BHPgrD/oSWPlCAluxI=;
	b=UINnrki3qdqE3bNYQ6a/iY/oN4JlKs0LxSez5Rwt+LLzt0bGwHD7qDn34T2SOedeBP
	ePe+HAqInlbxV1vDI+TqoUpwSTNrhBQhE7ivDaejOxoIh5HYE/a6LGCGQt9EI3+txMuC
	jVeuDUkMYBB2iEIcQ3vI4yk+3W8ox6ZLwmCFJmdQhFzPZZffkwCaxNHR0+Y+uqRjSq4l
	Ai8qhreDnCbmVI0Okj2sj+bCIgfI0To+9WMLdRvYUQyJjzV3H9cwwLEhW0RSsR6JRRK0
	hdihivHRYNg47k492ITqIjRDP9kmjTQxup+RZt4SNbIioUfeHjkSk+PxtCTgnnmqRrYR
	Lx8A==
X-Received: by 10.14.203.70 with SMTP id e46mr52590851eeo.33.1381752694226;
	Mon, 14 Oct 2013 05:11:34 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	r48sm152829098eev.14.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 14 Oct 2013 05:11:33 -0700 (PDT)
Date: Mon, 14 Oct 2013 14:11:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20131014121133.GB3708@jama>
References: <1381653835-32079-1-git-send-email-raj.khem@gmail.com>
	<1596233.ZQ7J3xl2Nd@helios>
	<1D7F89CC-74A8-4960-BE17-B59701B0F943@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1D7F89CC-74A8-4960-BE17-B59701B0F943@gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: Cliff Brake <cbrake@bec-systems.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [meta-oe][PATCH 1/6] libraw1394: add recipe
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
X-List-Received-Date: Mon, 14 Oct 2013 12:11:34 -0000
X-Groupsio-MsgNum: 46682
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qjNfmADvan18RZcF"
Content-Disposition: inline

--qjNfmADvan18RZcF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 13, 2013 at 12:45:38PM -0700, Khem Raj wrote:
>=20
> On Oct 13, 2013, at 4:10 AM, Paul Eggleton <paul.eggleton@linux.intel.com=
> wrote:
>=20
> > On Sunday 13 October 2013 01:43:50 Khem Raj wrote:
> >> From: Cliff Brake <cbrake@bec-systems.com>
> >>=20
> >> Initial recipe created by Khem Raj
> >>=20
> >> Signed-off-by: Cliff Brake <cbrake@bec-systems.com>
> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> ---
> >> meta-oe/recipes-multimedia/libraw1394/libraw1394_2.0.9.bb | 11 +++++++=
++++
> >=20
> > Could these multimedia recipes go into meta-multimedia instead of meta-=
oe?
>=20
> Its ok to put them into meta-multimedia, but they depend on meta-oe a lot
> may be more recipes like opencv should be moved as well.
>=20
> Martin, do you need a fresh set of patches for it or can you handle the m=
ove from
> meta-oe -> meta-multimedia

If you're going to move opencv as well, then please send new fresh set
of patches. Thanks.

>=20
> >=20
> > Cheers,
> > Paul
> >=20
> > --=20
> >=20
> > Paul Eggleton
> > Intel Open Source Technology Centre
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--qjNfmADvan18RZcF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJb33UACgkQN1Ujt2V2gBwrQwCghPgLjtS4peg3wygRJ8GSt0AA
eU0An3/D2SfFQDkQ9GFUVDaIORHTON6r
=tIt4
-----END PGP SIGNATURE-----

--qjNfmADvan18RZcF--
