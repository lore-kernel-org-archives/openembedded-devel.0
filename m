Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OtJ1h-0004kh-DZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 13:41:18 +0200
Received: by gya6 with SMTP id 6so2560608gya.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=p8wq5bw5AySRIWkJlb+0GgSSWT3EXxBRtnDpxLsNd2w=;
	b=cQynbvMmQwM3zwB04ekfqgGgKlUc7Vu4M2iYZFq7LWsjyvT83MgfjjOQTmHDCOtKzI
	1EtKsGtdFoUoFCRxZi2td9vgpw0I8DMD50qxib0rprpsFbkUG3Vjrx7ybCLa+m8qNEzs
	TIUkCi++BvXaz5zKfOh07qZ76r4UBn3p1t6Qs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=WE1I3CHZ4sjSw6jRJB3NMHreNliNyA9rQTpjkp91xu2BAKy1xIsDjeeosWvjDvh4ui
	i10vmfpqkMdCGZAMXnW3WqKC2a1y6e9mp4e6DwgVV63w4imODDgFsr4oRWVJ6BDBMAAB
	bSfUbzzof67wsqCVGmnb/8LMP0flR1GgwJHkE=
MIME-Version: 1.0
Received: by 10.150.53.18 with SMTP id b18mr348157yba.331.1283946032307; Wed,
	08 Sep 2010 04:40:32 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Wed, 8 Sep 2010 04:40:32 -0700 (PDT)
In-Reply-To: <AANLkTi=Pukbe6T_LM59_1BJS3TG8PwEBWP064YaDCs6u@mail.gmail.com>
References: <AANLkTi=Pukbe6T_LM59_1BJS3TG8PwEBWP064YaDCs6u@mail.gmail.com>
Date: Wed, 8 Sep 2010 13:40:32 +0200
Message-ID: <AANLkTinQjJA1F9yqwSXWcB=DG9S7FsnSGuV8-JgEkMJ=@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-07
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
X-List-Received-Date: Wed, 08 Sep 2010 11:41:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/7 Cliff Brake <cliff.brake@gmail.com>:
> Last weeks testing cycle was successful:
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=testing_2010-08-30
>
> I see a few more builds succeeding that were failing last week.
>
> The testing-next branch has been moved to current org.openembedded.dev
> and is ready for clean builds.
>
> http://wiki.openembedded.net/index.php/Testing
>
> Thanks,
> Cliff
>

calamari/minimal/console-image builds fine for me
still have some nios2 issues, might be in my setup, looking into it.
Added entries in the wiki.

I suggest if people report failure they also report what version this
applies to (so we can easily see if it was a failure report from an
older test or for the latest version.

Frans


