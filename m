Received: from mail-ia0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TQL2Y-0008JI-9N
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 18:39:46 +0200
Received: by mail-ia0-f175.google.com with SMTP id b35so2160790iac.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 09:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vlGLGZqRSOXQD2Owtf6q4XA5yRt3PSdtA67yUsXZNjQ=;
	b=dBS+4ANIUE+9PCRGcnNaOFJYXzlTmRUP69rSPlWPUQiv0zozPNvCBVyaInZ7E68gFB
	zU4Z7K4XjyRbgmBuKLtk87eKuqh7SX9H5Yof4nMVgSmjWBQVdJyGFq1gfrrkefJwXKYP
	P1Va9UL+GFoBgax7cG1CDGpPMujmwVQ7CoYfax60tqwgNANVPz8a8k3Bl6uBhSLaRnhS
	mzmq3zMOmv7ASoer+q1Q0oXOMAAfJloA/2YujixsAddDuLJbIwFbsjI0GDIldnxJuD5C
	8ZOXAIxbTI7A2cp0R8jRoXt3ha7SVG4t86BWRBOjP88oha27DwIGKEwKXNb77Mz7UbAS
	ScLw==
Received: by 10.50.16.172 with SMTP id h12mr9851710igd.41.1350923180879; Mon,
	22 Oct 2012 09:26:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.103.104 with HTTP; Mon, 22 Oct 2012 09:25:45 -0700 (PDT)
In-Reply-To: <7074844.QapBLE5b39@helios>
References: <CAMKF1sqkMb8Z5Cda7qDXKYF1npKbJ-2yOAdWA=gNADs5UJAEew@mail.gmail.com>
	<7074844.QapBLE5b39@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 22 Oct 2012 09:25:45 -0700
Message-ID: <CAMKF1spmOOZXgWTSigq7PKDPYwi7j-273cwEM6ryFM0P1cHe+A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: patchwork is up again
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
X-List-Received-Date: Mon, 22 Oct 2012 16:39:46 -0000
Content-Type: text/plain; charset=UTF-8

On Sat, Oct 20, 2012 at 4:45 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Friday 19 October 2012 16:37:19 Khem Raj wrote:
>> If you dont use patchwork dont bother but if you do then it had some
>> hiccups which now has been fixed hopefully. So if you dont see your
>> latest patch on patchwork resend it.
>
> I just sent my hddtemp patch for the third time and it still hasn't been
> picked up by patchwork, so I'm afraid something is still not working properly.


we have always had issue with large patches. I dont know exact size but
pw did not parse large emails well. I wonder if your patch is large enough
to cross the bar.

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre


