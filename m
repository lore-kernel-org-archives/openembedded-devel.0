Received: from mail-da0-f46.google.com ([209.85.210.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UCKcd-0008GC-8M
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 Mar 2013 02:55:34 +0100
Received: by mail-da0-f46.google.com with SMTP id z8so2265571dad.33
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Mar 2013 17:38:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=SGA9DPhl4Y9c68PcVw582Ok5i71UbTgm6I/vELS8Xuc=;
	b=mhA3smGGyTTQy8bAXKOG5kzFrUMMcTxCpnpX/jPQcKj1jUQIxbih8e8aGfFE1zd5Cf
	M/j4WJ1bSVPooBEc7P72tvRDcNwrHLXBunqWgxnB46p6hLnMgRjb5nkHGvsj25s1Nxuw
	3knJK2WYzJp9raBR7czYY514OBDp15Qz0rh0lkYm8+6dd0duWfYPIvfcRd60EGC7QLQM
	Okl9FSsJJXvtauVAGZPVu2enBE+YrlmIzHTfBim+kXLrWMuzoDSUt0bnVNN1e4WXEk0f
	/Sodhcv5iTMdGdFWPuAvtzecCFC8XUe60n5Z3x5XBJB9pbw5MiY/o//bbEQivPw3R68D
	pKxA==
X-Received: by 10.66.19.229 with SMTP id i5mr29576218pae.220.1362361135471;
	Sun, 03 Mar 2013 17:38:55 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id a4sm21828470paw.21.2013.03.03.17.38.52
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Sun, 03 Mar 2013 17:38:54 -0800 (PST)
Date: Mon, 4 Mar 2013 02:38:41 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130304013841.GB3268@jama>
References: <1362360614-12109-1-git-send-email-randy.macleod@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1362360614-12109-1-git-send-email-randy.macleod@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] apr: add libtool to SSTATE_SCAN_FILES
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
X-List-Received-Date: Mon, 04 Mar 2013 01:55:46 -0000
X-Groupsio-MsgNum: 43377
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UHN/qo2QbUvPLonB"
Content-Disposition: inline

--UHN/qo2QbUvPLonB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2013 at 08:30:14PM -0500, randy.macleod@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
>=20
> The hardcoded paths in libtool will cause apache2 compile fail at
> link stage when the package apr is installed from sstate cache, so
> add libtool to SSTATE_SCAN_FILES.
>=20
> [ CQID: WIND00405372 ]
>=20
> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>

http://lists.linuxtogo.org/pipermail/openembedded-devel/2013-March/044212.h=
tml


--UHN/qo2QbUvPLonB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlEz+yEACgkQN1Ujt2V2gBzSdQCgl36hm/S5KRm+zzoehroSCdFb
S9MAn1mdMpslVLoA9rp3TwOOAi1ADiYN
=59uI
-----END PGP SIGNATURE-----

--UHN/qo2QbUvPLonB--
