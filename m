Return-Path: <cliff.brake@gmail.com>
Received: from mail-qc0-f174.google.com (mail-qc0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id 0949865C8D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 19:35:19 +0000 (UTC)
Received: by mail-qc0-f174.google.com with SMTP id o8so1232777qcw.33
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Jul 2014 12:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=BYGGVIb7PSFrHXgF9Pl9HijmoIFKuSlfeTBgkKechgE=;
	b=pyVuLp9qTQDX07mZDXCuw9S61ZEH+UTWy027liCtPLEUFAyRIGufYNX59dWrwsGtc/
	b8nF9HSbXULf8hfqUU4LLaSl2f5zPcuVdsZ0KK3B4A8EEpX+4A2FepUUwGlDvHM7+zlf
	onlmCT6KiEMVUIIEbPi9KScfp9FbszG9YmUcGr9AJ0fZxS4NiQnYzDAM2aCxIrIMbIbo
	nCGcrROHtfTMl03cKvPjJRjPAuE+iaUZ6mc4U1q6XmHlC5JjJk5iOyXL++xUFkzd7FOs
	USNbwOmW1JohmBbj3DxBURAF6DYv+iUhq1mEvKdK7aoZiS+6uVDV0Uw9OyqD+FoxcdG5
	DABg==
MIME-Version: 1.0
X-Received: by 10.140.82.113 with SMTP id g104mr48532067qgd.55.1405539320771; 
	Wed, 16 Jul 2014 12:35:20 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.19 with HTTP; Wed, 16 Jul 2014 12:35:20 -0700 (PDT)
In-Reply-To: <53C6B577.2050909@gmail.com>
References: <CAP9ODKow7gr1J8_peZJNT4+soQ_vDQP_hi4DYnjx7E0uTCUoBg@mail.gmail.com>
	<53C6B577.2050909@gmail.com>
Date: Wed, 16 Jul 2014 15:35:20 -0400
X-Google-Sender-Auth: HZjpniYgg1cVD6Ara5O9rimJdI0
Message-ID: <CAOd_LFw=J=cihJBH47N+7NYcLo4bs4BY7d93PY+Xy=_vv5DkJQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [for-daisy][meta-oe] Patches to cherry-pick from master
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
X-List-Received-Date: Wed, 16 Jul 2014 19:35:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 1:25 PM, akuster808 <akuster808@gmail.com> wrote:
>
> On 07/16/2014 08:21 AM, Otavio Salvador wrote:
>>
>> Hello,
>>
>> Please cherry-pick following patches into daisy branch:
>
>
> who does this?

I created a pull request and sent to maillist with these two patches,
plus a zeroc-ice patch.  Not sure if this makes it easier for Martin
or not ...

Thanks,
Cliff

