Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SV0aL-0007zP-5M
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 May 2012 15:17:41 +0200
Received: by yenl13 with SMTP id l13so1732446yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 May 2012 06:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=WIQW/NuIF3sWrdWcvASeahJSWFTElu1ADbA+GY06pVQ=;
	b=Du5AdFgog1dCNAEGqQBvkSFUYk3xrVZcqCzJhznB58ECNanWIiG+IVUitPTuroB2zA
	1Rr2q5PftooC26U+I8BlovhKI+tZNZ9ev9CHEXYRBWWefLYEjqrphFxWaDJpgP7KAFBd
	IACYiai578Zch71/YH285z7bjFpqT4Op8ra8/U0YpAXlRuYCiq2FuLZElJ3DJIWKwixu
	pgs2ZUGXY0j1qDnt8w+adJzb1IBRWkXnNDcxn8Uqqbt1WIlxoVL6hqbwqndGC2RZEf0I
	F3ETH5wq+L/N8MtCV5Y5297cMp4gYKwqf6zqJvFuyKh7uECyohCjUY1v+zDZ6mSYQKuV
	i2vw==
MIME-Version: 1.0
Received: by 10.50.178.102 with SMTP id cx6mr1655400igc.14.1337260057988; Thu,
	17 May 2012 06:07:37 -0700 (PDT)
Received: by 10.42.170.195 with HTTP; Thu, 17 May 2012 06:07:37 -0700 (PDT)
Date: Thu, 17 May 2012 15:07:37 +0200
Message-ID: <CALbNGRRSxKD_QqhCbLH=aRj3S0PEyTmQs9j8Lgg-5EObqMypxQ@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: meta-systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 17 May 2012 13:17:41 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi

happy to see this happen I have few questions on what is planned.

In README is written:

> And we're working to break the dependency on this one:
>
> URI: git://git.openembedded.org/meta-openembedded

Maybe it is a misunderstanding but I would expect for contents of this layer

* systemd.bbclass
* all from meta-oe/recipes-core/systemd
* bbappends for all recipes with systemd support.

Is this correct?

Andreas


