Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S86E5-00062J-FP
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 09:40:01 +0100
Received: by wera1 with SMTP id a1so2563773wer.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 01:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=MM2gL90b3XjbQPjj0Iz1Iea7DTqHVIGfQ5CVODoUTIc=;
	b=Y8/RFfZBY9Oc+qMNrD2G5rzBkATO/emK2Rf3QUFmL+dA87AlNJaFHui2nPwyMAsvIm
	gwxskVL+RgRlXv6bfl83jUWgjGNG+2v+TBcKinIpxyeco539l9SVgFdLy0aKSiNTT6UE
	AOGcDOHzNLRYe7pxLhIG4C0EZCAx+42NYVbRkbxDRq4b3TAExXSJ9IiRNEgqNfN5Uqk1
	tQgHv4nCmJ18xLObrRwIeKYZgu2XSYx8Hju3nXMruaDoOWI8Ywlu5cKs0oXntMpB4caL
	ostHhpbS2uhmb0JNPPZUkx5itdUhOg/KNm6+YiWqh9aHn6PthyZZcM9Lp8vaxHWApJqb
	iYdw==
Received: by 10.216.136.157 with SMTP id w29mr3517522wei.23.1331800275132;
	Thu, 15 Mar 2012 01:31:15 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id n15sm3332462wiw.6.2012.03.15.01.31.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 15 Mar 2012 01:31:14 -0700 (PDT)
Date: Thu, 15 Mar 2012 09:31:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120315083112.GD4973@jama.jama.net>
References: <2ig0lhu1ti0mhyknnc4ow74t.1331291074225@email.android.com>
	<jjcoo5$1eu$1@dough.gmane.org>
	<D604D5FB4D200642AA2FAAE94E392586017F9D95@CARAMBAR.lpg.priv>
	<20120309210930.GA12854@rhein.zuhause.netz>
	<D604D5FB4D200642AA2FAAE94E392586017FA3E6@CARAMBAR.lpg.priv>
MIME-Version: 1.0
In-Reply-To: <D604D5FB4D200642AA2FAAE94E392586017FA3E6@CARAMBAR.lpg.priv>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: GTK2 2.18+
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
X-List-Received-Date: Thu, 15 Mar 2012 08:40:01 -0000
X-Groupsio-MsgNum: 37773
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="HWvPVVuAAfuRc6SZ"
Content-Disposition: inline

--HWvPVVuAAfuRc6SZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 09:28:41AM +0100, MONDON Daniel wrote:
> Hi,
>=20
> When OpenEmbedded GTK2 2.18 or more will be available (running on ARM)?

http://git.openembedded.org/openembedded-core/tree/meta/recipes-gnome/gtk+
has 2.24.8

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--HWvPVVuAAfuRc6SZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk9hqNAACgkQN1Ujt2V2gByZWgCfaalonIEGDX08JBJHxRIlzlHH
CvMAoLAt3jYb+tGzEp4wRK/t4kBi+S1f
=B3mC
-----END PGP SIGNATURE-----

--HWvPVVuAAfuRc6SZ--
