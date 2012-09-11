Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TBQJ4-0003Md-Ve
	for openembedded-devel@lists.openembedded.org;
	Tue, 11 Sep 2012 15:15:11 +0200
Received: by eaad12 with SMTP id d12so231167eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Sep 2012 06:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=i3E821RlOjOcfkdL6neQP/C+u6PuA2DfARpFJCpg7iw=;
	b=BLK9ubIOoNZFKWDJmWeupsbLJrT2KWxduizQhfgKlFAe6AuihsFxQ65xhW/srhfPhP
	N3NUrzoChm0nSBHd6tqN4jecRnvzhASbsBlzIJh+kCMTH39y6PAVFjnvH1NC6MICygFD
	7nGeb/1sJ+nFcgg27dIAtHkz+HVR/h0dzzbBvHvYVyglN/iSxbQ1yje2Ijjhn3orj1U7
	e/V5JqcbfaJx3v6pjQoIiQJvd/JasnW8UQ82LhP7KM0c9Xgxd9TTNNrhw28tQdsBnU6t
	mkS/i4mUoxQyKjBP8uUeRtDhVHA7hyDvYpUdqn7R7pmm/O/XufYHVesorVumQdf8LDfd
	xrDw==
Received: by 10.205.117.4 with SMTP id fk4mr1614305bkc.64.1347368560330;
	Tue, 11 Sep 2012 06:02:40 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id he8sm9533776bkc.3.2012.09.11.06.02.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Sep 2012 06:02:39 -0700 (PDT)
Date: Tue, 11 Sep 2012 15:02:39 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120911130239.GD14077@jama.jama.net>
References: <504D81F8.9020702@dresearch-fe.de>
	<1347367374-10517-1-git-send-email-sledz@dresearch-fe.de>
	<CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0Lahx_1K64aBhag10RN=jSE+fz=APC9HnCwp-zxyb0-qgw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [2011.03-maintenance][PATCH] gdk-pixbuf: add missing dependencies
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
X-List-Received-Date: Tue, 11 Sep 2012 13:15:11 -0000
X-Groupsio-MsgNum: 40610
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kvUQC+jR9YzypDnK"
Content-Disposition: inline

--kvUQC+jR9YzypDnK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 11, 2012 at 01:59:21PM +0100, Burton, Ross wrote:
> On 11 September 2012 13:42, Steffen Sledz <sledz@dresearch-fe.de> wrote:
> > | No package 'atk' found
> > | No package 'pango' found
> > | No package 'cairo' found
>=20
> Those are spurious dependencies in a very old version of gdk-pixbuf.
>=20
> oe-core master has 2.24.1 at the moment, is there a good reason why
> meta-oe is hanging onto 2.10.14?

2011.03-maintenance !=3D meta-oe

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--kvUQC+jR9YzypDnK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAlBPNm8ACgkQN1Ujt2V2gBzCBwCfdZUEP5x4/jDb9ART0zVy1s/l
KcQAoIrlh3VIAH7p8tzSeJ7wwh3IOa7n
=mZ1d
-----END PGP SIGNATURE-----

--kvUQC+jR9YzypDnK--
