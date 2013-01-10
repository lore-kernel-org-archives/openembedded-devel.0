Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TtGS4-0002Ki-55
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jan 2013 12:37:40 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so297664pad.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jan 2013 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=NMzduIGV2lNLF4Th6opg0gyd2O/Ju5HmlPUTgWGB3T0=;
	b=VwiQ+8IhFDmwr0AvsUjrIDt9jbvHZ4Tm65jKftCdnyENU/J9sFzybw2AYxwk5oE1B7
	PwrHpji0Sfsvk1Uzzpk3f82IyEIk2fUPYdpYREu5XpOBF6ag/xXEcB4Wxk8oRP/Sna3X
	wtuMImoP/BsxNcAMALgtw6KMMhIDY3n70u37u/2bwP4NpqzLxFkkN6PAlfE/4R2AuB2Z
	Rb+XC9xPP85yzM5wCF53DILKkWbzpNKm+0s1sySN9BP64NlpZhwxJtgbLKsrjOdyiumt
	JS/W/I2Szj/RSzG1K0szgliR6i+CkjysiA8aNB17admy8Opw1DbOZfKBIcWES19+n9IS
	szfQ==
X-Received: by 10.66.79.66 with SMTP id h2mr197353239pax.31.1357816946241;
	Thu, 10 Jan 2013 03:22:26 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id zv10sm649694pbc.76.2013.01.10.03.22.23
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Thu, 10 Jan 2013 03:22:25 -0800 (PST)
Date: Thu, 10 Jan 2013 12:22:31 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130110112231.GZ3722@jama.palm1.palmone.com>
References: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
In-Reply-To: <1357774995-1104-1-git-send-email-schnitzeltony@googlemail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia/meta-oe/meta-systemd 0/3] new recipes/appends
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
X-List-Received-Date: Thu, 10 Jan 2013 11:37:40 -0000
X-Groupsio-MsgNum: 42626
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="iDgFKLa5Kp4Ejml3"
Content-Disposition: inline

--iDgFKLa5Kp4Ejml3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 10, 2013 at 12:43:12AM +0100, Andreas M=FCller wrote:
> 1+2 resend (Patchwork was down)
> 3. I have this in and working for long time
>=20
> The following changes since commit 89d5899c38ec94b0560a3496b020e45b40d825=
1c:
>=20
>   python-distutils-extra: initial add 2.36 (2013-01-09 16:20:22 +0100)

This commit is not in master.

First 2 patches applied from previous patches on ML, thanks!

>=20
> are available in the git repository at:
>   git://gitorious.org/schnitzeltony-oe-meta/meta-openembedded.git patches
>=20
> Andreas M=FCller (3):
>       openal-soft: initial add 1.15.1
>       physfs: initial add 2.0.3
>       bluez4: add systemd support
>=20
>  .../openal/openal-soft_1.15.1.bb                   |   20 ++++++++++++++=
++++++
>  meta-oe/recipes-support/physfs/physfs_2.0.3.bb     |   11 +++++++++++
>  .../bluez/bluez4_4.101.bbappend                    |    8 ++++++++
>  3 files changed, 39 insertions(+), 0 deletions(-)
>  create mode 100644 meta-multimedia/recipes-multimedia/openal/openal-soft=
_1.15.1.bb
>  create mode 100644 meta-oe/recipes-support/physfs/physfs_2.0.3.bb
>  create mode 100644 meta-systemd/oe-core/recipes-connectivity/bluez/bluez=
4_4.101.bbappend
>=20
> --=20
> 1.7.4.4
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--iDgFKLa5Kp4Ejml3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlDupHcACgkQN1Ujt2V2gBy7aACbB6rWR3s7qd4mvyHBXD6YEmAp
rEEAn3a0rkrXf4BYpWOstoe0yQffmTej
=ztXl
-----END PGP SIGNATURE-----

--iDgFKLa5Kp4Ejml3--
