Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f173.google.com (mail-we0-f173.google.com
	[74.125.82.173])
	by mail.openembedded.org (Postfix) with ESMTP id 433926FDD2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 14:21:25 +0000 (UTC)
Received: by mail-we0-f173.google.com with SMTP id t60so943412wes.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jun 2014 07:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=BLyeEQ6jVHkA6Gcim6cGbAzD32GzSyDfSNyiEuYagXM=;
	b=FSGCeJHbnTioJnNudwgr6a53cdDDxMIKYQviwTbfRUBhSyeeD8/FmnkYANwcZ+WLLS
	df8yQFhoJYhk7wn6UCV0zvjeYkMefEydh5Tw8k1rx1sJOxX7SOzqHdDhWHF7E4BRB+ly
	oMa0wCEWVoWdgdWJgAnMBtLxiJ1w35gA21RDpDD+csAYIBy4hw6ZL8Rh4bsQ1v/0K4gh
	fY3cuAvHEQj0YfEjyDhOOnhe1ZnzJKziZtbrtJzojR3iFSKf7rmflpm5pG1vck/bGjrv
	Jgqx32TCdNlmCXTrYR6X9bo3aMae7lWk8Q2jUmR5Cz24Y4/4bZd0wq5YL8T/FmDlUh3G
	KtIg==
X-Received: by 10.194.79.135 with SMTP id j7mr45665090wjx.56.1403101286349;
	Wed, 18 Jun 2014 07:21:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	h49sm5548801eeg.21.2014.06.18.07.21.25
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 18 Jun 2014 07:21:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 18 Jun 2014 16:21:25 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20140618142125.GJ2117@jama>
References: <20140430143741.GL2486@jama>
	<CAFeBWL5HuWex48xB_JZX_C7RMhzgfH93=AVJAkO7Qk7DUToFxg@mail.gmail.com>
	<20140505164514.GM2486@jama> <536A7C42.6030502@balister.org>
	<20140511145337.GE22774@jama> <20140616134850.GP2428@jama>
	<CAP9ODKr8=FnXhWranpckyRrPrHzpfCW-fYLxF4S1o_7sYRMFVA@mail.gmail.com>
	<CAOd_LFzTMonJL_17KyR6e-g8U_ByPRakj26n41qEY2-psOevsw@mail.gmail.com>
	<CAP9ODKr1QTT++D-iiAwT5LgftiZdmzT34xMM_2dkHF5Ti99KnA@mail.gmail.com>
	<CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOd_LFz4ArrStfheb4+KKhwhWPDft5BYjqNk7Y05Ja=oDk+ZSg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: daisy branch for meta-openembedded, meta-qt5 / maintainer wanted
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
X-List-Received-Date: Wed, 18 Jun 2014 14:21:30 -0000
X-Groupsio-MsgNum: 50393
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="cN519qCC4CN1mUcX"
Content-Disposition: inline

--cN519qCC4CN1mUcX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2014 at 10:04:52AM -0400, Cliff Brake wrote:
> On Wed, Jun 18, 2014 at 7:27 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>=20
> >
> > Are you willing to take meta-qt5 too?
>=20
> Sure.
>=20
> https://github.com/cbrake/meta-qt5/commits/daisy-to-merge

This looks like commit for master, daisy branch already exists and has
README files updated from:
https://github.com/meta-qt5/meta-qt5/commit/55dff304eff64e77338a82cfc5a0cb1=
ed5a07342

> I made some more updates to the meta-oe daisy branch:
>=20
> https://github.com/cbrake/meta-openembedded/commits/daisy-to-merge

Looks good.

> Otavio, Armin, would you like me to add your emails to the maintainer
> lists in these readme's as well?

Should I wait 1 more day before merging branch above for possible
maintainer additions?

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--cN519qCC4CN1mUcX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlOhoGUACgkQN1Ujt2V2gBxVUQCcCFGosImxWnumuGOgH/1GZFu1
CcUAoIKwk2FG//3ccOSymdiFK+vNpDDr
=DzGN
-----END PGP SIGNATURE-----

--cN519qCC4CN1mUcX--
