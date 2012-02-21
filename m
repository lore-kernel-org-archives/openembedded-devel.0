Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RzirL-0007D1-D6
	for openembedded-devel@lists.openembedded.org;
	Tue, 21 Feb 2012 07:05:55 +0100
Received: by lahc1 with SMTP id c1so7305394lah.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2012 21:57:36 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.152.147.1 as permitted sender) client-ip=10.152.147.1; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.152.147.1 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.152.147.1])
	by 10.152.147.1 with SMTP id tg1mr17967030lab.22.1329803856772
	(num_hops = 1); Mon, 20 Feb 2012 21:57:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=rz7cV4elaFRXJeuwsD97lXSUIICfAh9/4XP65XS1Oy4=;
	b=G26WIwk/5Yv1thSJMsxUXadLHV/seVm9eSEktUgHHbZU9uWTQimDujpHNBdEjRN2u4
	bsia8Y8AeQ4eDI2FtJKaTzqmKwUIRdpiDHn39QNTFfYDKk0fcQT8yjxWyKS1IopdKIfY
	wwszj0KwETzynO5ps3mEuvAsx3yPI+IekGY3k=
Received: by 10.152.147.1 with SMTP id tg1mr14982550lab.22.1329803856314; Mon,
	20 Feb 2012 21:57:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Mon, 20 Feb 2012 21:57:06 -0800 (PST)
In-Reply-To: <jhvaro$g4s$1@dough.gmane.org>
References: <1329802708-23942-1-git-send-email-raj.khem@gmail.com>
	<jhvaro$g4s$1@dough.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 20 Feb 2012 21:57:06 -0800
Message-ID: <CAMKF1sqNwbML0DC9paAsbUUGPd6AO9ysq8VVZXtgZNozaNM4ng@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] imagemagick: Upgrade recipes from 6.4.4 -> 6.7.5
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
X-List-Received-Date: Tue, 21 Feb 2012 06:05:55 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 20, 2012 at 9:42 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 21-02-12 06:38, Khem Raj schreef:
>> 6.4.4 does not compile with latest zlib
>
> http://cgit.openembedded.org/meta-openembedded/commit/?id=aaef9aa923d6e55ae0463156999b2a0543cb1ef1
> ?


yes thats same thing. I was flushing out what I had
discard it

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iEYEARECAAYFAk9DLrcACgkQMkyGM64RGpEpAwCfUgZ/jCmzjtt6lwstIY56sae4
> 4voAoK9yy95mW4BKktPQMDa15JZu9vM6
> =l9wh
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


