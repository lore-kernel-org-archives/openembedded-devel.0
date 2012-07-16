Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sqphl-0004bm-3g
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jul 2012 20:07:33 +0200
Received: by eeit10 with SMTP id t10so992726eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=1GW/9zeL9h7XbtCZZsI5DV4RJN2DuRSkAviPIw21DRY=;
	b=OVHr4NixvZQsjVV6NGd2JUDbwFaI99nuaQ5eXE/J7kEw9OOpiTNfUF3K8lJndtdlle
	sfcyfa5FgdizOcqaFssctswQ7CwFEPpB9DSEM8zRmDsIi9ynBH1RPl2u2gw449f6dHTI
	is2ITBCyLhwUm0SpU4wLGvWESjSe/GOlGYnzbhVGVm0MUfGp/7UnsuBADhBqbiKGfRmx
	wTykb+f9fUoL1KXCUxLHMPonLQ8WwJeHHIy9bycy1dCWQyo7yfYOXofZWSvzngkrGDny
	29Te0BPaQy1yS3b0oGB2ZW1FmxZXH2jk2wTdxptu+3aAg2h1rb23J1ZRoZeIc0kklxMA
	vc/A==
Received: by 10.14.177.73 with SMTP id c49mr10322513eem.20.1342461374786; Mon,
	16 Jul 2012 10:56:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 16 Jul 2012 10:55:44 -0700 (PDT)
In-Reply-To: <20120716175038.GL3729@jama.jama.net>
References: <1342460316-5489-1-git-send-email-raj.khem@gmail.com>
	<20120716175038.GL3729@jama.jama.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Jul 2012 10:55:44 -0700
Message-ID: <CAMKF1srccbhEC5JztcmzpOGeosO5TSbi=EoBTqFLf2vyUnnk4w@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC][meta-oe][PATCH 1/3] kernel.bbclass: Rename to machine_kernel_pr.bbclass which provides added functionality
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
X-List-Received-Date: Mon, 16 Jul 2012 18:07:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 16, 2012 at 10:50 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>
> There is also this change
> http://lists.linuxtogo.org/pipermail/openembedded-core/2012-April/021608.html
> which never made it to oe-core version..

I missed that part. That would need an enhancement in OE-Core to
provide a variable to override uImage if a machine asks for.


