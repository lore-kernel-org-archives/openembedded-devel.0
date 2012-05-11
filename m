Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1SSqBi-0007JR-4o
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 May 2012 15:47:18 +0200
Received: by wibhm14 with SMTP id hm14so1170693wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2012 06:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uYpWS++9yP7NXF98PBG7AcRd87fw50+LwKk62eRwT4c=;
	b=ckIF9HFM/n+358WtjgoEwoKEWCsSv2FbTKL6qHNuwb6851qWmlcZWQU8fdYnERENP8
	1MLIwPcYlAu7bvWdYWvB4wXaNjonV1sPTyRx2nbFbFJrvE6/+vcTb06WdRmC1j23gIis
	7v+kAfM90exzs6fMOnaVoZrZSt17tXsv3xO8ny/teZgXQjAL2WMyqHBAQcKXuy6Or1UF
	zy+ZpHEGXJ16M8TfYAVphDjOdrRqTwhMZQJLQqOyOiHHpFceEfvfcZuwcOG7BORuupUQ
	l67z1aP6RwCHbsVAl6IAKI4SG8DQofbFNQI5uuiuhmJE+c1Fn1qw/qaO9VjNSSpBvJA7
	rvvg==
Received: by 10.216.143.200 with SMTP id l50mr1633863wej.58.1336743443049;
	Fri, 11 May 2012 06:37:23 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id fl2sm17266561wib.2.2012.05.11.06.37.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 May 2012 06:37:21 -0700 (PDT)
Date: Fri, 11 May 2012 15:37:25 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120511133724.GD3166@jama.jama.net>
References: <4FAD09FE.4040101@mindchasers.com>
MIME-Version: 1.0
In-Reply-To: <4FAD09FE.4040101@mindchasers.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: finding mime-support in multiple oe trees?
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
X-List-Received-Date: Fri, 11 May 2012 13:47:18 -0000
X-Groupsio-MsgNum: 38655
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="fXStkuK2IQBfcDe+"
Content-Disposition: inline

--fXStkuK2IQBfcDe+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 11, 2012 at 08:45:50AM -0400, Bob Cochran wrote:
> Hello,
>=20
> I can find recipes for mime-support in both meta-openembedded and=20
> meta-openembedded-contrib under meta-oe/recipes-support.  The former has=
=20
> a 3.48 recipe and the latter has a 3.44 recipe.

meta-openembedded-contrib is used for pushing stuff by developers which
then send pull request to pull it to main meta-openembedded repo.

So it's normal that meta-openembedded-contrib has sometimes some newer
stuff and then the branches are not updated anymore and gets old.

Cheers,

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--fXStkuK2IQBfcDe+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk+tFhQACgkQN1Ujt2V2gBzXigCfRplsD4TGg0vTJYj+H4w8biyN
KQEAn08S0Um4WDLfEQLJsyOxAeFyjxic
=BORY
-----END PGP SIGNATURE-----

--fXStkuK2IQBfcDe+--
