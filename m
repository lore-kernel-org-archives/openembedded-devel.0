Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UIIAU-0008RV-OT
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Mar 2013 13:31:00 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so1654139oag.30
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Mar 2013 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type;
	bh=cSr6ZbmZfSlRwxwk4WXtWVI+QaC2MzChTCtJcK7T0Kk=;
	b=bPHGieXdDFe/6YldgZeRLKF/CVUrmf5Z/j6TPRCglOly85f6G0aYuqOPgKXF/byfW7
	Q6m8/QFSCdbyj+DXk1XRfrRVPR2a9rA0WenXvXRU5OCz5PBYofO8LiSik8JexWFKqIGl
	gw2JthWh408Zx9iz3w9i+LJWsvYc9dDOoGN3n6ecQHo/MlRUPsneCDFHrqYeH2yCROVs
	z5UO/kGwsd7NLWOB9i/yfDJLg+co+XaJGZ7uJ/SZRmFGZNm7Uefay4CHhg40tQ8cET9S
	b/yke4WTaMf8N0Fl0ENdJuyJ48wU371Hc6vYZkMVs/fLepkBICRFj1fPKNwm3KVbRBGA
	DunA==
MIME-Version: 1.0
X-Received: by 10.182.127.115 with SMTP id nf19mr3858991obb.49.1363781647450; 
	Wed, 20 Mar 2013 05:14:07 -0700 (PDT)
Received: by 10.60.76.199 with HTTP; Wed, 20 Mar 2013 05:14:07 -0700 (PDT)
In-Reply-To: <20130307155654.GQ32228@jama.dyndns-home.com>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<20130307150552.GN32228@jama.dyndns-home.com>
	<CAGiJk9cS8WG5pyJ7Op1XTqxTXk_xRhcAUGXq4hie01FL3vi5SA@mail.gmail.com>
	<20130307155654.GQ32228@jama.dyndns-home.com>
Date: Wed, 20 Mar 2013 13:14:07 +0100
Message-ID: <CAGiJk9cgNv2JCxwKu4OauRGY9zUBAcn71=JGZmw5wT_fOsuHNQ@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	martin.jansa@gmail.com, raj.khem@gmail.com
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
X-List-Received-Date: Wed, 20 Mar 2013 12:31:01 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Martin Jansa <martin.jansa@gmail.com>:
> On Thu, Mar 07, 2013 at 04:20:42PM +0100, Samuel Stirtzel wrote:
>> 2013/3/7 Martin Jansa <martin.jansa@gmail.com>:
>> > On Thu, Mar 07, 2013 at 01:09:38PM +0100, Samuel Stirtzel wrote:
>> >> 2013/3/7 Koen Kooi <koen@dominion.thruhere.net>:
>> >> > Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
>> >> > ---
>> >> >  README | 2 +-
>> >> >  1 file changed, 1 insertion(+), 1 deletion(-)
>> >> >
>> >> > diff --git a/README b/README
>> >> > index 0635e10..cab1e21 100644
>> >> > --- a/README
>> >> > +++ b/README
>> >> > @@ -10,7 +10,7 @@ Samuel Stirtzel <s.stirtzel@googlemail.com>
>> >> >  Contributors:
>> >> >  Copyright 2012 - Kai Kang
>> >> >  Copyright 2013 - Khem Raj
>> >> > -Copyright 2012 - Koen Kooi
>> >> > +Copyright 2012, 2013 - Koen Kooi
>> >> >  Copyright 2012 - Robert Yang
>> >> >  Copyright 2011, 2012 - Samuel Stirtzel
>> >> >
>> >> > --
>> >> > 1.8.1.4
>> >> >
>> >>
>> >> Thanks for your patches,
>> >> I applied them all.
>> >
>> > Can you update status on:
>> > http://patches.openembedded.org/bundle/jama/meta-kde/?archive=both
>> >
>> > To keep patchwork clean?
>> >
>>
>> I would, but unfortunately I have no Patchwork account.
>> Also there seems to be no possibility to register a new account.
>
> Adding khem to CC: I guess he can arrange account for you.
>

Hi, so far I did not receive any info on how to create / access a
patchwork account.
Maybe something went wrong / got lost in transmission?


--
Regards
Samuel


