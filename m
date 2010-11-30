Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PNUi5-0002Vx-MC
	for openembedded-devel@lists.openembedded.org;
	Tue, 30 Nov 2010 19:13:50 +0100
Received: by yxd5 with SMTP id 5so2967781yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Nov 2010 10:12:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=b7TZ/6a5U3UHubJ58+FFPIp9wTYfQ9w8upk7QG+eSW0=;
	b=tkbA13VOuG/btHknTxy90i53hYKFyjP33rfvJYXjJayfKOEoi4IpsPuseQz/y52r+J
	kqSihIxyjJ7NC7SslOVVwhhj2Pc5X4LxQfryTS1aAuCVetYVTtNFRFT+uZxH5rINvhW1
	417IqsiS52kEt/GuDS9aZmdOg0KhQXlt3k2KA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=GqmrJxpkkF7NYJS9Zol3qCR+0+gFIHC37cwDGAeMBQypwgU46H6DzfwvzFs0I9OWv5
	4j8exul/sbgGhjZl2yLcGeVtLn3nb9tkDlbAJigWn0/iT5MmSZmVoAd6s4QqooI5sMMD
	g78KpP2FX3nOJWVtDSjVszMApdePMFtlPwH4o=
Received: by 10.90.25.9 with SMTP id 9mr71197agy.48.1291140748238; Tue, 30 Nov
	2010 10:12:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Tue, 30 Nov 2010 10:12:08 -0800 (PST)
In-Reply-To: <20101130082314.GL10755@ibawizard.net>
References: <AANLkTinyc8Pnpd3XMnTu=psPPHAmGKi4+DjvgWhSE1jt@mail.gmail.com>
	<20101130082314.GL10755@ibawizard.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 30 Nov 2010 10:12:08 -0800
Message-ID: <AANLkTikmbUDpw04xqRYE+pwY1_mBUNNOdfL+LdnahUrC@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010 - last moment hot fixes
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
X-List-Received-Date: Tue, 30 Nov 2010 18:13:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 30, 2010 at 12:23 AM, Petr =C5=A0tetiar <ynezz@true.cz> wrote:
> Khem Raj <raj.khem@gmail.com> [2010-11-29 16:34:01]:
>
>> Hi Folks,
>
> Hi,
>
>> Please update your release branch to latest tip and rerun your builds an=
d
>> other tests that you have been doing and indicate any hot fixes that we =
need
>> for the final release. Again update the Testing table with the results
>
> as I see it, the uclibc variant seems to be really in the bad shape for
> release, so I wonder what to do with this? I mean x264/mesa/e2fsprogs bui=
ld
> issues at least, maybe there's more.

Do we already have some resolutions to these issues ? are there
existing patches

>
> -- ynezz
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


