Return-Path: <martin.jansa@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1C665D80
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 18:20:36 +0000 (UTC)
Received: by mail-la0-f46.google.com with SMTP id pv20so1512163lab.5
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=2B53P2AF88t1Iva4UKFPDz3L1x+lj6/dVsTTFJA+0Uw=;
	b=F3oruJotbkhJG3cYWhv+cvY/3DR1AHH1IkBFVb5wBemZFd4qnwFlbUgCiWghOMZCZG
	ALNZXmB2TYQWAd+XYREqVyojwFvxhkE30Gj/DNzDX4P/D4Y0sIy/9ScogXK1IOrOP49R
	X9iMfz3GqnLtoCTPsSqp1CdrE2bYt85QVbnWNZzldwkrhv/pbq5OUNg03nsG3IHUb06r
	4qWBXVemF5SUKVu3Uyd9TMuURCS1CYncRPbFG/GWxZn5oC3hCdM5fUsOYoZrEfL2u83H
	eFdcmS9vFjKsrBUOQpMFe0fU1NfM7ETxicc32LtIG73s1FRLv1UbG1uLZainQUnggeqV
	1z7g==
X-Received: by 10.112.13.72 with SMTP id f8mr2355908lbc.40.1398882035675;
	Wed, 30 Apr 2014 11:20:35 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	jm3sm27073152lbc.29.2014.04.30.11.20.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Apr 2014 11:20:34 -0700 (PDT)
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Apr 2014 20:20:49 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: Tom King <ka6sox@gmail.com>, openembedded-devel@lists.openembedded.org
Message-ID: <20140430182049.GP2486@jama>
References: <53612125.8030702@digi.com>
	<1474887.TWMWxXuYEb@peggleto-mobl5.ger.corp.intel.com>
	<53613AA5.7040903@digi.com>
MIME-Version: 1.0
In-Reply-To: <53613AA5.7040903@digi.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-webserver] cherokee webserver SRC_URI broken again
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
X-List-Received-Date: Wed, 30 Apr 2014 18:20:38 -0000
X-Groupsio-MsgNum: 49623
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="QoIkmWtuMFGxyutv"
Content-Disposition: inline

--QoIkmWtuMFGxyutv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2014 at 08:02:13PM +0200, Javier Viguera wrote:
> Hi Paul,
>=20
> On 30/04/14 19:28, Paul Eggleton wrote:
> > I can't remember from our last discussion, did anyone talk to upstream =
about
> > the pain they are inflicting on some of their users with the lack of pr=
oper
> > source archives?
>=20
> I don't think anybody talked to upstream about the problem. The mailing=
=20
> list seems almost dead (looking at gmane[1] last email was on May/2013):
>=20
> <http://news.gmane.org/gmane.comp.web.cherokee.general>
>=20
> There seems to exist also other channels to contact (Google+, Facebook):
>=20
> <http://cherokee-project.com/doc/other_community.html>
>=20
> but I don't use neither of them (G+, FB) so I'm not sure how active the=
=20
> project is.
>=20
> Anyway I am leaving the office now for a short (4 days) break until=20
> Monday so in case we finally need to patch the recipe I can do that next=
=20
> week.

Tom, can you please put it on sources.oe.org?

You can find the archive on aruba.

Thanks

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--QoIkmWtuMFGxyutv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlNhPwEACgkQN1Ujt2V2gBx4iwCdFHU0YtJzyk56uI8XBa6BMOZP
3MsAnRG3/eiS8qG5M4c3B/cAt9lKBYhZ
=V31h
-----END PGP SIGNATURE-----

--QoIkmWtuMFGxyutv--
