Return-Path: <raj.khem@gmail.com>
Received: from mail-ua0-f195.google.com (mail-ua0-f195.google.com
	[209.85.217.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2639777317
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 21:11:51 +0000 (UTC)
Received: by mail-ua0-f195.google.com with SMTP id b35so9907216uaa.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Dec 2016 13:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=hySn1sUrZclS+sJ3l/+T/0augvVi4ugYiHWLnRH+ok8=;
	b=UHt3DozI6iwcROmFTjaFokR+WaKaEVh+KfA3ZPkfQo8CptkAWuw7SjpOWjzC5+Y1u5
	S8AoWN3XxecKHLj0bIMxK+zXNfRF2Y3MPgx70Xt+J1dqRDwQSbw4A9yAtepJHyR4z2n7
	pfSgB0BbJ/3Nnel/wqbmKzsUYN9lXf2+q1uXjyJJ5FdzQJTwSnxy0yLVCn9ccp6c84z5
	GS+gDm+cHmQLiV8UYnfRsnJE2uTptveu/3uc3FmxEauy7O8bGgqgWReXsMKsCkyEOMzY
	LG1CPn3rtHEo2VE8co1om6bhDOfbLSlG/vAG6Zfr7sJlQAWVw6r+eUOdjkjobAX/a1t9
	mmdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=hySn1sUrZclS+sJ3l/+T/0augvVi4ugYiHWLnRH+ok8=;
	b=X9PRZISZTecIpw4Rs6RTCGKMPQqcuppKa0TUsECcLJC3/72QRVP/BkozEjxu2sSKJ6
	56e6o2Q3/QxSvuG0q9eIraUu1HArWJOPJaZk899Y8IeHbXg2DtphEyEIJHKabOQEHmck
	2BphbdrcSROEAkue/xWmlokWO+0Rmt3vzhyS9hLWqVASFRyXrejQHdKd7AHmW0cEGNSu
	4BY1tFGOdZOGsMD2MyHSd1n+tYPC7sKMps6L4b9oAHUtiEo9XIyvAB2+NXeqRq+XFcE0
	9P4A/Q05G+wo0eM5USRn8gJ0jHQhcSAFXjYbcu49Uh6iXn9vtZCCP36wldXKG1tbQ+ZS
	0R8A==
X-Gm-Message-State: AKaTC01+IAqejL8z7EFqM/e/c8TDO3HWG02xmMAjXO53vo4Iwo2cZoV9dI0LA1mYa8RsnU8+mdmd4srPNSShog==
X-Received: by 10.176.1.17 with SMTP id 17mr11742955uak.143.1482181912914;
	Mon, 19 Dec 2016 13:11:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.159.48.87 with HTTP; Mon, 19 Dec 2016 13:11:22 -0800 (PST)
In-Reply-To: <CA+chaQckEo=6jbW19-Fvv1Uy_pMminwEVg=3PSyCdXA3imOh7w@mail.gmail.com>
References: <20161215020940.10105-1-raj.khem@gmail.com>
	<20161215020940.10105-3-raj.khem@gmail.com>
	<CA+chaQckEo=6jbW19-Fvv1Uy_pMminwEVg=3PSyCdXA3imOh7w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Dec 2016 13:11:22 -0800
Message-ID: <CAMKF1spCLOGTMH2XpC6quBjFZQOWoy6XLBBPNHU1gyE=HTzr6w@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH V2 3/6] zbar: Add recipe
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
X-List-Received-Date: Mon, 19 Dec 2016 21:11:52 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Dec 17, 2016 at 3:51 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> gst-plugins-bad-0.10.23: gst-plugins-bad-zbar rdepends on zbar, but it
> isn't a build dependency, missing zbar in DEPENDS or PACKAGECONFIG?
> [build-deps]
>

sent a patch for this.

