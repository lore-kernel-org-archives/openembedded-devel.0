Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f47.google.com (mail-ee0-f47.google.com [74.125.83.47])
	by mail.openembedded.org (Postfix) with ESMTP id 976876B110
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 07:02:44 +0000 (UTC)
Received: by mail-ee0-f47.google.com with SMTP id d49so3248510eek.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Aug 2013 00:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=4XQM4NrtTc+MBxMPyFRThJIhyfpd10Hgm2EfuEiUiQQ=;
	b=EHz34eyM1ztxMi1LOcu1SzC+BIFvX8LqvIv1zG+/aHn5FcXnbpNsmACtW3ubXH19ay
	Lq+AuaFWVtljR2DrvDVFdrscbUWhWppz4nvBJ4PFVGya75ReIZaGZdxael5AYsZGDaF6
	L6xqcmlL8n8yJEuQ/zahaxk3OBXykx6COzKiEq37uixHYrgr8iHcxtgvDmUGTDUJ4Y9S
	eXaZwaczUMcPzukjnwXs0eFfrEj9W2SxhSTYxSMMBXRCsKGHzuOZ8PZl6RKGfxydxxZO
	Fc9HvTJ65GceB29Nv7+rzP4Y5eUgkyyAd16v8x5UIAJPtS3hk5mz1BsQ7Qre0OxLUn2f
	m7Yg==
X-Received: by 10.15.98.203 with SMTP id bj51mr24376626eeb.22.1376290964830;
	Mon, 12 Aug 2013 00:02:44 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k3sm54865041een.16.2013.08.12.00.02.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 12 Aug 2013 00:02:44 -0700 (PDT)
Date: Mon, 12 Aug 2013 09:03:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20130812070333.GI17945@jama>
References: <cover.1376281943.git.hongxu.jia@windriver.com>
	<b924f5411208349fcab702a887b1bfd30a182fd7.1376281943.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
In-Reply-To: <b924f5411208349fcab702a887b1bfd30a182fd7.1376281943.git.hongxu.jia@windriver.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [meta-cpan 1/3] meta-cpan creation
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 12 Aug 2013 07:02:45 -0000
X-Groupsio-MsgNum: 45640
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BghK6+krpKHjj+jk"
Content-Disposition: inline

--BghK6+krpKHjj+jk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2013 at 12:35:38PM +0800, Hongxu Jia wrote:
> ---
>  COPYING.MIT     | 17 +++++++++++
>  README          | 88 +++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  conf/layer.conf | 10 +++++++
>  3 files changed, 115 insertions(+)
>  create mode 100644 COPYING.MIT
>  create mode 100644 README
>  create mode 100644 conf/layer.conf
>=20
> diff --git a/COPYING.MIT b/COPYING.MIT
> new file mode 100644
> index 0000000..89de354
> --- /dev/null
> +++ b/COPYING.MIT
> @@ -0,0 +1,17 @@
> +Permission is hereby granted, free of charge, to any person obtaining a =
copy
> +of this software and associated documentation files (the "Software"), to=
 deal
> +in the Software without restriction, including without limitation the ri=
ghts
> +to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
> +copies of the Software, and to permit persons to whom the Software is
> +furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be included =
in
> +all copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS =
OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL =
THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING =
FROM,
> +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
> +THE SOFTWARE.
> diff --git a/README b/README
> new file mode 100644
> index 0000000..091da85
> --- /dev/null
> +++ b/README
> @@ -0,0 +1,88 @@
> +meta-cpan
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +This layer provides commonly-used perl libraries in the Comprehensive
> +Perl Archive Network.
> +
> +Contents and Help
> +-----------------
> +
> +In this section the contents of the layer is listed, along with a short
> +help for each package.
> +
> +         -- libdbi-perl --
> +         The DBI is a database access module for the Perl programming la=
nguage.
> +         It defines a set of methods, variables, and conventions that pr=
ovide
> +         a consistent database interface, independent of the actual data=
base
> +         being used.
> +                      |<- Scope of DBI ->|
> +                           .-.   .--------------.   .-------------.
> +           .-------.       | |---| XYZ Driver   |---| XYZ Engine  |
> +           | Perl  |       | |   `--------------'   `-------------'
> +           | script|  |A|  |D|   .--------------.   .-------------.
> +           | using |--|P|--|B|---|Oracle Driver |---|Oracle Engine|
> +           | DBI   |  |I|  |I|   `--------------'   `-------------'
> +           | API   |       | |...
> +           |methods|       | |... Other drivers
> +           `-------'       | |...
> +                           `-'
> +
> +        -- libdbd-sqlite-perl --
> +        DBD::SQLite is a Perl DBI driver for SQLite, that includes the e=
ntire
> +        thing in the distribution. So in order to get a fast transaction=
 capable
