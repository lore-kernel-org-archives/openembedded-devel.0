Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1S86AJ-0005oF-M3
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Mar 2012 09:36:07 +0100
Received: by iaag37 with SMTP id g37so3370204iaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Mar 2012 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=cfcMYCQgvAYomoDfdnH9ZVREpKpLITw740UgMe8DsoU=;
	b=xRWYPlhAgcDDXZVL1h34+uK/rpaBUURRWbIP7Ve09m1bQSCi9UI2yq/OVOzJtYkU5e
	TpHY6QCBjUPTzK2RvrSRaVZ4dFXfov1fKCRtRS6rJaLDovBHp1OpzR7v1sZ7u4VcyxvX
	YRSv6d68UA5kvZOHiUnHopJ9sayhcvNavJiQ3KObWnMAmuQuZPhpgLbK2DB63fYaD2CM
	Ef96JCdyBWoqJNdp9gLwOVVygc2TucVgh8oZFBjnC8Og6/vqttfY4EHIxw+z8Qk2gekv
	nu1QbaDdVS5S+0UOFBWpVkaG5q4Oqy25WI+VBop5Y8vwsY5/KZAeMwcZgbNCcSbOTFTl
	Egqg==
MIME-Version: 1.0
Received: by 10.43.45.10 with SMTP id ui10mr7151482icb.32.1331800040522; Thu,
	15 Mar 2012 01:27:20 -0700 (PDT)
Received: by 10.42.75.137 with HTTP; Thu, 15 Mar 2012 01:27:20 -0700 (PDT)
In-Reply-To: <CAGiJk9c+bcDHk5MCOE_bRRyi-c9tDy6cjPvFgcrpiXtHpPGOWg@mail.gmail.com>
References: <4F610B38.5060309@dynamicdevices.co.uk>
	<CAGiJk9c+bcDHk5MCOE_bRRyi-c9tDy6cjPvFgcrpiXtHpPGOWg@mail.gmail.com>
Date: Thu, 15 Mar 2012 09:27:20 +0100
Message-ID: <CALbNGRTRjx=MdV_cmisCaXrR_GT0nVyzzs29FT-sHymCYh48=A@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oe-core layer including support for i.MX28
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
X-List-Received-Date: Thu, 15 Mar 2012 08:36:07 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 15, 2012 at 8:17 AM, Samuel Stirtzel
<s.stirtzel@googlemail.com> wrote:
> 2012/3/14 Alex J Lennon <ajlennon@dynamicdevices.co.uk>:
>> Hi,
>
> Hi,
>>
>> I'm trying to begin the migration from oe-classic to oe-core, focussing on
>> Freescale's
>> i.MX28 and i.MX51. I recall there was i.MX28 kit being demo'd at FOSDEM but
>> I can't
>> seem to find support anywhere for the i.MX28, which I thought might be in
>> meta-fsl-arm?
>
> did the meta-fsl-arm developers merge the meta-freescale repository?
> AFAICT there was support for i.MX28 in Andreas git repository:
> http://gitorious.org/schnitzeltony-oe-meta/meta-freescale
>
>>
>> Can anybody point me in the right direction? (I've half a mind to try adding
>> the support
>> into meta-fsl-arm myself but that would seem somewhat wasteful if it's
>> already been
>> done)
>
> The meta-freescale repository might need some work, but it is a starting point.
>
meta-freescale merge to meta-arm-fsl is in progress - thanks Otavio:)

Andreas


