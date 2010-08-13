Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Ojnnk-00065R-F8
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Aug 2010 08:31:37 +0200
Received: by gyd8 with SMTP id 8so802128gyd.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Aug 2010 23:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=3A9Q9eKvuhn+J63r6zn3Jqw7vdalD9+eY2wvGF0gWRA=;
	b=Nq5sNAQfLVct+H58ffxOwjmMCnPVZdaBiV9e7dYUfol3rLByzUH1QwrcUTtQnormE1
	CeLR/sauqMYDUrrNdXq/zvnLYB+/BM0uQhCm1JTBAfzd9uO0n+mYLjelWShT0AmSC5+G
	R02XYcLfc5XDWce1bjcHiK5FW5ZfZ1XIJfxNI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=DOGIz8PCXkNCxusImxdiCrz5GODTm/PhaVVkv89IDW7X0ljbuDJVqM7jWB0OhsPJGt
	wFA9/8SAZ7X7MavJ9bzvxH71KqATKgpPWZ4gqR9l6nI8kqgv4+kPLGkQ9uNZTm5kDSox
	xi9pJ+eZNcJuEAFfNnFjliMb0jpMgDAyphPcM=
MIME-Version: 1.0
Received: by 10.231.148.85 with SMTP id o21mr1362570ibv.26.1281681081799; Thu,
	12 Aug 2010 23:31:21 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Thu, 12 Aug 2010 23:31:21 -0700 (PDT)
In-Reply-To: <1281677417-15063-2-git-send-email-vjensen@gmx.de>
References: <1281677417-15063-1-git-send-email-vjensen@gmx.de>
	<1281677417-15063-2-git-send-email-vjensen@gmx.de>
Date: Fri, 13 Aug 2010 08:31:21 +0200
Message-ID: <AANLkTimpK1m-bz4GNknxajWOQKq2QaM_UpoaaNqL4wRy@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/3] canutils: remove old version 4.0.4
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
X-List-Received-Date: Fri, 13 Aug 2010 06:31:38 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/13 Vitus Jensen <vjensen@gmx.de>:
>
> Signed-off-by: Vitus Jensen <vjensen@gmx.de>
> ---
> =A0recipes/socketcan/canutils_4.0.4.bb | =A0 =A04 ----
> =A01 files changed, 0 insertions(+), 4 deletions(-)
> =A0delete mode 100644 recipes/socketcan/canutils_4.0.4.bb
>
> diff --git a/recipes/socketcan/canutils_4.0.4.bb b/recipes/socketcan/canu=
tils_4.0.4.bb
> deleted file mode 100644
> index 9ddb697..0000000
> --- a/recipes/socketcan/canutils_4.0.4.bb
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -TAG =3D "canutils-${PV}"
> -require canutils.inc
> -
> -PR =3D "${INC_PR}.0"
> --
> 1.7.1
>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


