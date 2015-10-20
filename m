Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 76C4F76FDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 15:40:57 +0000 (UTC)
Received: by wicll6 with SMTP id ll6so34706785wic.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Oct 2015 08:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=voWn8GzOtPxLsrfAyzvRIBMsS09rbwRAz3+mBeKAsOA=;
	b=v+x599fQ3SepwDW4ZButdpCXupbFtDcWGonLE3ZwqPLiOFoxxHNQ7Hh43eIWzaCLug
	LMp39oPc0kPuT3jHH1lfbVDD8HLSPW4Qlh9DJheTXLIv+etjPqjTWN2/+aAiHmxY1siT
	bFtOWZZ5xmRDQZPc6RRFgKPKdtp6GOrkUSMjGiWj3gSVXpQWpKZlFjHCMDVxHbVsrj6V
	227G/9Z9fmlNNuJch0fUBHWmtOo2Nblx6RPaT9uyusz0RHOIjUp8kgGfiAPxeB1+XnoO
	Q88dN6d919jmu10DwkfIrWUZ1PO49RvOuN0SaxHwLX3X6GCOhJxaKXJ/D8Q9Gnn3cHlF
	2iGA==
X-Received: by 10.180.188.100 with SMTP id fz4mr29540431wic.28.1445355657109; 
	Tue, 20 Oct 2015 08:40:57 -0700 (PDT)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id z4sm4559464wjz.29.2015.10.20.08.40.55
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 20 Oct 2015 08:40:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 20 Oct 2015 17:41:09 +0200
To: akuster808 <akuster808@gmail.com>
Message-ID: <20151020154109.GA2557@jama>
References: <5625864A.4000007@gmail.com>
MIME-Version: 1.0
In-Reply-To: <5625864A.4000007@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: dizzy-next sync to dizzy
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
X-List-Received-Date: Tue, 20 Oct 2015 15:40:57 -0000
X-Groupsio-MsgNum: 57927
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2015 at 05:09:46PM -0700, akuster808 wrote:
> Hello Martin,
>=20
> Are there issues with the changes in dizzy-next? need Otavio to signoff?

No issues, I was just waiting for one of you to request the merge.

Pushed now and new pull request pushed to dizzy-next.

> Dizzy behind by:
>=20
> 7f1df52 fuse: fix for CVE-2015-3202 Privilege Escalation
> e3dbf78 ipsec-tools: Security Advisory - CVE-2015-4047
> 0fb90be mariadb: Security Advisory -CVE-2015-2305
> c580b62 libssh2: fix CVE-2015-1782
> e00844e ptpd: disable libpcap detection via pcap-config
>=20

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlYmYH4ACgkQN1Ujt2V2gBxO/QCfXVjqpTIDLrZSBv66szjn7RtI
C3kAoKwjbd9r8qNX5YEYFFi6z2+Gbo4J
=+OdS
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
