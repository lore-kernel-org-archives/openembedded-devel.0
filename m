Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6846F317
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 02:08:09 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id r10so1756292pdi.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Feb 2014 18:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:message-id:mime-version:subject:date:references
	:to:in-reply-to;
	bh=IhwcEz6ygWZ5PqfLJ54BbjMNduT0AD4ReT36Jhw5xz0=;
	b=oJ3JPij+HlE/QdVU4eO7zCj94tUNCA9rVkTcmbHR7qmUfTz5xW9aJNnyoyvuLP/Glc
	PDxWVXh+fn5h2nKk/rthfZYY1YcLCYlc0sn/fEFfN8/nSX5xW2F7H6IleEktdy6CbmQL
	IqxVKhLHcbB7Hp/3gcCbGEZQ9tlZ5gzkoQGIkzQ7XAQnt25ISdIHJZ5qRfgslxGx5A/B
	j8t2irf7XGZc1layucgdP8Ip43/AJgTD7uYbLiEEUB7gZ5oMGfXyOd7zEtLP1qngbFym
	laPJevYDOl9WvGMmfx0uW1MlobGnBwO8aJp+mUu9zwUkvNybqdWUARC3RkFSFHiyWFMM
	gunw==
X-Received: by 10.66.159.233 with SMTP id xf9mr12432726pab.139.1393466890808; 
	Wed, 26 Feb 2014 18:08:10 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30])
	by mx.google.com with ESMTPSA id un5sm19133733pab.3.2014.02.26.18.08.08
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 26 Feb 2014 18:08:09 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <D645A4EC-AEB7-4C81-B46F-ED2B29A92125@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
Date: Wed, 26 Feb 2014 18:08:06 -0800
References: <1393466798-13105-1-git-send-email-net147@gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <1393466798-13105-1-git-send-email-net147@gmail.com>
X-Mailer: Apple Mail (2.1827)
Subject: Re: [meta-oe][PATCH] xterm: split out resize into a separate package
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
X-List-Received-Date: Thu, 27 Feb 2014 02:08:10 -0000
X-Groupsio-MsgNum: 48383
Content-Type: multipart/signed;
	boundary="Apple-Mail=_0DD480A5-8E28-4F59-A02F-57F2F1BD2684";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_0DD480A5-8E28-4F59-A02F-57F2F1BD2684
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii


On Feb 26, 2014, at 6:06 PM, Jonathan Liu <net147@gmail.com> wrote:

> +FILES_${PN} += "/usr/lib/X11"

why is this hardcoded


--Apple-Mail=_0DD480A5-8E28-4F59-A02F-57F2F1BD2684
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMOngcACgkQuwUzVZGdMxQS8gCfVDcyEvajO5JVxqAvluCHHVNB
IQgAn2tLfNJSMqFMF83wNevpUEegJAiK
=POJL
-----END PGP SIGNATURE-----

--Apple-Mail=_0DD480A5-8E28-4F59-A02F-57F2F1BD2684--
