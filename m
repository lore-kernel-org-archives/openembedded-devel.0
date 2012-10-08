Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLE9H-0004r2-BY
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 16:17:35 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so2510607eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=8wn+nQncedILgFGK8UyT0SxJB6qXnLmbiC8B9NTz3jY=;
	b=NFk/rtEcmbxutXeYH/iJtNuxbeBUEDCWUiE5Dqr8RNVKG2AfamzGwILbQ3ULC0mUr+
	1I7EHyVv9hs9tCWCN6nEprKfyeX5e3i87UFGDgyZ35gvcu97EHX20X6/jcatdkoJSdfB
	V6sOCcDhFCkRTQibEQ8kiU2C+1cqBKRW5wPH/qpa0myxGviIENkSBAPmoBw+StHcAPll
	Vd0kIJs8R/hJzfCbLONYpK9k/HzFaQcVzfSFW+TKyJsPjF9ec4Bhh+BQsbrqa7Z00Xn1
	IxB7LFUOdil+DbXytc58ZHRMpt7LXR5Dz3uG41v0NtNbWKhoZ2RMtR8KKBapNMQTxv8z
	QXDQ==
Received: by 10.14.221.132 with SMTP id r4mr22473160eep.29.1349705069378; Mon,
	08 Oct 2012 07:04:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.66 with HTTP; Mon, 8 Oct 2012 07:03:59 -0700 (PDT)
In-Reply-To: <5072AE42.6060201@dresearch-fe.de>
References: <5072AE42.6060201@dresearch-fe.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2012 07:03:59 -0700
Message-ID: <CAMKF1spAG+CpC_Xza5FF6cF91v9_Du61HdrY2+LhzRb50BXiCw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: llvm vs. meta-java
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
X-List-Received-Date: Mon, 08 Oct 2012 14:17:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 8, 2012 at 3:43 AM, Steffen Sledz <sledz@dresearch-fe.de> wrote=
:
> Hi meta-java maintainers,
>
> should llvm really be part of meta-java/recipes-core?
>
> I believe this involves a great danger of conflicts with other layers.
>

so far there has been only meta-java lone consumer of it. we will
cross that bridge when it happens. we might move it into oe-core then

> Steffen
>
> --
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
> Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
> Fax: +49 30 515932-299
> Gesch=C3=A4ftsf=C3=BChrer: Dr. Michael Weber, Werner M=C3=B6gle;
> Amtsgericht Berlin Charlottenburg; HRB 130120 B;
> Ust.-IDNr. DE273952058
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


