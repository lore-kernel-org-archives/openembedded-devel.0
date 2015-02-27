Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 7C51072491
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 08:30:53 +0000 (UTC)
Received: by wesq59 with SMTP id q59so18345698wes.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Feb 2015 00:30:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=8q8SZlS5eSelfb1oyyJHL6NnGMSc+wAKJ+6OilZvFEA=;
	b=kPMBQWYtr2WAiP/OKAroyx+9qdfvn0IZzG3wrxx7cW/X8aMPisVMeJ54q9wjP2Trj4
	9Ncnx4wDE05CU1r9RjX2DbHgPmINFqzE1/JSW2DziNdmXcbaTYkqfQhLBtTrtdwdUPHI
	nfW3Q4kjvn5xiVMFwK0x9JA4i2S97HtXRdhLpmhUtsoj2U2icX8zLysWLValTvvAMMO+
	hlBlKADnFsk90XpcKBixKJ9OYoFFRizG0X731XRaORksN2/zoe99atC6jNXjrSdsCN3Y
	UXO+gfieJ6v3rCjESvt7fL4g0haMmT3wb4j3m/dgGmtzl8K4uDKRbutH/c2qn2xcBOwJ
	CyGg==
X-Received: by 10.194.243.1 with SMTP id wu1mr25809179wjc.69.1425025854914;
	Fri, 27 Feb 2015 00:30:54 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	gz3sm1770405wib.1.2015.02.27.00.30.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 00:30:54 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Fri, 27 Feb 2015 09:31:13 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150227083113.GF2309@jama>
References: <54ED1B78.4040101@balister.org>
MIME-Version: 1.0
In-Reply-To: <54ED1B78.4040101@balister.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][dizzy]Update PyQt and related recipes
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
X-List-Received-Date: Fri, 27 Feb 2015 08:30:56 -0000
X-Groupsio-MsgNum: 54521
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R6sEYoIZpp9JErk7"
Content-Disposition: inline

--R6sEYoIZpp9JErk7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2015 at 04:46:48PM -0800, Philip Balister wrote:
> Please pull these three patches into meta-oe/dizzy.
>=20
> https://github.com/openembedded/meta-oe/pull/19
>=20
> These lead to a working PyQt4, which will reduce the number of questions
> I get about gnuradio-companion not working on dizzy.

I'm not sure if we should do upgrades in release branch which should
receive only bug fixes, but I'll let daisy maintainers to decide.

> 1) I apologize for using the meta-oe repo instead of meta-openembedded.
> 2) If this is annoying, I can send via email like a sane person.
>=20
> Philip
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R6sEYoIZpp9JErk7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEUEARECAAYFAlTwK1EACgkQN1Ujt2V2gByTEQCYntO5nhGi0dVhKXhI1nJ1NAaw
iACfUI+fJb55yztA6qBFa0pjs7kmzZY=
=Smuq
-----END PGP SIGNATURE-----

--R6sEYoIZpp9JErk7--
