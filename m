Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Joe.MacDonald@windriver.com>) id 1UMcY3-0000Qb-QM
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Apr 2013 13:05:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31Am0NN025484
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 03:48:00 -0700 (PDT)
Received: from yow-jmacdona-d1.ottawa.wrs.com (128.224.146.66) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 1 Apr 2013 03:48:00 -0700
Received: from yow-jmacdona-l1 (unknown [172.25.44.2])	by
	yow-jmacdona-d1.ottawa.wrs.com (Postfix) with ESMTP id 11C517FCE;
	Mon,  1 Apr 2013 06:47:06 -0400 (EDT)
Received: by yow-jmacdona-l1 (Postfix, from userid 1000)	id 419602007F; Mon,
	1 Apr 2013 06:47:59 -0400 (EDT)
Date: Mon, 1 Apr 2013 06:47:59 -0400
From: Joe MacDonald <Joe.MacDonald@windriver.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Message-ID: <20130401104758.GB9978@windriver.com>
References: <3982011.Guen6pOcoq@helios>
MIME-Version: 1.0
In-Reply-To: <3982011.Guen6pOcoq@helios>
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
X-List-Received-Date: Mon, 01 Apr 2013 11:05:12 -0000
X-Groupsio-MsgNum: 43829
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wzJLGUyc3ArbnUjN"
Content-Disposition: inline

--wzJLGUyc3ArbnUjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[[OE-core] New OE layer index now available] On 13.03.29 (Fri 21:34) Paul E=
ggleton wrote:

> Hi folks,
>=20
> There is a new index for OpenEmbedded layers available here:
>=20
>   http://layers.openembedded.org
>=20
> It can be used to browse and search for existing layers, as well as the=
=20
> recipes and machines contained within them. In addition to the short=20
> description, repository location and usage link we were collecting in the=
=20
> existing wiki, we can now store information on maintainers, layer=20
> dependencies, and the associated mailing list, as well as a longer=20
> description. New layers can be submitted easily using a simple form which=
 does=20
> not require a login.
>=20
> I've imported all the data from the existing index on the OE wiki and fil=
led
> in the blanks by hand - please check the entries for your layers and if I=
've=20
> missed anything or entered something incorrectly, please let me know (rep=
ly=20
> off-list) and I'll fix it; alternatively if you're already listed as the=
=20
> maintainer of a layer you can create an account with the same email addre=
ss=20
> and you'll be able to edit the entry yourself at any time.
>=20
> The index also supports multiple branches, but for the moment there is on=
ly a=20
> master branch configured as I'd like to have people check the layer data =
before=20
> adding the additional stable branches (danny and denzil).
>=20
> Feedback on the new site is welcome. The code is also available in case y=
ou=20
> want to take a look / improve something - see the TODO file for possible =
future=20
> improvements:
>=20
>   http://git.yoctoproject.org/cgit/cgit.cgi/layerindex-web/
>=20
> Once people have had a chance to give feedback I'll replace the content o=
f the=20
> existing OE wiki page with a link to the new index.

I like it, though I have a couple of questions about the accounts
themselves.

   - Any chance we could have them connected (or use the same
     credentials as) the patchworks ones?

   - If not, what options can we set on accounts?  Right now I just see
     "log out" and "change password".  Both pretty important, but I'd
     also like to add alternate email addresses, for example, since I
     use two quite regularly and update meta-networking from both.

--=20
-Joe MacDonald.
:wq

--wzJLGUyc3ArbnUjN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAlFZZd4ACgkQPN8S4W6ZZneB3QCfYHFqPs0osZPRC0xnWgKNO/4l
+04AnRpSJT0ExCiCzto3r3PpFUh973KX
=uWQ8
-----END PGP SIGNATURE-----

--wzJLGUyc3ArbnUjN--
