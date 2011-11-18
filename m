Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1RRP88-0001gd-PX
	for openembedded-devel@lists.openembedded.org;
	Fri, 18 Nov 2011 15:09:24 +0100
Received: by ywt2 with SMTP id 2so2507911ywt.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2011 06:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=AzS3bKdzjCm01WLYZq9T+PHGogvm9LiVr8lH7sXe8v8=;
	b=YgZlXKfe816ieF0Fgt//BXeA1eEr5ZVZQDe2tXJ2IHD0PncOCWTCmcmku+1Ch+OlyW
	iEURHhT1w6GK/DjYRNbfe7TPpD14IsTfYzxUyJLpDjLgdBkvEk6bCPc0XQYQwLVnU1y+
	zMBE9pI0WQofUBkxHsrjrX10CQP7IRrrYVF28=
MIME-Version: 1.0
Received: by 10.101.11.18 with SMTP id o18mr799493ani.86.1321624978415; Fri,
	18 Nov 2011 06:02:58 -0800 (PST)
Received: by 10.150.229.21 with HTTP; Fri, 18 Nov 2011 06:02:58 -0800 (PST)
In-Reply-To: <3257489.OMhGnQsRki@helios>
References: <cover.1321575642.git.andrea.adami@gmail.com>
	<20111118131116.GB3549@jama.jama.net>
	<CAAQYJAu8UbRXaFpExAioYyxfsy_tM9hm3k=yipO8Fu_zRxO3XQ@mail.gmail.com>
	<3257489.OMhGnQsRki@helios>
Date: Fri, 18 Nov 2011 15:02:58 +0100
Message-ID: <CAAQYJAs=jxLf8moiFwNyg3Rnqxe2EHe4c4ARrZW3ms2VrS=5JQ@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-handheld][PATCH 5/5] linux: remove unused git version
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
X-List-Received-Date: Fri, 18 Nov 2011 14:09:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Nov 18, 2011 at 2:51 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 18 November 2011 14:45:32 Andrea Adami wrote:
>> My thoughts are that Pavel is always testing bleeding edge way before
>> we commit it in OE while Dmitry told me repeatedly he prefers to base
>> his patches on stable, older kernels.
>
> You're right, but I figure if we have the mechanism to allow people to build a
> bleeding edge kernel already, let's keep it for the moment.
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

Ok, I'll refresh and refactor the recipe then. Patch will follow.

Cheers

Andrea


