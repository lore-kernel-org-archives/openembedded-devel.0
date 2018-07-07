Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 78B9174583
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 05:49:47 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id x24-v6so8811736ual.10
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 22:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=MeRVuHIkL+X4BLGmruAG2Ny39Ast/YgjB3HLUzfTXJc=;
	b=bqe2jtc8rbkq01rZU5yjAv82B2hd5jE+alsFqwNtYhX7+a7D3RRA+vyT5TiMbp7dHl
	u3fMIlZYO/7C1x3vw5TmDcU2PBNpNRnqAfRKvtrJ5bFsz5gjVm0oFuCfdgL+7UEGcFHV
	wb6ARDrnZgdjCjRyI6dk07KJB+ygcGfgOTDpEXAmRUnG0NkaBh+uWKjV9Q6Xd7laCPRx
	aWm3tSQIFZTw12UOybutd7OXLf2qUu5Ff1eak80sGJtauguuDOaHZ0aXPZslNOo1+hgQ
	BID9MUPzI3r077YTEAMR9E7hoW3UPqakT2fEMdgJ15sHbcoIhZdgLpbQjzPDGkV6HjJS
	06Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=MeRVuHIkL+X4BLGmruAG2Ny39Ast/YgjB3HLUzfTXJc=;
	b=TdgyALNdnHz2rbcHy2YCIvG4DF1a0x4IXwYsImRKzAC565v37+UBAPyHtknSe3xE8h
	sTpW2OCF/an1bLWAfC58nN86Fnk3fvR4hMpa3VNDT7gK++K5hJOzsVEJsPsjrfo/5FEX
	lzeF5p2joFFgt3681NZ29WiPoJvCy6F0fy2j3jv6hUmnraODd8y1eFqgVLu2fVKWgVNb
	Bhl2q60IuVW137ZqX/o91FMlpISw+8PFZk43TOjmqxKYGOhH6DmXQLMNCKU/Je42G1sS
	V+lg8PkSXTzsMMvn2RL14LAEvv7e1n9IHI+dgKm/b0rJDJYxKB+teFIGIBQsjL7zUulA
	UBWA==
X-Gm-Message-State: APt69E2VSf+TWJ3dBt/QXm7NFJ6oz4pWabMJ2mvsjUOWsI38zZrNQ/6r
	nHHVb+YNaIVE8TN+83iaRfVu3BJDKqEXKpiRj00=
X-Google-Smtp-Source: AAOMgpdAzgDqzwuaH2Pi05PZm53BL90b8tsXJJsrvZWv9q9fLYeJTyLsAQYJZI1S+amAMv+iosh6cj4BxtekRvcoTpo=
X-Received: by 2002:ab0:50cd:: with SMTP id
	d13-v6mr7883075uaa.45.1530942588172; 
	Fri, 06 Jul 2018 22:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
	<e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
In-Reply-To: <e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 6 Jul 2018 22:49:21 -0700
Message-ID: <CAMKF1sqE11tW8Kcnjqv0MwMjKfeWVHR5=gEs6vQEJOKgiWCPNA@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 07 Jul 2018 05:49:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 6:16 PM akuster808 <akuster808@gmail.com> wrote:
>
>
>
> On 07/05/2018 11:26 PM, Takuma Ueba wrote:
> > Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
> > ---
> >  meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
> > index 5c379956f..660bf09a7 100644
> > --- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
> > +++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
> > @@ -1,7 +1,7 @@
> >  DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
> >  HOMEPAGE = "https://github.com/pyca/pynacl"
> >  SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > +LICENSE = "MIT"
>
> Why did the LICENSE change? maybe not that in the commit message. It
> helps the stable branch maintainer to decide if this needs to propagate
> to other branches.
>

I dont think it changed, the SRC_URI for this is

https://github.com/wbond/asn1crypto

I am not sure if homepage is correct for this

> - armin
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
> >
> >  PYPI_PACKAGE = "asn1crypto"
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

