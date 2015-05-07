Return-Path: <k4230r6@gmail.com>
Received: from mail-la0-f46.google.com (mail-la0-f46.google.com
	[209.85.215.46])
	by mail.openembedded.org (Postfix) with ESMTP id 5C26C73C81
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 May 2015 06:56:05 +0000 (UTC)
Received: by laat2 with SMTP id t2so23731859laa.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 May 2015 23:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XA6BMj/jFuNZMmLgjS5cGmDMyV4Ya84Qsr4I9uQo1jc=;
	b=c61AqXrToKP4v6+L+JANOFwxG7WrDjxkhyUvPeXu3sulytqbBoD9BDgyv8GoU+61Vm
	OogxCz2huafpiw/6nwBRZDcFfYV6yFMAMtOgxV6ICDKb1UDqTHIOBVgKEgwsOp6CDGkA
	WER4wknHQcZvoComxWq1MPlN/TCN52r1haxZdzOBz0xCAcRsCwT3ARgHlLNpyE60AjPM
	YWLN58dri0yFlCJPpcVRJc9T+oYkZD1sSQR1Juk1T2OupJ6iOMefThrHFuu48wm+yoVC
	Ez3CzNNLvUj+qlKSt99HO5pIGA7Lr5l52J7Rx5RwvJJDg/VvH2vXcZEp5PkqKaLsELvr
	iIeA==
MIME-Version: 1.0
X-Received: by 10.152.224.164 with SMTP id rd4mr1886725lac.77.1430981766138;
	Wed, 06 May 2015 23:56:06 -0700 (PDT)
Received: by 10.25.82.65 with HTTP; Wed, 6 May 2015 23:56:06 -0700 (PDT)
In-Reply-To: <554A8A7A.6030404@gmail.com>
References: <55483F50.5020803@gmail.com> <554A76F1.8050407@gmail.com>
	<554A7893.3060701@gmail.com> <554A8A7A.6030404@gmail.com>
Date: Thu, 7 May 2015 08:56:06 +0200
Message-ID: <CAALGJZaMCx0-daBCjkP_NrmnheTJQYLW2hU2bSpTW1ij0pMb8w@mail.gmail.com>
From: Christian Ege <k4230r6@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Odroid-xu3 support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 May 2015 06:56:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

2015-05-06 23:41 GMT+02:00 Trevor Woerner <twoerner@gmail.com>:
> On 05/06/15 16:24, akuster808 wrote:
>> On 05/06/2015 01:17 PM, Trevor Woerner wrote:
>>> It'd be nice if someone could put together one "meta-odroid" that would
>>> support them all ;-)
>>
>> Yep. looking into that.
>
> That's great to hear :-D Which device(s) do you have, just the -xu3? My
> -c1 arrived yesterday so I can help with testing that device if you
> don't have one.
I think regarding the C1 the following two repositories are the most
complete one:

https://github.com/linux-meson/meta-amlogic
https://github.com/stoupa-cz/meta-odroid

Mine (meta-amlogic) is organised in branches named like
Yocto/Openembedded. The master branch needs some synchronization with
Fido branch. The layer I maintain is for Amlogic based devices because
I do own a ODROID-C1 and a Wetek.Play which both run on Amlogic CPU.

From the ODROID family I do only own a ODROID-C1. If there will be a
combined Layer for all odroid devices I will  port my recipes to this
and can help on supporting it.
I am mostly interested in Multimedia stuff and I do plan to setup a
separate layer for Kodi/XBMC on amlogic based devices.

So how should we proceed with the layer jungle?

regards,
Christian

> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
http://project-magpie.github.io/

