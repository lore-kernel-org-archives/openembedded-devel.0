Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RMLPP-0002we-Nu
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Nov 2011 16:10:20 +0100
Received: by qam2 with SMTP id 2so2205078qam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Nov 2011 08:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=references:in-reply-to:mime-version:content-type:message-id
	:content-transfer-encoding:from:subject:date:to:x-pgp-agent:x-mailer;
	bh=zwEl9fdqcgDSRwLtpbbX95z4T6eQlgt17+C6qcz6mwY=;
	b=ibC8uFKwe+wnwp+rkpXk07hasNYXwCpmQZaWhbKH66SrtlAgX7RC1sBfNMCsPSvv96
	fPvA1JyB+7G2pRIJ7MVZmw4sqLwd0YDrBPUXuJtAn2JAnCTnTkJ5TUovQRuUj/UHeiUl
	E0czlf1a3IPQglexdTsIA2mJQetLo6xSrQ928=
Received: by 10.42.158.9 with SMTP id f9mr16350479icx.31.1320419049170;
	Fri, 04 Nov 2011 08:04:09 -0700 (PDT)
Received: from [192.168.0.5] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id n30sm21724716ibl.4.2011.11.04.08.04.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Nov 2011 08:04:08 -0700 (PDT)
References: <20111102214733.GY15391@denix.org>
In-Reply-To: <20111102214733.GY15391@denix.org>
Mime-Version: 1.0 (Apple Message framework v1084)
Message-Id: <F2DBF52B-333D-407D-AF35-A225C71A2A8D@gmail.com>
From: Tom Rini <tom.rini@gmail.com>
Date: Fri, 4 Nov 2011 08:03:56 -0700
To: openembedded-devel@lists.openembedded.org
X-Pgp-Agent: GPGMail 1.3.3
X-Mailer: Apple Mail (2.1084)
Subject: Re: [2011.03-maintenance] Pull request 20111006
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
X-List-Received-Date: Fri, 04 Nov 2011 15:10:20 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Nov 2, 2011, at 2:47 PM, Denys Dmytriyenko wrote:

> Tom,
>=20
> Please pull this 1 commit, that updates sourceipk.bbclass to =
dereference
> symlinks properly. Cherry-picked from oe.dev.
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>  Branch: 2011.03-maintenance
>  Browse: =
http://arago-project.org/git/people/?p=3Ddenix/openembedded.git;a=3Dshortl=
og;h=3Drefs/heads/2011.03-maintenance
>=20
> Thanks,
>    Denys Dmytriyenko <denys@ti.com>
> ---
>=20
> The following changes since commit =
656bed267ae71e63ff443bfd2dd7ca0d2feff11d:
>  Mats K=D1=86=E2=95=93rrman (1):
>        binutils_2.18: update SRC_URI to avoid manual delete
>=20
> Chase Maupin (1):
>  sourceipk: dereference symlinks in sourceipk

Applied, thanks.

- --=20
Tom

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0.17 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk6z/t4ACgkQdZngf2G4WwMKowCglL66HVqE2sxTFs0hIx2GC7mN
aQ4An23g/ooF7Q7svUHi76V0HySBJgJb
=3DdsmA
-----END PGP SIGNATURE-----


