Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 79728770C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Oct 2015 06:44:34 +0000 (UTC)
Received: by pabrc13 with SMTP id rc13so78335372pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Oct 2015 23:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PFRnR8m23jIUl69pA1XTI9CMlCXtQSRWABuKLOrAEz4=;
	b=aKY09S+hBrytuMmzKZpwmx0HwwhDWEx32A5BNVDIJFPJoHf6rCoA3bU1HL12tJb7e0
	N/Gpir2AxIeS4jS68fLaJBZyzOKVPisNaw3JxcNX53DiiSoVFZS6zBuNr/9FJAk1WTFZ
	rKFW596pGYmOICY8ntcxIVe8JX3dnpOIt5kS8gqRJfz6l1yy/LyiALThkOjwGBkNG9sG
	HZ6oChfnNX3JwwEzoGzTrwweyBAETfrGBOWyMpGLULjJrKHU04I7F9p8QS+bygo3rNA7
	vuYPN0HUQVJXvyyqsExcFevWmEVxrxpbQLgldptPDFAAVpJFK5NMEedGcy9u9DXdVH7n
	80jQ==
X-Received: by 10.68.197.168 with SMTP id iv8mr8186724pbc.81.1444891475239;
	Wed, 14 Oct 2015 23:44:35 -0700 (PDT)
Received: from ?IPv6:2601:646:8601:4580:fd3d:cb0b:3cd1:e450?
	([2601:646:8601:4580:fd3d:cb0b:3cd1:e450])
	by smtp.gmail.com with ESMTPSA id
	rz9sm13225401pbb.61.2015.10.14.23.44.34
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 14 Oct 2015 23:44:34 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3096.1\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAAfyv34Ly=rBg=S60qYbjtszCLp7kUaQqwQ9taPen3s3fiokVg@mail.gmail.com>
Date: Wed, 14 Oct 2015 23:44:33 -0700
Message-Id: <90F3B45E-0156-46A9-8BF7-D83F9B0BD059@gmail.com>
References: <CAAfyv34Ly=rBg=S60qYbjtszCLp7kUaQqwQ9taPen3s3fiokVg@mail.gmail.com>
To: Martin Jansa <openembedded-devel@lists.openembedded.org>
X-Mailer: Apple Mail (2.3096.1)
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: meta-qt5 - Qt5LinguistTools cmake problem
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
X-List-Received-Date: Thu, 15 Oct 2015 06:44:35 -0000
X-Groupsio-MsgNum: 57836
Content-Type: multipart/signed;
	boundary="Apple-Mail=_2467EF34-E23E-414F-8A02-E69A66CEBBDC";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_2467EF34-E23E-414F-8A02-E69A66CEBBDC
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Oct 14, 2015, at 1:34 PM, Belisko Marek <marek.belisko@gmail.com> wrote:
> 
> Hi,
> 
> I'm facing the same problem as already reported here:
> http://patchwork.openembedded.org/patch/97183/
> 
> when using qt5_add_translation in CMakeLists.txt
> 
> Mentioned patch isn't included in actual meta-qt5 master which I'm
> using. Is there other solution or can I use this approach? Many
> thanks.

that patch looks good to me. Martin ?

> 
> BR,
> 
> marek
> 
> --
> as simple and primitive as possible
> -------------------------------------------------
> Marek Belisko - OPEN-NANDRA
> Freelance Developer
> 
> Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
> Tel: +421 915 052 184
> skype: marekwhite
> twitter: #opennandra
> web: http://open-nandra.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--Apple-Mail=_2467EF34-E23E-414F-8A02-E69A66CEBBDC
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlYfS1EACgkQuwUzVZGdMxS6ZwCeL095l+7dZXejh06wfATb1imR
Gh0AmwXyOuwoGLSHFYbmw/WetDCOsg6E
=3f1d
-----END PGP SIGNATURE-----

--Apple-Mail=_2467EF34-E23E-414F-8A02-E69A66CEBBDC--
