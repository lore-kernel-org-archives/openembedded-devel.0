Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SyhZg-0001CO-W2
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Aug 2012 13:03:45 +0200
Received: by yenm1 with SMTP id m1so163244yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Aug 2012 03:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fuLUv7OGhM0u/StuqlStYwNwn8V60r58t68gJ1oRONA=;
	b=1JftM+/Ko99Fo5DAeztW8ZZIyItIH+np4P90HjtmeD3UkVpRNO3+w2ltBc19Fqt5sY
	oHf3nOhKeQ+NiTXr164RfHIOhs6ZX2gY1HwQcFMifMcM9KZTnyBe8p/c0YfGqacCCOJe
	6fWC8l5ZCHnXLhPKqzCVqhAEcxPusyHf2keAGEEPORNyiR5MkhFskzNnWlXZccs8EyzQ
	kM2BfMyCJ5h6h+LYBhq8r6QkWG3UBxdU/ZBk6/ocnaH4UMOj6ygXkNYri9WGwu8+iwfX
	OgMnOxvRe4xlvvqxNmRvPEE6cdNysSy62uye/FC3u7jy7knNHARhCjMzPsZpuvWsKInt
	yGeg==
MIME-Version: 1.0
Received: by 10.43.124.201 with SMTP id gp9mr11075224icc.47.1344336718464;
	Tue, 07 Aug 2012 03:51:58 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Tue, 7 Aug 2012 03:51:58 -0700 (PDT)
In-Reply-To: <jvqqs2$tn3$1@dough.gmane.org>
References: <jvqqs2$tn3$1@dough.gmane.org>
Date: Tue, 7 Aug 2012 12:51:58 +0200
Message-ID: <CALbNGRRmpfhF15Uqkoz80Gdr-pKANeubnnnXx7dRE8cwgEcx1w@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Cc: martin.jansa@gmail.com
Subject: Re: meta-openembedded patch queue
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
X-List-Received-Date: Tue, 07 Aug 2012 11:03:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Aug 7, 2012 at 12:32 PM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi,
>
> I've applied a bunch of patches and hopefully commented on all the ones I
> didn't apply. I also cleared the meta-oe patchwork so it's nice and empty
> now: http://patchwork.openembedded.org/project/oe/list/?q=meta-oe
>
> If your patch hasn't been applied yet into meta-openembedded master and is
> lacking comments, please resubmit it as [meta-oe][PATCH v(N+1)] (substitute
> N please).
>
> There are a few big deadlines coming up at work, so everything will have a
> few days of delay but if you haven't seen any feedback after a week and the
> patch is still sitting in patchwork, please send a reminder. Replying to the
> patch with 'ping' is usually enough and most people know where to find me on
> IRC.
>
> Koen
Two comments/questions:
1. Koen: what about the fuse 2.9.x patch [1]?
2. Martin: right now I am testing your latest systemctl mask patches.
After that I want to add a patch for systemctl-native to take care of
'Alias' tag and put [2] ontop. If you agree I will create a pull
request including your patches - so no need for you to resend. Agreed?

Andreas

[1] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-July/040782.html
[2] http://lists.linuxtogo.org/pipermail/openembedded-devel/2012-August/040836.html


