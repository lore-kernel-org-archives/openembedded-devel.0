Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RGdcr-0000q3-CA
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Oct 2011 23:24:37 +0200
Received: by bkat8 with SMTP id t8so2880522bka.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Oct 2011 14:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=hkwQBgGKPNfZkiauEpU3MnQJp+/VpD1Dwk5bRjAOeXs=;
	b=clPi7b77svgbhLMMcBn+RUUSJR0KgISw4hYOUMbdgmHcEQsaNXzt8j9qmoSFDccAGk
	SmraguKkQTW403RAeoHoO3QR4nyRjtt7AjDOCmxRIBI/jFHlZm7P678CbRxb9aiu5WUU
	/zJP0LVxs7ChoKf8zJH8ieVrzgXK2SDcPFH+E=
Received: by 10.204.8.71 with SMTP id g7mr6022886bkg.101.1319059125783;
	Wed, 19 Oct 2011 14:18:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id rc12sm7408435bkb.10.2011.10.19.14.18.44
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 19 Oct 2011 14:18:44 -0700 (PDT)
Date: Wed, 19 Oct 2011 23:18:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20111019211838.GH3522@jama.jama.net>
References: <1319037014-29473-1-git-send-email-ulf_samuelsson@telia.com>
	<1319037014-29473-3-git-send-email-ulf_samuelsson@telia.com>
	<1319057924.12686.10.camel@mattotaupa>
MIME-Version: 1.0
In-Reply-To: <1319057924.12686.10.camel@mattotaupa>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 3/3] Update checksums for binutils-2.20.1.tar.bz2
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
X-List-Received-Date: Wed, 19 Oct 2011 21:24:37 -0000
X-Groupsio-MsgNum: 34913
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7SAgGoIHugoKhRwh"
Content-Disposition: inline

--7SAgGoIHugoKhRwh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2011 at 10:58:44PM +0200, Paul Menzel wrote:
> Dear Ulf,
>=20
>=20
> Am Mittwoch, den 19.10.2011, 17:10 +0200 schrieb ulf_samuelsson@telia.com:
> > From: Ulf Samuelsson <ulf_samuelsson@telia.com>
>=20
> again, please comply with our commit policy [1].
>=20
> binutils: Update from 2.20.1 to 2.20.1a
>=20
> > Tarball is updated to 2.20.1b so checksums have changed.
>=20
> I am not aware of any binutils version 2.20.1b. Do you mean 2.20.1a?
>=20
> Please create a new recipe since doing it this way the already
> downloaded sources would be made invalid and archives on mirrors would
> cause problems too.
>=20
> Please see commit f4faecdb [2] as an example and take a look at the list
> discussion [3].

Better example commit in [4]

> [1] http://www.openembedded.org/wiki/Commit_Policy
> [2] http://git.openembedded.org/openembedded/commit/?id=3Df4faecdbd0b7c83=
e5787735ef1495a34aca861e4
> [3] http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-Septembe=
r/034885.html

[4] http://git.openembedded.org/meta-openembedded/commit/?id=3D15832ab1f64f=
2bc2ee7d342e5bff0351b5e2479b

Regards,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--7SAgGoIHugoKhRwh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk6fPq4ACgkQN1Ujt2V2gBzqPgCgs/RKKiySPdNOsuxRILuY9A/e
/UAAn2Fvqj+3oCzm3f1/z5LhCzjhyAN8
=4grA
-----END PGP SIGNATURE-----

--7SAgGoIHugoKhRwh--
