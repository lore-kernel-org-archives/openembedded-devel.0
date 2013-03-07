Received: from mail-ob0-f182.google.com ([209.85.214.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UDcsd-00010a-3w
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 16:37:16 +0100
Received: by mail-ob0-f182.google.com with SMTP id va7so422916obc.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=8yLleADEIVWEcI0IcHFXk9q5uBv6kX1YNBSPG9bivjs=;
	b=oaW+w4dDyHIBNm5kSOOcmXFjNYb4NN8xztAd1RnUYt2dqBZB3QElKfhLEdmVe4+EgJ
	ar5QTH0JGDDz3cb+0ewfbF5zACMbx1mfBsKIkQfZPtLvtlD3vX7GID6z6AcfdF3dwCHn
	5fQOgBgawm40AX6HjKlj4FZySZDgYzUBULkUOVswG2hzxdFCSuPNuEqWHV8mtdFCdY+T
	4drH4fyHT0DQzCrlwNAUYoFvRmC4FVU2RfOv8yv68bH7FGrWGSQq4li4xDFI1oQMs9sQ
	arg4EQpEJ/c8bicQG+mUQeZN8ALI2KcTKgbf/f3rVGKVUCUUpU1VnMTpw0ke+yLBiomA
	ZJeg==
MIME-Version: 1.0
X-Received: by 10.60.13.1 with SMTP id d1mr26728619oec.55.1362669642377; Thu,
	07 Mar 2013 07:20:42 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Thu, 7 Mar 2013 07:20:42 -0800 (PST)
In-Reply-To: <20130307150552.GN32228@jama.dyndns-home.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<20130307150552.GN32228@jama.dyndns-home.com>
Date: Thu, 7 Mar 2013 16:20:42 +0100
Message-ID: <CAGiJk9cS8WG5pyJ7Op1XTqxTXk_xRhcAUGXq4hie01FL3vi5SA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 15:37:17 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
>> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
>> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> > ---
>> >  README | 2 +-
>> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >
>> > diff --git a/README b/README
>> > index 0635e10..cab1e21 100644
>> > --- a/README
>> > +++ b/README
>> > @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
>> >  Contributors:
>> >  Copyright 2012 - Kai Kang
>> >  Copyright 2013 - Khem Raj
>> > -Copyright 2012 - Koen Kooi
>> > +Copyright 2012, 2013 - Koen Kooi
>> >  Copyright 2012 - Robert Yang
>> >  Copyright 2011, 2012 - Samuel Stirtzel
>> >
>> > --
>> > 1.8.1.4
>> >
>>
>> Thanks for your patches,
>> I applied them all.
>
> Can you update status on:
> http://patches.openembedded.org/bundle/jama/meta-kde/?archive=both
>
> To keep patchwork clean?
>

I would, but unfortunately I have no Patchwork account.
Also there seems to be no possibility to register a new account.



-- 
Regards
Samuel


