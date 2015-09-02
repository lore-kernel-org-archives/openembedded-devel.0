Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9ED397702A
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Sep 2015 21:18:27 +0000 (UTC)
Received: by pacfv12 with SMTP id fv12so23487919pac.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Sep 2015 14:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:message-id
	:references:to;
	bh=fpc0hhMqMuNx9+ocQgpF0J1dbxTsJfHUzphVuMm3sHs=;
	b=moAO7tbLBPw64B9v8Xify6ft3r0xh/9ZbJMST7anI7lul9ctlVvNvAvAGGFu1fRE8X
	9OsJjAgBUw26Yvcjg4TmkNInXOG5wRUDD/CCObNIQ0RoEAnhGv8krg/ienpLcq6cR/l3
	xqPTyVgwIYCDbfRM2NENYnCV8uePlIuFJlcx5pw6MNrdEe2h03Psdcbn+OvrxYjSYGbf
	fFHHaw0KF20QHfanwL9FoStB8oyo/iG+kY4X3w7vgq0de1Pf4k1grBcvzrOVrc0TmA83
	cD8in5hu0+2H8NzSOzH7eAndxld4mfFk5VHYW/9MzQK90v/2xjFazX8heLhoBxggxE3J
	mRYA==
X-Received: by 10.66.159.229 with SMTP id xf5mr12619768pab.45.1441228707749;
	Wed, 02 Sep 2015 14:18:27 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:c55b:2384:bc60:6bed?
	([2601:647:4c02:370d:c55b:2384:bc60:6bed])
	by smtp.gmail.com with ESMTPSA id
	h4sm22718799pdd.91.2015.09.02.14.18.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 02 Sep 2015 14:18:26 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5.1
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1441227171-7647-1-git-send-email-ross.burton@intel.com>
Date: Wed, 2 Sep 2015 14:18:17 -0700
Message-Id: <85925689-58A3-4E96-80E0-12CD37C0A799@gmail.com>
References: <1441227171-7647-1-git-send-email-ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2104)
Subject: Re: [PATCH] libwebp: upgrade to 0.4.3
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
X-List-Received-Date: Wed, 02 Sep 2015 21:18:28 -0000
X-Groupsio-MsgNum: 57185
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5410C278-9F56-4029-8AD6-FF5B2B05ABEE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5410C278-9F56-4029-8AD6-FF5B2B05ABEE
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


> On Sep 2, 2015, at 1:52 PM, Ross Burton <ross.burton@intel.com> wrote:
> 
> -LIC_FILES_CHKSUM = "file://PATENTS;md5=7ec8a34de2073ea13ea2991006246d20"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=6e8dee932c26f2dab503abf70c96d8bb"

can you explain this change in commit message too please ?

--Apple-Mail=_5410C278-9F56-4029-8AD6-FF5B2B05ABEE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXnZ6EACgkQuwUzVZGdMxQT5QCcCzTOFrg5EEIgzlcuLzUy3WxP
eJQAn0qWiiGzocXda8RCfIsJCs2BG6p8
=jlfb
-----END PGP SIGNATURE-----

--Apple-Mail=_5410C278-9F56-4029-8AD6-FF5B2B05ABEE--
