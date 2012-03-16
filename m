Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.rini@gmail.com>) id 1S8b8u-0002xU-DZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Mar 2012 18:40:44 +0100
Received: by dado14 with SMTP id o14so6824642dad.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Mar 2012 10:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=//7DIpzJT5pCySFB7NW/nQLB8qYV41z4oJQ6xJtXdE8=;
	b=w8STHBQJVTgjM5RsNVINDKAnNxPFHoA44fWLPSLJJxhibY2r7YxvmDfUFzEIDFUATa
	kfO0OtFffaiRAVDJPq6frvlt7lfwTTx7ImCvDrlnJMGyZrplRXtbmk/HA+tWvC/FO3gv
	XhUUZ7h5pbOmvxXyJm0cWJpV1NsOFXDRuIXDEiL5cT/0KR5qxMlLVsnglz98DYRErtM0
	Siu4Tt0bjBzOYXMdRcED7pX7MWdSNRWmxakAo80E1d0J0HEEqw/VhUtbl+QDR4yP0Wgm
	Pdr+rEl/9osA0GFWandxWirwJJ0WcP9K3eICnkIKA220NqM6GHth9lFc3mgdgn/s9uT6
	cQsw==
Received: by 10.68.230.230 with SMTP id tb6mr17100298pbc.40.1331919115082;
	Fri, 16 Mar 2012 10:31:55 -0700 (PDT)
Received: from bill-the-cat (ip68-230-54-74.ph.ph.cox.net. [68.230.54.74])
	by mx.google.com with ESMTPS id r9sm4711507pbi.53.2012.03.16.10.31.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 10:31:54 -0700 (PDT)
Date: Fri, 16 Mar 2012 10:31:52 -0700
From: Tom Rini <tom.rini@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Message-ID: <20120316173152.GA31661@bill-the-cat>
References: <cover.1330097955.git.sledz@dresearch-fe.de>
	<cover.1331724547.git.sledz@dresearch-fe.de>
MIME-Version: 1.0
In-Reply-To: <cover.1331724547.git.sledz@dresearch-fe.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Koen Kooi <koen@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [2011.03-maintenance 0/7] pull request 20120314
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
X-List-Received-Date: Fri, 16 Mar 2012 17:40:44 -0000
X-Groupsio-MsgNum: 37809
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 14, 2012 at 12:34:06PM +0100, Steffen Sledz wrote:

> Hi Tom,
>=20
> please pull these commits cherry-picked from oe.dev.
>=20
> The first one fixes a build problem with net-snmp and libnl.
> The others fix various fetch problems. All are well tested in
> our own environment.
>=20
> This request replaces my pull request 20120224 which was rejected
> by you with the wish to use shapshot.debian.org for various SRC_URIs.

Applied, thanks!

--=20
Tom

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk9jeQgACgkQdZngf2G4WwOT4wCeJVjCVWw1A1caCEFTGp38xt/I
7PAAniP/bd02QIdMRn9xYNx0FduZV1U6
=kofw
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
