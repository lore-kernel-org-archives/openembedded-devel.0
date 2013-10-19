Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id 71C5F612D1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 14:10:12 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id t10so2663155eei.40
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Oct 2013 07:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=OILwoDsi27UCrX7qCp6ki5JfJoMLBs71zqFzOekF9Dw=;
	b=KtOE2AH90Dvu1TixHPmYkZr3tEe2Eg12iVtQK6Irgwnb1XGb7cGl03DO7euK3FRwGa
	1iNPtwVjH0wsDHYDpZZqLvNbQqlDIlLQiIBOnYeMM1kkCUXjGXzIZuNFfBmuZfdq967N
	NelMoKVX0vHUjBxwykNOgjeodR6MCukXT46d/fhvtevkJCpmwGgRv1mndBF/gdEFaGcq
	g5rS/Odc3Qfv/xnTTnUJ6L5cR6KRRY9rc6BmzdyTdt0ulqhMchOxAH0zNY+2xrTFBnUJ
	T2mILxOJraLLRkZO066rxc3Gv2B9IhhZbULOygn7cg8pH+IthidMOIYrn7xwqcyZAPJt
	FNKg==
X-Received: by 10.15.54.199 with SMTP id t47mr11065975eew.46.1382191813878;
	Sat, 19 Oct 2013 07:10:13 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	k7sm18135222eeg.13.2013.10.19.07.10.12 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 19 Oct 2013 07:10:12 -0700 (PDT)
Date: Sat, 19 Oct 2013 16:10:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Anders Darander <anders@chargestorm.se>
Message-ID: <20131019141020.GI3930@jama>
References: <cover.1381920288.git.anders@chargestorm.se>
	<cace5960-a68e-4774-911d-debd3fc71b6d@email.android.com>
	<20131018094009.GF3930@jama>
	<29fe97d5-76b0-4898-bc80-9af1aef64855@email.android.com>
MIME-Version: 1.0
In-Reply-To: <29fe97d5-76b0-4898-bc80-9af1aef64855@email.android.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Breakpad and ktap recipes
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
X-List-Received-Date: Sat, 19 Oct 2013 14:10:13 -0000
X-Groupsio-MsgNum: 46820
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="sl5MdczEF/OU2Miu"
Content-Disposition: inline

--sl5MdczEF/OU2Miu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 19, 2013 at 10:17:26AM +0200, Anders Darander wrote:
>=20
>=20
> Martin Jansa <martin.jansa@gmail.com> wrote:
> >On Fri, Oct 18, 2013 at 07:14:09AM +0200, Anders Darander wrote:
> >> I'm going to resend this series with the correct prefix added.=20
> >
> >Are they the same, just with prefix added?
>=20
> Yes, they are the same. Had I known that you already had them included in=
 the last Jenkins build, I wouldn't have resent them.=20
>=20
> So no need to fetch a new version.=20

OK, thanks.

BTW: If you check patchwork
http://patchwork.openembedded.org/project/oe/list/
and your patches are Archived and in "in-test" bundle, then it means
that they are already included for Jenkins build.

But there are some issues with latest patchwork version, so maybe it
doesn't work for you (it works for me).

More info about my patchwork work flow:
http://www.openembedded.org/wiki/Patchwork#Multiple_layers_sharing_the_same=
_oe_project_on_patchwork

>=20
> Cheers,=20
> Anders=20
>=20
> >I've already included them in last jenkins builds, so to know if I
> >should fetch new version from patchwork or not.
> >
> >> Anders Darander <anders@chargestorm.se> wrote:
> >> >
> >> >These are a couple of recipes that we've been using internally for
> >some
> >> >time. They
> >> >were developed and mostly used on a dylan-based setup. Testing has
> >> >primarily been=20
> >> >performed on ARM, both qemuarm and our custom machine.
> >> >
> >> >Breakpad is a crash reporting tool, that's getting a wider use.
> >> >Please, let me know if there's a more efficient way (or otherwise
> >> >better way) to=20
> >> >have the bbclass generate the symbol file.
> >> >
> >> >Ktap is a new scripting dynamic tracing tool for Linux. This recipe
> >> >will be of
> >> >use until everyone is on 3.13+ kernels (ktap has been merged for the
> >> >3.13 series).
> >> >
> >> >The following changes since commit
> >> >f8903f53db717294d63a8d79b5ef7ca34b3c189e:
> >> >
> >> >libhugetlbfs: install perl lib to directory perl instead of perl5
> >> >(2013-10-15 13:43:53 +0200)
> >> >
> >> >are available in the git repository at:
> >> >
> >> >  git://github.com/darander/meta-oe breakpad-ktap
> >> >  https://github.com/darander/meta-oe/tree/breakpad-ktap
> >> >
> >> >Anders Darander (2):
> >> >  breakpad: add initial recipe
> >> >  ktap: add initial recipe
> >> >
> >> > meta-oe/classes/breakpad.bbclass                  | 32 ++++++++++
> >> >meta-oe/recipes-devtools/breakpad/breakpad_svn.bb | 72
> >> >+++++++++++++++++++++++
> >> > meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb    | 19 ++++++
> >> > meta-oe/recipes-kernel/ktap/ktap.inc              | 11 ++++
> >> > meta-oe/recipes-kernel/ktap/ktap_0.3.bb           | 17 ++++++
> >> > 5 files changed, 151 insertions(+)
> >> > create mode 100644 meta-oe/classes/breakpad.bbclass
> >> > create mode 100644
> >meta-oe/recipes-devtools/breakpad/breakpad_svn.bb
> >> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap-module_0.3.bb
> >> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap.inc
> >> > create mode 100644 meta-oe/recipes-kernel/ktap/ktap_0.3.bb
> >>=20
> >> --=20
> >> ChargeStorm AB / eStorm=20
> >> _______________________________________________
> >> Openembedded-devel mailing list
> >> Openembedded-devel@lists.openembedded.org
> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>=20
> --=20
> Anders Darander
> ChargeStorm AB=A0=A0=A0=A0=A0=A0=A0=A0=A0 Tel: +46 702 44 84 36
> Laxholmstorget 3=A0=A0=A0=A0=A0=A0=A0 Email: anders@chargestorm.se
> 602 21 Norrk=F6ping=A0=A0=A0=A0=A0=A0 Web: www.chargestorm.se
>=20
> Sent from my Android phone with K-9 Mail. Please excuse my brevity.

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--sl5MdczEF/OU2Miu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJikswACgkQN1Ujt2V2gBxG7ACdFqNQ3qGvLknXMHIshH4FWtXe
heoAoKmAWVgE/k7ehjvPp1czspek/nJr
=3E+L
-----END PGP SIGNATURE-----

--sl5MdczEF/OU2Miu--
