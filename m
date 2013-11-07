Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id F1D6B6D3A7
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Nov 2013 09:38:04 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id e51so158269eek.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Nov 2013 01:38:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=d9ZbXawrqetMOT25H+1de7LenYqJ4TkFK5+ZflW9nEM=;
	b=OYeqE4ri9QS82rD64q0fs5WcYBPWzkee+8mLKXwnE4Cn34EtnMdxkbdGn8Y0c3CzWp
	vqWMFpUcz0GWmAy5URbKaT767gxj8T6aGoL8Bw0BvXvsCaXXwkwoUv8CWP/tywkyekOm
	EVRHylN+cWwDeNEm5a9TqZWbjeosfYK1gvk40oRANJtyPrnqjqk+3ZgrDHiY/LFL23lU
	0olA3Uef4DwylYDSb2TdHnQZMYVkiPxL0ZO3dUurVNAGZFKv64FEr8hiMaUxIy82H+7T
	pfCXUEg6CF9iXCG8yOAMyivDUIneqCCmbf1yQzm9LsnnVx10A0rK14sEHOrfqhqhhj3U
	0qyg==
X-Received: by 10.14.241.141 with SMTP id g13mr880322eer.75.1383817085833;
	Thu, 07 Nov 2013 01:38:05 -0800 (PST)
Received: from localhost (ip-89-176-104-107.net.upcbroadband.cz.
	[89.176.104.107])
	by mx.google.com with ESMTPSA id 8sm6872217eem.15.2013.11.07.01.38.04
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 Nov 2013 01:38:04 -0800 (PST)
Date: Thu, 7 Nov 2013 10:38:18 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Zongchun YU <b40527@freescale.com>
Message-ID: <20131107093818.GB3682@jama>
References: <1383792523-9623-1-git-send-email-Zongchun.Yu@freescale.com>
	<20131107091210.GA3682@jama> <006401cedb9d$209a3ad0$61ceb070$@com>
MIME-Version: 1.0
In-Reply-To: <006401cedb9d$209a3ad0$61ceb070$@com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Cc: Zongchun.Yu@freescale.com, openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCHv2] tcpdump, tcpreplay:relocate tcpdump and add tcpreplay recipe
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
X-List-Received-Date: Thu, 07 Nov 2013 09:38:05 -0000
X-Groupsio-MsgNum: 47036
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="v9Ux+11Zm5mwPlX6"
Content-Disposition: inline

--v9Ux+11Zm5mwPlX6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 07, 2013 at 05:38:30PM +0800, Zongchun YU wrote:
> >Can you update the packagegroup in meta-oe which depends on tcpdump?
> >PACKAGECONFIG or just dropping tcpdump from it is fine with me.
>=20
> Martin, please see the last parts of the patch. I have dropped tcpdump in
> the packagegroup recipe And it is fine with me too.

Sorry I was blind, thanks!

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--v9Ux+11Zm5mwPlX6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlJ7X4oACgkQN1Ujt2V2gBzeEQCguXTwe6oYfyQjdJPNwiSS8r7U
V4wAn3kXhd1QyfBr/Bwu2+H+2LD+uOnc
=ARGW
-----END PGP SIGNATURE-----

--v9Ux+11Zm5mwPlX6--
