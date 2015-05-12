Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com
	[209.85.220.51])
	by mail.openembedded.org (Postfix) with ESMTP id DD7E473FC8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 16:09:13 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so17543464pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 May 2015 09:09:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=Ziea2AvISv1agjQQtcMbNui6/+faCmaoxMCD7IIpcYQ=;
	b=S2eNEns5gMc059UaktT5yPDYZ3mFyGa1m9I8ZlC24s3H3QUtfx0htyEW/8TCuVro5E
	eRUtpl7FJqhUN3cQM1uG38N9XkfX0zpYVPbuBnFR030cfC/L817ajvpI89chXmWhNKXs
	k82p7EcKGR2uxQUZZ5aWZg0OoD9tzcu+2V/RVsLOS+HR7euf9FD2iruWcrkGJFOFeQeS
	nrGryRLbF3/2vZCUkIjfqFdPpzcReKsk4C7JFop0MmMFlk7tA1U4Bbk/Y173lyqM4UH1
	1jh5/5OoxqHU52m1RXob+qCeQtqwhnh9WQKjQGcp0JuitKcicvHgTGg37EmQUNa8l3NU
	FYhg==
X-Received: by 10.68.244.73 with SMTP id xe9mr29145863pbc.98.1431446955524;
	Tue, 12 May 2015 09:09:15 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:ccd0:4222:99ed:8bcf?
	([2601:9:3580:84c:ccd0:4222:99ed:8bcf])
	by mx.google.com with ESMTPSA id
	id2sm16645903pbb.56.2015.05.12.09.09.14
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 May 2015 09:09:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
X-Pgp-Agent: GPGMail 2.5b6
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2318833.dUhIBv86bq@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 12 May 2015 09:09:13 -0700
Message-Id: <1DD47E4E-8968-44C6-BEEF-0A1704D9225A@gmail.com>
References: <1431070955-7100-1-git-send-email-yi.zhao@windriver.com>
	<10765250.9tBgYfV1HJ@peggleto-mobl.ger.corp.intel.com>
	<20150512144510.GC2714@jama>
	<2318833.dUhIBv86bq@peggleto-mobl.ger.corp.intel.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.2098)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 01/20] smstools: fix PN -> BPN for multilib
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
X-List-Received-Date: Tue, 12 May 2015 16:09:15 -0000
X-Groupsio-MsgNum: 55470
Content-Type: multipart/signed;
	boundary="Apple-Mail=_598AD9A0-9611-4A6C-A21E-408723E4AD1A";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_598AD9A0-9611-4A6C-A21E-408723E4AD1A
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On May 12, 2015, at 7:50 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>=20
> Ouch - if so that's news to me, and seems very much sub-optimal. It =
may
> explain why patches keep on going missing from time to time. Khem/Tom, =
can we
> switch to a local solution?

we rely on google spam filter. Local solution would require higher =
maintenance and spam
you can never defeat on your own

--Apple-Mail=_598AD9A0-9611-4A6C-A21E-408723E4AD1A
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlVSJakACgkQuwUzVZGdMxQ3XQCdGVifFlFvl8HKHAE7YNwz6GQU
0aUAoJNBEetZVKaE4FkdLn4Eg3AuLHRI
=9uCw
-----END PGP SIGNATURE-----

--Apple-Mail=_598AD9A0-9611-4A6C-A21E-408723E4AD1A--
