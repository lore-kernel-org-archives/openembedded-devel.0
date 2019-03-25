Return-Path: <raj.khem@gmail.com>
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5247F6BA10
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 17:30:16 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id d13so6571254qth.5
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Mar 2019 10:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=P8yg2SCAeTPeZ/0zaPSHl96zWxSf0CRrt1YGXxjg4KM=;
	b=aBxSEXzcHeQ+lhvijvNPQ6w3ccQqUoXzOhn1ucT80I92W/xfR07LTLvbrvOtfFWAvp
	709LfhbNYd99HvTJcT8bi6dtdAqEomSSLZickyDqJHAdHiNEtXkRusT8RFPB443PSTgc
	CWmDEC2DoGmEHaFdQB5g9lK2rlljNn1LTwawrY3J/Fcn+XqSSzgJZjn+sF+BoCMnuTAS
	uaUXKnmQgyizH2TLEYZbSrHb2QerjGMMBzGfhM+d0sybxHTbYTLMqdOjxdAuNsnhKlX6
	LyHD+63xIdzFzKlwCQfJPZzrUWWkqVbzyuc10P3XWxFeSHk6nXIef5QecrYkEi1vrGDq
	KG9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=P8yg2SCAeTPeZ/0zaPSHl96zWxSf0CRrt1YGXxjg4KM=;
	b=I4wQjVV/lKgoLBRi503TsQHQt5ScpKxK8c6ySDezbJpCWBcIxm87cqb7QkjtnvPKTd
	6d44+YKE77pVpmLh35ENJnms1HloSYcuh3st5rycHjACb68fpupJHznk0mh5M27aPapv
	CWQ1e0Hbxd81TfROP0O+1UjZahjTOkZpRPFl97DrQHfymjrh/kTsuE4LPtJ1YDjyu8Av
	26rxfl0hrAW1LSpDYYni/VNNdZzT/OZmIPHSjHnViVRuKMqCMdMsSHNpyXTkxSpTmXuf
	FWFURaB90dC21VG7Ec7gnXQjYgVCKlPBvCSj8c9iSn2r5Htm+R6f+TillQOKhkAu2raq
	OJhQ==
X-Gm-Message-State: APjAAAVSKxT7OefhIgk5vlvBlJ+4lwYGpeFytm/dO8N9TirDLYO5aKqt
	XSAiHEyi4rdKCDOWIFAZ6yXcqVdi8OV1vk5i1z8=
X-Google-Smtp-Source: APXvYqzXvt9bieHNuFYTHSf7SHGHjh1F5y281BC4wX5NvFv/iJxTia6Og+blC0qj5Ch9QHUo3D4vM32RiRGcOZCGDXw=
X-Received: by 2002:aed:3a09:: with SMTP id n9mr20866114qte.196.1553535016868; 
	Mon, 25 Mar 2019 10:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190325140526.12797-1-brgl@bgdev.pl>
	<CAMKF1srKu+wFUc+PeAAiZidGBjA_5qR0VUZuK8dW2FXL5xt4PA@mail.gmail.com>
	<CAMpxmJVeTvhf10yOOL2iVb+Hfv=z+-dU2p7tbAzqqs_QErY5ng@mail.gmail.com>
In-Reply-To: <CAMpxmJVeTvhf10yOOL2iVb+Hfv=z+-dU2p7tbAzqqs_QErY5ng@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Mar 2019 10:29:50 -0700
Message-ID: <CAMKF1soqJzfVZP=fJrCyCO90KJCZANmXpEBcLG9=KH_TV5tkGQ@mail.gmail.com>
To: Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] libgpiod: bump version to v1.3
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
X-List-Received-Date: Mon, 25 Mar 2019 17:30:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2019 at 7:26 AM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> pon., 25 mar 2019 o 15:19 Khem Raj <raj.khem@gmail.com> napisa=C5=82(a):
> >
> >
> >
> > On Mon, Mar 25, 2019 at 7:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wro=
te:
> >>
> >> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >>
> >> There are several new features in this release. The one that impacts
> >> the recipe is the option to install the test executable to bindir usin=
g
> >> the new options (--enable-install-tests). This requires separate
> >> PACKAGECONFIG entries for 0.x and 1.x series.
> >
> >
> > Perhaps it will be good to enable this feature automatically when ptest=
 is enabled via distro features
> >>
>
> Sure, how about a separate patch I'll send later this week?

okay that works too

