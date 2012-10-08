Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TLEAX-0004xx-Vf
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 16:18:54 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so2511728eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Oct 2012 07:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2vJkEEKFxE7FPsuNqKgFyB5S7t0DUu0bmwxTE9UeYNU=;
	b=dvkjhAJwMW9OhTDE12WRgqksar/vnrCg7/PsQazjBH2GfzjstfTrAJRginw234ptyS
	5T+e1bmm1XmiZgGARrUl2S4cc4U66iPBoOGx9BofHPAKssvRrrakYOK8kc/+jrH87A7o
	j27R1L+RnkQOXZ/O1Xe/yu7l2u1MYopQG5Td6GJ6EWAiA6lbQNn0tiKqUCTRGzjO7qdn
	vRRTc/+fqNphSRSlvg5AXs+c1Pl1Dmros+XCId3LUk/0/SFo/eKeekctZ0zr8HCLgRjh
	jKUNAGcK2XWZVmU4zuHpoRcMqwx1YhWUzc2u57zupK0o4Gg4JlGtGtj97Po9OYNR/tRi
	afrw==
Received: by 10.14.221.132 with SMTP id r4mr22481451eep.29.1349705148002; Mon,
	08 Oct 2012 07:05:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.219.66 with HTTP; Mon, 8 Oct 2012 07:05:17 -0700 (PDT)
In-Reply-To: <5072B67D.5040208@nedap.com>
References: <5072B67D.5040208@nedap.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 8 Oct 2012 07:05:17 -0700
Message-ID: <CAMKF1sqMmrBvzqhpPE+NRrgR3hNURB6R0hnNZNECBQpqoZRVvA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: jni.h included
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
X-List-Received-Date: Mon, 08 Oct 2012 14:18:54 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Oct 8, 2012 at 4:18 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi All!
> probably a stupid question... my apologies!
> If a source I'm working on #include jni.h what do I need to add in a recipe
> to get it translated?

DEPENDS += "openjdk" or something like that which denotes jdk

> Thanks!
> Jaap
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


