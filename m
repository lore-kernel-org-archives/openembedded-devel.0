Received: from [71.117.236.31] (helo=desktop)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <markgross@thegnar.org>) id 1IpjT7-00088w-13
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Nov 2007 12:53:13 +0100
Received: by desktop (Postfix, from userid 1000)
	id 4BA232292D9; Wed,  7 Nov 2007 03:23:18 -0800 (PST)
Date: Wed, 7 Nov 2007 03:23:19 -0800
From: mark gross <markgross@thegnar.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20071107112319.GA20128@thegnar.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.15+20070412 (2007-04-11)
Subject: fectch checker task?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Nov 2007 11:53:13 -0000
X-Groupsio-MsgNum: 3295
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline

--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

would it be easy to create a task to do a quick sanity check on all the
packages that need to be downloaded for a build?  The linear search for
busted fetch calls is quite irritating.

What would such a task look like?
Is there a way to pass a parameter to the target to just do the fetch
step?

--mgross


--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iD8DBQFHMaAnhK5OsmQOmSARAq0FAJ4tegLNHZUYdS3WHkEt4kWhuPtwqwCfSbYB
lqi1mTt8Fkok/R56AkSxMxc=
=5u+Y
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--
