Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 30B0B745A1
	for <openembedded-devel@lists.openembedded.org>;
	Sat,  7 Jul 2018 02:33:13 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id j8-v6so11202671lfb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Jul 2018 19:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Tr690pD8b25jPLYRLPjlVDfw1DcLSPD0lkDQL+C2qI=;
	b=BtG8iWf+eFHOMEHaNvu8jnIM4J5Jo2YGLGqXYlSuapJYJir7uZLj4wsRT+v3gUBoAm
	1FCdUnZTBHLyIPDtLOMZS2XAu7FwVG+oPM6EIX7xbXUZXAfLOxV1FkDoY0Sxxq4VgJb0
	gZimMUlBAmC/zMeiSLf5GyysxU/8PPcXBxy5vpi+QI6WKfd0qjiSm8wwSIKGPQCWm2kT
	lxxOEqto6fBJBuUxpOGKClfZmcUO4A9PP0/9FDTJRYQtmHfeLwYHZNxotwiuKwZVcPnE
	fKeyNkDlosy55oWUoR3hVrEJK6QNVJauMqzcamzZZ6i4bAg8KCUHMuiszThNkPDTdK68
	pw2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Tr690pD8b25jPLYRLPjlVDfw1DcLSPD0lkDQL+C2qI=;
	b=f5EHYOYQtxaTEEemNj00EUY5CjKHm2PFmh927753g42yWzlheR/UeB/PrqlGTXJ02v
	xTmx95ihhDS+iKFFKQU+INkd6z3FSOs1eQbaqKXI6XmhWW0aPH0swFsCeJNGxnlJlSzT
	23i4PMfX1XuZNyl1hc9wDRWB0eO7hsB4U3r1nhwHMfV5uTK7vFbXtLAJOgZqG9jUY6w6
	kAkjd/sC8mWE+Mgj4ueU/jbW0rtEY1J49e52/Tzy75ZXHkpFzWhXmPWhn8gS+dnph9UF
	FkDU+MdT8QcNyGm969/uRcx4KoH56Ko+k8RB2Bog5aGLOFUrZ8XJ5S2veoITkWi5nHIL
	kFtA==
X-Gm-Message-State: APt69E1hMomPFPwGH0p10TVVqK3DPUHMCE9MUxbkzniA2W5anSIxG9nt
	efvh/wKcKFOIdfHwfgCBvX4FGDCC2uvs2djAqPM=
X-Google-Smtp-Source: AAOMgpcL5eSIQvmkk4caXHFOcc3l5rj0qja05kEZGHICHNjIF+YuXH2HCgzLsBvz3tbw+xnusJEz4yUOh5std0183/Y=
X-Received: by 2002:a19:14cf:: with SMTP id 76-v6mr8595758lfu.49.1530930793588;
	Fri, 06 Jul 2018 19:33:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 19:33:12 -0700 (PDT)
In-Reply-To: <e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
References: <20180706062625.7363-1-ueba.takuma@jp.fujitsu.com>
	<e19a9f68-d15d-0894-492a-0dd2d3f4cee4@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jul 2018 22:33:12 -0400
Message-ID: <CADkTA4NVMGJyu8L7-0Nh+MnZu3oGxHQHCof0bh+Wm3jP7eq5bw@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] fix license from Apache-2.0 to MIT
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
X-List-Received-Date: Sat, 07 Jul 2018 02:33:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 9:15 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 07/05/2018 11:26 PM, Takuma Ueba wrote:
>> Signed-off-by: Takuma Ueba <ueba.takuma@jp.fujitsu.com>
>> ---
>>  meta-python/recipes-devtools/python/python-asn1crypto.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-asn1crypto.inc b/meta-python/recipes-devtools/python/python-asn1crypto.inc
>> index 5c379956f..660bf09a7 100644
>> --- a/meta-python/recipes-devtools/python/python-asn1crypto.inc
>> +++ b/meta-python/recipes-devtools/python/python-asn1crypto.inc
>> @@ -1,7 +1,7 @@
>>  DESCRIPTION = "Python binding to the Networking and Cryptography (NaCl) library"
>>  HOMEPAGE = "https://github.com/pyca/pynacl"
>>  SECTION = "devel/python"
>> -LICENSE = "Apache-2.0"
>> +LICENSE = "MIT"
>
> Why did the LICENSE change? maybe not that in the commit message. It
> helps the stable branch maintainer to decide if this needs to propagate
> to other branches.

I was wondering the same thing, and didn't get a chance to check! I
probably should have just asked :D

Bruce

>
> - armin
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=52010cd3c7d7bd965b55721ef4d93ec2"
>>
>>  PYPI_PACKAGE = "asn1crypto"
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

