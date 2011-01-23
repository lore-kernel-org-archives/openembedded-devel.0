Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ph3vF-0006Ld-91
	for openembedded-devel@lists.openembedded.org;
	Sun, 23 Jan 2011 18:40:17 +0100
Received: by yxd5 with SMTP id 5so1168887yxd.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 23 Jan 2011 09:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Md57zngboa/EFakyO7VhR1bcw8ggmfER63EQmA3oAF4=;
	b=e0ysQgPNgbc/4Hi1houvYn6b4jLmqEHFX5hnKXAm6W8B7Af0IXMQOr56a7N1B+1nko
	zd6vg2MMhvuefKFDBqB9SrhwWqj3pekhG+5NGm1QAVRarcSjCuuKKkiaEF1V+VdcY6OY
	kYpL5rucD+PR7U/7SQU8dqkRIjX4WbP/zGwL8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=r0z1cisRYMamPJ7YniPCAK/LyohwUjU0KSzI0E2uBtx4ZJwUNo19v+xTwWTW8KyJ1v
	0+/H1/tMrnD57X10+zrhLjaac+OLAKuIca+o1gupBmWrqDrGkDTYTojG4v7W5wM+whYD
	DKgzw4RRKSYUSqO0lNJ3HuZaSI4vitELFFLYM=
MIME-Version: 1.0
Received: by 10.90.100.4 with SMTP id x4mr3765487agb.4.1295804370403; Sun, 23
	Jan 2011 09:39:30 -0800 (PST)
Received: by 10.90.55.10 with HTTP; Sun, 23 Jan 2011 09:39:30 -0800 (PST)
In-Reply-To: <4D307445.4090901@dresearch.de>
References: <AANLkTim9j=t8uDyabZbN4epTC-JwfmktyERydQsxxjyx@mail.gmail.com>
	<4D307445.4090901@dresearch.de>
Date: Sun, 23 Jan 2011 09:39:30 -0800
Message-ID: <AANLkTim7L=YcOr5xHicAVmHroP=RBa=hNY3m_EtYnrYv@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: testing branch 2011-01-13 - do_configure python failed
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
X-List-Received-Date: Sun, 23 Jan 2011 17:40:17 -0000
Content-Type: text/plain; charset=UTF-8

It has been fixed already check master

On 1/14/11, Steffen Sledz <sledz@dresearch.de> wrote:
> do_configure python - 2.6.5 - ml12.2 failed with:
>
> checking getaddrinfo bug... buggy
> Fatal: You must get working getaddrinfo() function.
>        or you can specify "--disable-ipv6".
> ERROR: Function do_configure failed
>
> see <http://tinderbox.openembedded.net/packages/1709663/>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
Sent from my mobile device

-Khem


