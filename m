Received: from mail-pa0-f43.google.com ([209.85.220.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPxRw-0006kh-Lp
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Apr 2013 18:00:41 +0200
Received: by mail-pa0-f43.google.com with SMTP id hz11so385425pad.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 10 Apr 2013 08:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=nl+rMOPbLnQS3riqKXj/qGPf58JlZbfl1u7/uCp6R+4=;
	b=OTca/2K5PGXSb0eZnp/9jFAnxqyLPyNU12Ie7Z0dNWus/oNUXcX1MdDNzbOUIGZdux
	f0jBIvkWvx4URo5+Iy2RGRlSxo5Q5myt3WXfu9dhRg6lvVWKSACSkJRK+hHZgTf/a3s2
	p2YI+taIyLkjrYNs1kvdjuRCRPvp0+FVm3I4kR+BtMnNQJ0Q+m3pjy0cMc+bmaMJHpBd
	NXjpqZGGmvSkXJgeRgPKL0DYypDOlGzz4ic7ylaoy64odJwp/Y7S9luKlRYuwMsUXai6
	gN6EFAnyoTFWIVOjEddLUqv4X5sQZ/EIAX5cky0QaC2+OiotaHywGgAQxRHcp3lH8Qfp
	cFmw==
X-Received: by 10.68.212.100 with SMTP id nj4mr3707731pbc.84.1365608598398;
	Wed, 10 Apr 2013 08:43:18 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ef3sm882928pad.20.2013.04.10.08.43.15
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 08:43:17 -0700 (PDT)
Date: Wed, 10 Apr 2013 17:43:10 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130410154310.GD2471@jama>
References: <1365604639-5235-1-git-send-email-ndec@linaro.org>
	<CAJTo0LYfznJ8DH_PEaBWRF4_KVP=FqVJe8E6uZfkVtN1MhXYKw@mail.gmail.com>
	<CAP71WjwrXC6BAyPred-K+c0kZc4aOaDD6Nd_9WC5kmrTv_Hqog@mail.gmail.com>
	<CAJTo0LZXHJqCERBQ1m+tEPvkKh_g+zO005_q5y2Cf8JQkEpTbQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZXHJqCERBQ1m+tEPvkKh_g+zO005_q5y2Cf8JQkEpTbQ@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-multimedia][PATCH] gupnp: remove dependency on gnome-icon-theme
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
X-List-Received-Date: Wed, 10 Apr 2013 16:00:48 -0000
X-Groupsio-MsgNum: 44026
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="2Z2K0IlrPCVsbNpk"
Content-Disposition: inline

--2Z2K0IlrPCVsbNpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2013 at 04:37:11PM +0100, Burton, Ross wrote:
> Hi Nicolas,
>=20
> On 10 April 2013 16:14, Nicolas Dechesne <ndec@linaro.org> wrote:
> > then, what I could do is a patch serie where patch 1/2 introduces the
> > INC_PR with "r0", and patch 2/2 fixes gupnp and increments INC_PR to
> > 'r1'.
>=20
> Exactly that.
>=20
> > also, is that worthwhile to add the INC_PR in all other recipes in the
> > gupnp folder ? or just in gupnp recipe for now?
>=20
> Do them all, might as well.

Is it important now, when PR bumps are not strictly required?

There were more dangerous changes without PR bumps included in last
months.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--2Z2K0IlrPCVsbNpk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlFliI4ACgkQN1Ujt2V2gBxJ7wCbBVCsQkFzEyle8ALOaVsbgJpj
VG4AoIpBlpXwJPOrpz/540K8Wtl8qoMt
=D24R
-----END PGP SIGNATURE-----

--2Z2K0IlrPCVsbNpk--
