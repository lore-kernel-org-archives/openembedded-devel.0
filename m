Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OvV6W-0002Lq-Mg
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Sep 2010 14:59:21 +0200
Received: by iwn2 with SMTP id 2so6130465iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Sep 2010 05:58:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=RgOlDVrqUjVRcieJc5NGCz43a3IZqS1A0nWUDfD1Xj0=;
	b=lzrEbp6U4kb0fN4tOyCkUHIfbV6bdopTa0V8LwqGPf8K0bW/NMnB5atuGNuUkYIH1Y
	rR0S2r4RGpuMjpz1l1CLpwgi+15xnrWPTbzxy56338m5tBaPRJ+G4GmTKhCxWTaQF7En
	26sJHxe2udmKb2NN1vCc3+IS+qaPxH+HaJ75w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=LfZXYuVPJLptCHo3p9oKIw9UI3NRH0AXq530RE5HQRpNEK8EfHFciWnHVsQy6K13oH
	UyXkO5AiiRHQurxcuCovv8NzV4nCJ1aNJOSjibORTtl7PnspNIDid1bIrmEkrxVAAHF2
	wfGMVeR0KE4QcYQ+mn3vUF/5jZm1nMRRL8EUI=
MIME-Version: 1.0
Received: by 10.231.30.193 with SMTP id v1mr7898750ibc.87.1284469113614; Tue,
	14 Sep 2010 05:58:33 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Tue, 14 Sep 2010 05:58:33 -0700 (PDT)
In-Reply-To: <AANLkTinEdzVgBru=Ui9-MNpaXFD=zGhN6Aek-BM6vAkM@mail.gmail.com>
References: <AANLkTi=6fss18KJvTBYf3oV1MXkgJwT7cqTRz4rK+aTx@mail.gmail.com>
	<4C8F5E55.9010906@balister.org> <4C8F6A6F.4090403@balister.org>
	<AANLkTikNARJgBSC4m1u0tgjXfHh4VEga2=X9OZPBB1Et@mail.gmail.com>
	<AANLkTinEdzVgBru=Ui9-MNpaXFD=zGhN6Aek-BM6vAkM@mail.gmail.com>
Date: Tue, 14 Sep 2010 14:58:33 +0200
Message-ID: <AANLkTikC0sdA01Rba0pCqh4EEXum5Yc5DnVEyuXF5g2W@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: testing branch 2010-09-13
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
X-List-Received-Date: Tue, 14 Sep 2010 12:59:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/14 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> both slugos/slugos-image and minimal/console-image fail on cairo
>
> checking whether cairo's image surface backend feature could be
> enabled... no (requires pixman-1 >= 0.18.4
> http://cairographics.org/releases/)
>
> Guess this fix resolves it.
> I consider this testing version a fail.
>
> frans

oops, misread the log, slugos is not that far so it might still work,
will report on that later.

FM


