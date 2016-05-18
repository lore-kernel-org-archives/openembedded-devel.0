Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2C87B62135
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 18:21:45 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id i2so11606415oib.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 May 2016 11:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=/GFyJjruWye8VkTeeV0INJ7WyQbKr+dTPuu6xRI0cnU=;
	b=GclLXMVkv71FktUooSyLWwXByRfLgPM5j2aondgiIxwl64SWI4hNOrOrm6raFxoXaF
	GRICcmKcl8qnn6XE+9h9DO3ZTOesXi1l+o2DojOKDVOsys9qh6rFebyD1yW2r6rfMiHj
	O+jGhw6t/Jy6RSIKcZeaLEFZpu6Jg31eIw3asVBNDS5qAqknTXHhNnL8JMsIH1zPa7mL
	idXM+zKQQL+5nBWt9LuEdeT2TSUsp3r2CMpV+s9hpxeJVmRw89NvQ9xBHbJSgWEGJZzy
	qyxpWEa2KX1VV/fRG+kyiA7tLNTbMlLA1lYtansIS9bcNM74JFq6/SLfwCeukrkB4X5k
	09Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=/GFyJjruWye8VkTeeV0INJ7WyQbKr+dTPuu6xRI0cnU=;
	b=Vttv9SqdsMWViXRR4gWcLcKR5J+FolmM1fohDMS7LXKnx97p3DsTyHKwT21AeNoxW7
	a8xNNPmZAYylLgHrM+k4RBbJW29KMZ79pHIxhDky0tE2Qz1Oe8aEKt3tdcoasfXlCy06
	RQSIzEUr5yqyfnyjtj7Sr+xiVrdiVXOZWSMSAUoZIr+wEFWCwpVOy1cVD8FhFUkN/S9Y
	Y3aiRO7EzpEnIZACjHeUqcD/SvyWtbIjmXB3sJm3pEn3N4QW7r25y0UNUHCrK5gKtGxO
	JyVi4VkILwzgcfjuSOFAC7pLzALU8jbFQgwnjb0gPeK61tmE4dsjqVEhZLS556FTxYVA
	s4Sg==
X-Gm-Message-State: AOPr4FVcncBntnLHcnrrSnt8EvPOLQRFNhKcbQ/Mgrj8Au+bGaZLYS2HLuhjrf0phy7oe4eMHiLgq1WvvAbJLQ==
MIME-Version: 1.0
X-Received: by 10.202.170.65 with SMTP id t62mr5179323oie.60.1463595706628;
	Wed, 18 May 2016 11:21:46 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Wed, 18 May 2016 11:21:46 -0700 (PDT)
In-Reply-To: <CADkTA4MCY-QGz9_sQ6MYXaFLUdwj5WzXEf16K8oTsB36t4qpXQ@mail.gmail.com>
References: <d1c192ed-565f-c0f8-fe1d-9be335743e71@eumx.net>
	<CADkTA4MCY-QGz9_sQ6MYXaFLUdwj5WzXEf16K8oTsB36t4qpXQ@mail.gmail.com>
Date: Wed, 18 May 2016 14:21:46 -0400
Message-ID: <CADkTA4MA6t=r7exrgsB7pBqfbUO5HjOyB8EgbXOqKt5QV7a8KA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jack Mitchell <ml@embed.me.uk>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virt] google code docker hg dependancies 404
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2016 18:21:46 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 18, 2016 at 12:39 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Wed, May 18, 2016 at 5:36 AM, Jack Mitchell <ml@embed.me.uk> wrote:
>
>> I'm hitting 404 errors with a couple of the docker dependancies. Can we
>> host these somewhere or does anyone know of alternative places these can be
>> obtained? I looked for the go-sqlite package but it seems to have been out
>> of development for some time.
>>
>
> FYI: Copy the meta-virt mailing list for issues with meta-virtualization,
> I almost missed this.
>
>
>
>>
>> /home/jack/projects/meta-virt.git/recipes-devtools/go/go-net_hg.bb,
>> do_fetch
>> /home/jack/projects/meta-virt.git/recipes-devtools/go/go-sqlite_hg.bb,
>> do_fetch
>>
>> An alternative would be to possible host someones cached downloads in the
>> alternative mirrors?
>>
>>
> I just cleaned my build and I'm seeing them as well. I'll take care of
> figuring out what has happened
> and fixing it.
>

Turns out that we don't need the dependencies at all. I did a clean build
and runtime test
without them, and all is well.

I pushed a fix to meta-virt.

Bruce


>
> Cheers,
>
> Bruce
>
>
>> Cheers,
>> Jack.
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

