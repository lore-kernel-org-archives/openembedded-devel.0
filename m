Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f54.google.com (mail-pb0-f54.google.com
	[209.85.160.54])
	by mail.openembedded.org (Postfix) with ESMTP id 121446116C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 18:04:49 +0000 (UTC)
Received: by mail-pb0-f54.google.com with SMTP id uo5so2847944pbc.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 10:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=sIRtAw/W65bHHFcwFpWT9qLhAsOk6Tu5RM/MjF13nnk=;
	b=ZSRWkhh5rgZamkhmh6TwYKKLjK6hVQRyEwTlADdwlydBJ+tbkMNyVJJqR4daxJoU/Z
	dtzKAQXA0OhPOiF4Uiu5UBkKQMaKuSh58pGn4a665/1IXYg5uFM43/o4vTny8FvS/WzZ
	IXGic539SSsLdb7F7fP0TcwVlVfOmjC50CHa5GA1A5ejtKfB0WDxpWxldvxHSgZzz6+M
	X4r+esKffwW8lrKc4WPuMf8AQy0spXiRfq+LYMj2SNJoGkDMEq0lp8O5KCFmSwt4R86g
	KS1mwJS1i3jZVSv/gcNdtUAuStAX7nfoeNcUqO5LVFktQDnpggitTf5hkH3gL+C+xFBk
	kETw==
X-Received: by 10.66.192.162 with SMTP id hh2mr16384329pac.150.1393524290950; 
	Thu, 27 Feb 2014 10:04:50 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id nz11sm516805pab.6.2014.02.27.10.04.49
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 27 Feb 2014 10:04:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <E2D50EB5-29C8-4FC6-9373-4E445C5B77F9@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Thu, 27 Feb 2014 10:04:47 -0800
References: <1393521090-20876-1-git-send-email-otavio@ossystems.com.br>
	<1393521090-20876-2-git-send-email-otavio@ossystems.com.br>
	<90CD9C88-7366-4942-82AB-B4E909189BAD@gmail.com>
	<CAP9ODKoCpaMUV58V3o7t6pGweB93QeugwouLOBgdgohh=JmgnA@mail.gmail.com>
	<7167B982-98BA-4A58-8FD2-C8BA54D56F25@gmail.com>
	<CAP9ODKog_2cBFMehH5rWfh6HgA7oseWrdR02LUp8u6p4=Fn3Qg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAP9ODKog_2cBFMehH5rWfh6HgA7oseWrdR02LUp8u6p4=Fn3Qg@mail.gmail.com>
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
X-List-Received-Date: Thu, 27 Feb 2014 18:04:50 -0000
X-Groupsio-MsgNum: 48417
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5E907DF2-5A80-4DE7-8696-006684AFD773";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5E907DF2-5A80-4DE7-8696-006684AFD773
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On Feb 27, 2014, at 9:33 AM, Otavio Salvador <otavio@ossystems.com.br> wrote:

> and how you think we can allow user to override it?

there is -B option that can be passed to dropbear to let it accept
blank passwords.

--Apple-Mail=_5E907DF2-5A80-4DE7-8696-006684AFD773
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMPfkAACgkQuwUzVZGdMxRK8gCeNu3Bfyazixo+3x2iqWaz+X+B
AWUAn2jM0w6hLJTF35cSBWGzbQKp+Jz9
=5XeC
-----END PGP SIGNATURE-----

--Apple-Mail=_5E907DF2-5A80-4DE7-8696-006684AFD773--