> +        RDBMS working for your perl project you simply have to install t=
his
> +        module, and nothing else.
> +
> +        usage: there is a test case to show you how it works
> +
> +        1) vim local.conf:
> +        ...
> +        IMAGE_INSTALL_append =3D " libdbd-sqlite-perl"
> +        PERL_DBM_TEST =3D "1"
> +        ...
> +        2) build core-image-sato and boot the target
> +
> +        3) run "sqlite-perl-test.pl" on target. This script includes five
> +           operations create/insert/update/delete/select to do with a ta=
ble.
> +
> +        More information can be found in the recipe's git log.
> +
> +Dependencies
> +------------
> +
> +This layer depends on:
> +
> +  URI: git://git.openembedded.org/openembedded-core
> +  branch: master
> +  revision: HEAD
> +  prio: default
> +
> +Adding the meta-cpan layer to your build
> +---------------------------------------
> +
> +In order to use this layer, you need to make the build system aware of
> +it.
> +
> +Assuming the meta-cpan layer exists at the top-level of your
> +yocto build tree, you can add it to the build system by adding the
> +location of the meta-cpan layer to bblayers.conf, along with any
> +other layers needed. e.g.:
> +
> +  BBLAYERS ?=3D " \
> +    /path/to/oe-core/meta \
> +    /path/to/layer/meta-cpan \
> +
> +Maintenance
> +-----------
> +
> +Send patches / pull requests to openembedded-devel@lists.openembedded.or=
g with
> +'[meta-cpan]' in the subject.

Looks good, but it would be nice to add git send-email example like
other layer/README have in meta-oe (maybe except meta-networking).

> +
> +Layer maintainer: Hongxu Jia <hongxu.jia@windriver.com>
> +
> +License
> +-------
> +
> +All metadata is MIT licensed unless otherwise stated. Source code includ=
ed
> +in tree for individual recipes is under the LICENSE stated in each recipe
> +(.bb file) unless otherwise stated.
> +
> diff --git a/conf/layer.conf b/conf/layer.conf
> new file mode 100644
> index 0000000..11da11f
> --- /dev/null
> +++ b/conf/layer.conf
> @@ -0,0 +1,10 @@
> +# We have a conf and classes directory, add to BBPATH
> +BBPATH .=3D ":${LAYERDIR}"
> +
> +# We have recipes-* directories, add to BBFILES
> +BBFILES +=3D "${LAYERDIR}/recipes-*/*/*.bb \
> +	${LAYERDIR}/recipes-*/*/*.bbappend"
> +
> +BBFILE_COLLECTIONS +=3D "perl"

I don't have strong opinion either way, but lets call this layer
meta-perl or meta-cpan and use the same name in BBFILE_COLLECTIONS.

meta-perl would be more generic (matching with meta-ruby) and maybe
we'll need to add some perl related recipes which aren't from cpan?

> +BBFILE_PATTERN_perl =3D "^${LAYERDIR}/"
> +BBFILE_PRIORITY_perl =3D "6"
> --=20
> 1.8.1.2
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--BghK6+krpKHjj+jk
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.20 (GNU/Linux)

iEYEARECAAYFAlIIiMUACgkQN1Ujt2V2gBzkrwCeOeB9/GQKqVCarrLuw2s3Y88k
CRsAn1/T9bOwEdktz/ZGoy9SmLzlaSoC
=XkVX
-----END PGP SIGNATURE-----

--BghK6+krpKHjj+jk--
