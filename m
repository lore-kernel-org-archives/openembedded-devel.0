Received: from mail-oa0-f44.google.com ([209.85.219.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UARrP-0002Ld-Cg
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Feb 2013 22:14:53 +0100
Received: by mail-oa0-f44.google.com with SMTP id h1so6279148oag.17
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Feb 2013 12:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=VzqQshj5R0fuotAZRT8XKSHc+UW942mabRxNVDDjuEA=;
	b=0gb5VUvkgnbbqdQrpuB5XBZUZuu1PcwciaSwvF9BFAs5/9Zf25tKl3js0cGbz3puql
	ynguB3tPwderEjk9xT7CH/JQSPzPCX2I8ysBCPG7z5HEliEdeU0W3/WkZCfO+cgnVjPU
	g1nEfV2LJxXM0Zg1l0toVuKmwY3IfBQKaLsrcUvDciyRIWPcx+g7shJpIAtFZxtMhB7/
	arPBQJvu6KJA396Mnrs8hV9SQguHcAqIOSyWxUqkda7LLgQaewPElBjB8H1GJ6tc3Kqi
	Izj6k5xq6UbmkMjq71N9deC6Zq8wspkXtFbSlEiML5HzLoxzBJSOY0GOfIRlzag8HXo4
	ZaaA==
X-Received: by 10.182.110.33 with SMTP id hx1mr12803511obb.32.1361912311350;
	Tue, 26 Feb 2013 12:58:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.60.79.225 with HTTP; Tue, 26 Feb 2013 12:58:01 -0800 (PST)
In-Reply-To: <512D008C.5030705@communistcode.co.uk>
References: <1360707747-8128-1-git-send-email-jeffrey.honig@windriver.com>
	<511B6EA1.5020806@communistcode.co.uk> <5124FC05.40403@windriver.com>
	<5676087.MgqTuTql2e@helios> <17062.1361384358@schlepp.honig.net>
	<512CDD44.1010002@communistcode.co.uk>
	<20130226174206.GA13278@sakrah.homelinux.org>
	<512D008C.5030705@communistcode.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Feb 2013 12:58:01 -0800
Message-ID: <CAMKF1sqbJemUZWQyKDpdWT8QMuQZQw+Dpr+LQOW_r-n8hPYqQA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] hiawatha: ennsure C flags are passed to builds.
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
X-List-Received-Date: Tue, 26 Feb 2013 21:14:53 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 26, 2013 at 10:35 AM, Jack Mitchell <ml@communistcode.co.uk> wrote:
> On 26/02/2013 17:42, Khem Raj wrote:
>>>
>>> 8.8 has been released if someone wants to pick this up. I would
>>> myself but I'm currently blocked by a binutils failure.
>>
>> whats the binutils failure ? have you reported it somewhere ?
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
> http://article.gmane.org/gmane.comp.handhelds.openembedded.core/33812/match=jack+mitchell
>

thats not so much related here but I guess texinfo got updated

> and
>
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=3943
>


I have posted a fix for it. here

http://patchwork.openembedded.org/patch/45151/

please try it out and report back


> Cheers,
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


