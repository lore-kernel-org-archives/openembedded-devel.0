Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 227136EDAA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 17:29:55 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so2766968pad.22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=GvsaQmmEP/QG4mMmiweJPOxIraRSKytXp//S/O5fDQ0=;
	b=tKT6st564X3t/Euf+6tbv9wPdmB1y5q6YL+Oo2J2MTGuL8ipTKbM6Y03hBOEuWj784
	fMrzam3OhKsYdW4G4mQV3x358qsUSP5xWEda0/F15m8TdX9BHcciyrIFyxKObUMu79xL
	6TuMpotUCepfL+5RshxHJve7iL4zHMJL8VDXcYjBmtJikbZ2hdSXDnkMAF3zK5g3TAXJ
	2zQyxyMv58bZ4HN0vVSwwhWKRPZCgCQZiUmsAOiPlMX8y1AYgzE3vNHeSrvln53fC3xn
	mCQCJJw/Jpwu2cStkoIICA6p5+bD3okjnePXHEq35NcPpHoUijq1NJCzNSBX5dUENZQ8
	3prQ==
X-Received: by 10.66.146.133 with SMTP id tc5mr16304019pab.58.1393522196448;
	Thu, 27 Feb 2014 09:29:56 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id gj9sm15505738pbc.7.2014.02.27.09.29.54
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 09:29:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <7167B982-98BA-4A58-8FD2-C8BA54D56F25@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Thu, 27 Feb 2014 09:29:51 -0800
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
	<90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
	<CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-qt5][PATCH v2 1/2] packagegroup-qt5-qtcreator-debug: Add package group
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
X-List-Received-Date: Thu, 27 Feb 2014 17:29:57 -0000
X-Groupsio-MsgNum: 48414
Content-Type: multipart/signed;
	boundary="Apple-Mail=_67815CAD-FDF1-4DFA-8325-E0D2DD4F9E47";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_67815CAD-FDF1-4DFA-8325-E0D2DD4F9E47
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On Feb 27, 2014, at 9:28 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:

> As explained in v1, Dropbear does not work.

it does work. you just have to use non-empty password.

--Apple-Mail=_67815CAD-FDF1-4DFA-8325-E0D2DD4F9E47
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMPdhAACgkQuwUzVZGdMxS0WgCfRQ1FoLAP3IGzq86y2W45EfjU
bKgAniesro1kHQ93V0nv/dJKGN+v/rX8
=JFLA
-----END PGP SIGNATURE-----

--Apple-Mail=_67815CAD-FDF1-4DFA-8325-E0D2DD4F9E47--
