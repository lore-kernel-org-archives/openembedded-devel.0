Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q2MLh-0001rf-NW
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Mar 2011 12:35:37 +0100
Received: by bwz10 with SMTP id 10so6416456bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Mar 2011 04:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=RhXQ4pEmpFjmNXzx+TFz9uOJdH6u3oxLPop+ZuHWA3o=;
	b=Dd2juFuVeHl3fLjxEsZ2psSJDQDIwTFDgVY9yCEYMQwMprducIattCxqxU71mXJhxR
	x7H/r5a7RHLDsS5x8MkSs9EhH1j0zV4qF94jEj/yRJxMI2x48liIuNMjt7yfJ/zYgtjr
	GhUi+pKoUq+Z6cppPzLA16pMl7rRA8yEfIoh4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Q3aujGiEK/R+cmA+zLN3EIRgx1IzHaGLjKww599Cg9+aA9JKKPLkvi+EJMBeEjhRRn
	VFct1q5nWD94CRAiGEXSbl6jUc4FXWMUK5Ob7SluYd6e8oiS6ykLxGRqzw/C1CCFSTLD
	y9WDvr3PX6Wf6TgW/LUwzzXoNNKi4XRLTJFDc=
Received: by 10.204.127.129 with SMTP id g1mr5937017bks.39.1300880026940;
	Wed, 23 Mar 2011 04:33:46 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id l1sm2065335bkl.1.2011.03.23.04.33.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 23 Mar 2011 04:33:46 -0700 (PDT)
Date: Wed, 23 Mar 2011 12:33:39 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110323113339.GF3418@jama.jama.net>
References: <1300456829-25755-1-git-send-email-Martin.Jansa@gmail.com>
	<1300456829-25755-4-git-send-email-Martin.Jansa@gmail.com>
	<20110323104413.GG21392@excalibur.local>
MIME-Version: 1.0
In-Reply-To: <20110323104413.GG21392@excalibur.local>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH 04/12] libnl_git: remove fix-pktloc-dep-race.patch from this version
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
X-List-Received-Date: Wed, 23 Mar 2011 11:35:38 -0000
X-Groupsio-MsgNum: 30547
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="l+goss899txtYvYf"
Content-Disposition: inline

--l+goss899txtYvYf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 23, 2011 at 11:44:19AM +0100, Stefan Schmidt wrote:
> Hello.
>=20
> On Fri, 2011-03-18 at 15:00, Martin Jansa wrote:
> > * it does not apply because there isn't pktloc in this SRCREV yet,
> >   commented out in upstream src/lib/Makefile.am
>=20
> Hmm, does this mean we are behind the latest release with our _git
> recipe?

Yes, it's older than libnl_2.0.0 as PV says
PV =3D "1.9+gitr${SRCPV}"

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--l+goss899txtYvYf
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (GNU/Linux)

iEYEARECAAYFAk2J2pMACgkQN1Ujt2V2gBwFLwCePtW2M1K8qBJ4dhZYRwSeA7C+
FkoAniYZvqMx0AS/hL0GdiJh/Gt9nk+f
=LFTQ
-----END PGP SIGNATURE-----

--l+goss899txtYvYf--
