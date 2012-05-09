Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SS7XI-0006zB-Cx
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 May 2012 16:06:36 +0200
Received: by yhjj56 with SMTP id j56so304749yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 09 May 2012 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=raicBT97f5L0TFa7U+G7blI4Iy2cvmgJ20CngYRUUIA=;
	b=MobgWsdLfO7Br7jOymVm1tew4/j4o+3Xi+KSoPRM6uSWGXRgcoBc9UMpGgsrW4FNoH
	4IyQBifQtTkZyDPThQz2YOp5zhBj/u/9NjDkaR/TNd11rcS+bMfwwtrDBf8L2oGm7yAF
	fjybbmrzZOSV5SwsOebJ31MnpUeYD/gY8l2YFd1iC39TbC3QduFyL4M6qNupn/+2S8sv
	gLewFNSyzT0kYVd5V5GbURx1gjCr5g1OPjKZjYh3Ifc/XMJrPLBigj4r2HMRwiLgSyiK
	y9QEuDPpGiuENeKE79WRACjmQZqd9ZB3mRHTtoPnuMsGzRp5fVmG2De4b06HHHG/Pp5u
	/3VQ==
MIME-Version: 1.0
Received: by 10.42.28.135 with SMTP id n7mr60129icc.46.1336571802958; Wed, 09
	May 2012 06:56:42 -0700 (PDT)
Received: by 10.231.49.134 with HTTP; Wed, 9 May 2012 06:56:42 -0700 (PDT)
In-Reply-To: <20120508171357.36ca109f@eb-e6520>
References: <CAOHjBZud0iQwc+FUQSkzxkVVWhZwgbCowNw8KSscOxtHmFcE0g@mail.gmail.com>
	<20120508171357.36ca109f@eb-e6520>
Date: Wed, 9 May 2012 15:56:42 +0200
Message-ID: <CAOHjBZvwr98gshdES5nKvnSu7+6NOmQS5bFxLNVfbtLj6YnHSQ@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] How to produce toolchain sdk
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
X-List-Received-Date: Wed, 09 May 2012 14:06:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Eric, All

thanks for your reply.

you can try :
> bitbake meta-toolchain
> or for qt embedded :
> bitbake meta-toolchain-qte
>
> Indeed I already tested meta-toolchain and got  NoProvider: meta-toolchain
the same for meta-toolchain-qte.

I tried to create adhoc recipe for my toolchain following the ones already
available as example but I
got alway the same message NoProvider: meta-toolchain-<name>
I'm wondering how to solve this blocking issue.

Many thanks.
Giuseppe

> Eric
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

