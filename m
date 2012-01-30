Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RrsYZ-0001vv-OO
	for openembedded-devel@lists.openembedded.org;
	Mon, 30 Jan 2012 15:50:07 +0100
Received: by eaal12 with SMTP id l12so1181023eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 30 Jan 2012 06:42:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=jEp9IsqL59Ksq3SR9B7aRI6juv8jzpOF9Fv0Xvp0+i8=;
	b=oWpuKSF2/ca1ZO8NWe/VcrS1gab932flecalSwCN7Ga8Nc+Zv1PkAM7y870zR/8Rv2
	gQWm/EkLJPwq4GwYxnXikR7gQ69MUSt7kugj7JSfRcU6lfXK0R5mHOXb1pXB3JrHsJ17
	+ZtRTcQZm2EJBUxmR8dhcHfQR3A9xB+NjtliQ=
Received: by 10.213.15.131 with SMTP id k3mr2775039eba.37.1327934535332;
	Mon, 30 Jan 2012 06:42:15 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm24719163eeb.7.2012.01.30.06.42.13
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 30 Jan 2012 06:42:14 -0800 (PST)
Date: Mon, 30 Jan 2012 15:42:12 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120130144212.GB3577@jama.jama.net>
References: <jg68t6$uh9$1@dough.gmane.org>
MIME-Version: 1.0
In-Reply-To: <jg68t6$uh9$1@dough.gmane.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-oe] udev rollcall
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
X-List-Received-Date: Mon, 30 Jan 2012 14:50:08 -0000
X-Groupsio-MsgNum: 36754
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ADZbWkCsHQ7r3kzd"
Content-Disposition: inline

--ADZbWkCsHQ7r3kzd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 03:19:19PM +0100, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
> Hi,
>=20
> We currently have udev 173 and 175 in meta-oe and I just sent a patch to =
add
> 180. To keep the number of udev recipes sane I'd like to ask people using
> udev from meta-oe to state which version they are using and if they want =
to
> keep it.

I was testing your previous patch for 177 and it worked fine for me (I
use only libudev from it). So I'll retest with 180 and I guess that
we'll switch SHR to it when it's applied.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--ADZbWkCsHQ7r3kzd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.18 (GNU/Linux)

iEYEARECAAYFAk8mrEQACgkQN1Ujt2V2gBzZIwCgshA0tRGF9Ln1unOUquNHdQQh
ILEAoKANX/Z4lDzFHSUXAKFv0/5zsq0e
=KiVQ
-----END PGP SIGNATURE-----

--ADZbWkCsHQ7r3kzd--
