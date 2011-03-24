Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2iEN-000470-Ka
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Mar 2011 11:57:31 +0100
Received: by bwz10 with SMTP id 10so7262055bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Mar 2011 03:55:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=zvcOfcT3+VqBi5KXZOhQZ9t3cwyX3ISny5Epo+mLo08=;
	b=L921u68pP2H+38BKowx9pQdyrLpoUNfn1uVTB9VQzW1foWOyDQ4VpBSQzaFZvpJt2a
	K9E85LDnFLad8ynpLaiTMNDOvcGBBSDix2P6gNCqZHPK/9kClIa86J8aUYw+3s8NZi9v
	KetJm3Wl6Nn0zKCBaaKWU8u15CfFYOBOsbsHQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=C03E1FbVzkODZ6rDCPAG5s6zoV13GlQZy+N/lZ8+lmmYyOa80tbN9qI7dp6sYkJx6+
	cvmWnBtm+V42Bc6WlEyTYOBgpPjoTcY9twvNk5S/q7DbfyRnB4NEqUTXqd2/5SExSSVS
	fRTCua1PJcp8f168YfK65HixkAcBUXYqZofJY=
Received: by 10.204.20.79 with SMTP id e15mr7216124bkb.147.1300963687190;
	Thu, 24 Mar 2011 03:48:07 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c11sm6612059bkc.2.2011.03.24.03.48.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 24 Mar 2011 03:48:06 -0700 (PDT)
Date: Thu, 24 Mar 2011 11:47:59 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110324104759.GD20421@jama.jama.net>
References: <cover.1300961186.git.Martin.Jansa@gmail.com>
	<imf753$dcv$2@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <imf753$dcv$2@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 0/7] Checksums and LIC_FILES_CHKSUMs
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
X-List-Received-Date: Thu, 24 Mar 2011 10:57:31 -0000
X-Groupsio-MsgNum: 30590
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zS7rBR6csb6tI2e1"
Content-Disposition: inline

--zS7rBR6csb6tI2e1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 24, 2011 at 11:41:38AM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> On 24-03-11 11:09, Martin Jansa wrote:
> > Mostly checksums and LIC_FILES_CHKSUMs
> >=20
> > Pull URL: git://gitorious.org/shr/meta-openembedded.git
> >   Branch: jama/license
> >   Browse: http://gitorious.org/shr/meta-openembedded/commits/jama/licen=
se
>=20
> Thanks for the pull request! I merged it as is, but could you add your
> SOB next time to the commits?

Yup sorry for that :/ I was used to cherry-pick from my patch-queue
branch to push checkout (while adding SOB) so I just forget today :/.

> regards,
>=20
> Koen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>=20
> iD8DBQFNix/iMkyGM64RGpERAtZ/AJ4kBMNVeNpu8V5dWH89yl1jYKi7nQCfb6fy
> UMjhFzSNWwbCNYivpxnSeAY=3D
> =3D7Jzm
> -----END PGP SIGNATURE-----
>=20
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zS7rBR6csb6tI2e1
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2LIV8ACgkQN1Ujt2V2gBz+CwCfRkqo97ov+pKUhmoEWs8Ge6Ai
TYAAn1pCDKmb+gFZ98OjUEyMEASfHuzx
=jmrg
-----END PGP SIGNATURE-----

--zS7rBR6csb6tI2e1--
