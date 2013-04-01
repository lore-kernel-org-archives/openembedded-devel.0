Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>)
	id 1UMehd-0002iJ-FK; Mon, 01 Apr 2013 15:23:13 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31D61tp027266
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 06:06:02 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 1 Apr 2013 06:06:02 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 6540A7FCE;
	Mon,  1 Apr 2013 09:05:07 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id A7CC82007F; Mon,
	1 Apr 2013 09:06:00 -0400 (EDT)
Date: Mon, 1 Apr 2013 09:06:00 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130401130600.GE10672@windriver.com>
References: <3982011.Guen6pOcoq@helios> <20130401104758.GB9978@windriver.com>
	<1410613.FPl62IiBfB@helios>
MIME-Version: 1.0
In-Reply-To: <1410613.FPl62IiBfB@helios>
X-URL: http://github.com/joeythesaint/joe-s-common-environment/tree/master
X-Configuration: git://github.com/joeythesaint/joe-s-common-environment.git
X-Editor: Vim-703 http://www.vim.org
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: yocto@yoctoproject.org, openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] New OE layer index now available
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
X-List-Received-Date: Mon, 01 Apr 2013 13:23:13 -0000
X-Groupsio-MsgNum: 43832
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RpqchZ26BWispMcB"
Content-Disposition: inline

--RpqchZ26BWispMcB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Re: [OE-core] New OE layer index now available] On 13.04.01 (Mon 12:57) Pa=
ul Eggleton wrote:

> On Monday 01 April 2013 06:47:59 Joe MacDonald wrote:
> > I like it, though I have a couple of questions about the accounts
> > themselves.
> >=20
> >    - Any chance we could have them connected (or use the same
> >      credentials as) the patchworks ones?
>=20
> Seems like they are both based on Django so I guess it would be possible;=
 the=20
> only impediment (assuming there was no Django version mismatch) would be =
that=20
> patchwork is currently on different infrastructure.

Okay, that's sort of what I figured, but I thought I'd ask anyway.  I
would love it as a layer maintainer to have a single dashboard I could
log into and get the whole view.  It may be that this is something I
rarely use anyway, though, in comparison to patchworks, so the effort of
connecting these two pieces isn't worth it.

> >    - If not, what options can we set on accounts?  Right now I just see
> >      "log out" and "change password".  Both pretty important, but I'd
> >      also like to add alternate email addresses, for example, since I
> >      use two quite regularly and update meta-networking from both.
>=20
> There's no alternate email address field; one could be added I suppose bu=
t the=20
> question is, how would you like this to be used within the index?

I don't know?  :-)  Honestly, not really all that sure what I'm looking
at here, but I'm thinking that if making updates in the interface to
layer information is tied to an email address, it'd be convenient for me
to log in as one username and have both my common email addresses
associated with it (with one being the primary, I guess).  Or to have
the ability to change the email address as necessary.

--=20
-Joe MacDonald.
:wq

--RpqchZ26BWispMcB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFZhjgACgkQPN8S4W6ZZncVDACfVEpYDaP1SbxlcXPvpGB/RXlH
xvgAnA2cInnVLkMEQWdUGVqTk8tOlVNo
=XlBv
-----END PGP SIGNATURE-----

--RpqchZ26BWispMcB--
