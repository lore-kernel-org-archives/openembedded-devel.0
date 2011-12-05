Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1RXbb8-0006rU-E4
	for openembedded-devel@lists.openembedded.org;
	Mon, 05 Dec 2011 17:40:58 +0100
Received: by iadj38 with SMTP id j38so818598iad.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 Dec 2011 08:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:mime-version:content-type:subject:date:in-reply-to:to
	:references:message-id:x-mailer;
	bh=oi2YxqQiCVT7YUxI4RZDIXrPsmCjr3VVrZGa9MB/sEI=;
	b=tk0kGc6VX6Hq+Y+j3UN5hbz9iNHO2wLw0KdOjZrNyExOEqKNBcKwr6O7Ff4D/m2UJo
	/qchNS8LqyFeoH6T4fdfZSH02qqLkT6fDvx2pwB+3ppiqO3yhve8tnKPKgG0w/3F4Jek
	FF7i5Pcv9jHOyeFMsjii4sHm3ugBh4EeshhMc=
Received: by 10.42.156.130 with SMTP id z2mr11158980icw.13.1323102846609;
	Mon, 05 Dec 2011 08:34:06 -0800 (PST)
Received: from [192.168.0.4] (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id v18sm78404280ibh.4.2011.12.05.08.34.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 05 Dec 2011 08:34:05 -0800 (PST)
From: Tom Rini <tom.rini@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1251.1)
Date: Mon, 5 Dec 2011 09:34:08 -0700
In-Reply-To: <20111203012106.GR20602@denix.org>
To: openembedded-devel@lists.openembedded.org
References: <20111203012106.GR20602@denix.org>
Message-Id: <312C3170-0C98-4B6E-B306-54EFF9D7E42D@gmail.com>
X-Mailer: Apple Mail (2.1251.1)
Subject: Re: [2011.03-maintenance] Pull request 20111202
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
X-List-Received-Date: Mon, 05 Dec 2011 16:40:58 -0000
X-Groupsio-MsgNum: 35873
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A03B0EB6-B4D7-46CE-A3F1-590F514D25EC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A03B0EB6-B4D7-46CE-A3F1-590F514D25EC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

On Dec 2, 2011, at 6:21 PM, Denys Dmytriyenko wrote:

> Tom,
>=20
> Please pull these 2 commits that fix fakeroot, cherry-picked from =
oe.dev
>=20
> Pull URL: git://arago-project.org/git/people/denix/openembedded.git
>  Branch: 2011.03-maintenance
>  Browse: =
http://arago-project.org/git/people/?p=3Ddenix/openembedded.git;a=3Dshortl=
og;h=3Drefs/heads/2011.03-maintenance

Applied, thanks.

--=20
Tom


--Apple-Mail=_A03B0EB6-B4D7-46CE-A3F1-590F514D25EC
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----

iEYEARECAAYFAk7c8oAACgkQdZngf2G4WwMxLgCgkCauVqCA1ZoDWgVI03Df2w1G
+boAmwdm/S6Ssqk7mSpKVt2dRGlE07G/
=W5N+
-----END PGP SIGNATURE-----

--Apple-Mail=_A03B0EB6-B4D7-46CE-A3F1-590F514D25EC--
