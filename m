Return-Path: <eren@hambedded.org>
Received: from mail-bk0-f51.google.com (mail-bk0-f51.google.com
	[209.85.214.51])
	by mail.openembedded.org (Postfix) with ESMTP id 422B36BDAA
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Sep 2013 08:53:04 +0000 (UTC)
Received: by mail-bk0-f51.google.com with SMTP id mx10so8893bkb.38
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Sep 2013 01:53:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mime-version
	:content-type:content-disposition:user-agent;
	bh=dfc1bl58zpnf0XrVesBG14B5SAw/oRFoOPK9czlPWms=;
	b=KtmFbx6PSLhP6X4vhokuaz8e323tFMJ7GKT0rdSyX4T8eRseL6NDm4a9dpS1+m76il
	zzh960lGukWhtEOLU6jHjVewxI/dIUK1Hin9+7flNL3VXdEAXEP8onRYzRnCQfs5N6d2
	/4aQoUw3KuDznucGi6mwNkqS7BuLHvxGUrCrBccpoyhnB/pUu2s7gVlM6AbHABRwVp5J
	3Fv+Njrm1abjvSVyaZu92vfSTpDKoxKjdikVPbiAlivj49JcVpHVpj8d0BI/ndyqZR8I
	U9hNQOKb/s/6QdUZ8GShNBw00FoPF+hc9Jc/+//e9Bi/BMJ484em9OgglNeHb0boNsce
	w3lw==
X-Gm-Message-State: ALoCoQm6dwMV9lGAOcGatHO8emunAT7SymGb43AWzrydzkosihj6myoD93IbALCy02TwMUN67oA4
X-Received: by 10.205.35.15 with SMTP id su15mr1393088bkb.21.1378284785545;
	Wed, 04 Sep 2013 01:53:05 -0700 (PDT)
Received: from localhost ([132.231.11.113])
	by mx.google.com with ESMTPSA id kk2sm5825532bkb.10.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 01:53:04 -0700 (PDT)
Date: Wed, 4 Sep 2013 10:53:04 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20130904085304.GA94916@airo.local>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: UTF-8 Encoding Problem in List Archives
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
X-List-Received-Date: Wed, 04 Sep 2013 08:53:05 -0000
X-Groupsio-MsgNum: 46059
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline

--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I noticed that commit e-mails in openembedded-commits list archives do
not have UTF-8 support for headers. Although the patch e-mail contains
charset=3D"utf-8", the archive subject is not human-readable, which makes
my name (probably others) unreadable.

Please look at the end of the page below:

http://lists.openembedded.org/pipermail/openembedded-commits/2013-September=
/thread.html

It seems that this is a mailman encoding problem.

Of course, I can use ASCII characters only in my name. However, it is
2013 and the world should have fixed these kind of problems long ago :)

Regards,
Eren

--=20
    . 73! DE TA1AET
      http://linkedin.com/in/erenturkay

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJSJvTvAAoJEOM7bMm6HhcTYLAP/iLCfo4U3RnASZNriHVXCyPo
+pEBcruuWBu5Y11vcHjRrlgqyMF2OQciX098cu3CjnUlxZzsxJEVN6kXYdptcMuQ
4CDKkQAYcMgg+AeeJ50jDUw5EFiyBq0BlMKXHvmmjg9m5qOM4dKCVbFJOKPeGYdX
wlMmFaPfTM3kmm3OOKU0guEZ+c4HNy5VRRsOdYAUvZv4K3o43vsrcOj3vK+8vHhA
EYnXqJheFPLrkpE6fl30c6HSCVnuta77Se/YBePfrzYGVS6Jko82MtFeAw17OD2l
t5PEvsEs27Gn/uHILpJNg1EWV8G1TYVuiGCcFtSHGmMBnjVZJHJJlh75qm8MegNq
Zw8Pd9bfe5xS+1HEijegtaS1WKOBFjOUoUAIeGwLczmiOmYeN2QufcXrxD7vmRbv
d/Z7YGtpv3R+ricsaLIsg4SJHg1JSX6nDEANj3+bHzcbZov3YvNsSih4qd1R68R1
zP0pzvreZIKfyORJTFTKvRAn8CzkjVRrWnlhV69Pn4/hSOokY9qBA4IIjlB1qnPA
lTYfh0QYbH0IK0sX6N/+l9CJEu+r76RA/ZxTQdYSXGmTqNUaqHfwmHlyHaZO7ahs
4WYAiKJ0Rx7/DdNKdzcq9mnHn2qDV4cz08usCnutXT9xHK1AcHsC4agslkTChDIH
Q3fTkJLZgrRktuP8TAjE
=3EJp
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
