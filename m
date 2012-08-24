Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1T4qEk-0006Dt-8I
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 11:31:30 +0200
Received: by iaky10 with SMTP id y10so2971874iak.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 02:19:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=XIpVmNJWSgurs2N/nxNbUan/cPfqG9xttur0pJhPawI=;
	b=zBjJUp5K6ppWOxfgC5H28q2FqzHjHF1R4X88DT726tc5vQw6y6mx++1ouuzAXrwPyb
	RPn4wzR0cVs7MrnDQAtGpP5Gvf9tVWdvTZE/fSPgVBhJfRIeu+9NC/3L3ITceIeW13D2
	C89J4Np8EO1zYU1uRynhToAL0eeLn44pY9bJWY6WRyy5itpqgmvv094rpqHTJrDPcdc+
	AdSL2nWtRZiGQucLqyB3Hcbm8NlGyIt6buL4tUHdN1VFZr/13SBjAedPlIYgjaiai/JB
	ar0oufDqDipeRdmGLpp6+yJLT6FI+tXVXNMP19PbUnlnkdEJxl3NMAJx5QLA7/CKkalj
	D6Og==
MIME-Version: 1.0
Received: by 10.50.242.71 with SMTP id wo7mr1365894igc.55.1345799962329; Fri,
	24 Aug 2012 02:19:22 -0700 (PDT)
Received: by 10.64.49.45 with HTTP; Fri, 24 Aug 2012 02:19:22 -0700 (PDT)
In-Reply-To: <k17eda$nmn$1@ger.gmane.org>
References: <CALbNGRTC=AL5g+CPvHQzVijDf9AJj3dHmxs7H7MeY4y5VygYKQ@mail.gmail.com>
	<20120823093511.GM3029@jama.jama.net>
	<CAJTo0LbmhE+cLgJn2nxcdbj1dVH+5Y8xaT1tgP7FPtBspmLFtg@mail.gmail.com>
	<k17eda$nmn$1@ger.gmane.org>
Date: Fri, 24 Aug 2012 11:19:22 +0200
Message-ID: <CAGiJk9cXbriDJ0oqPKcC-v0wbB2dMP9uJ=sTuc3L+WekYYtf6Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gnome.bbclass
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
X-List-Received-Date: Fri, 24 Aug 2012 09:31:30 -0000
Content-Type: text/plain; charset=UTF-8

2012/8/24 Koen Kooi <koen@dominion.thruhere.net>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 23-08-12 23:32, Burton, Ross schreef:
>> On 23 August 2012 10:35, Martin Jansa <martin.jansa@gmail.com> wrote:
>>> git log says it was because of 'hicolor-icon-theme-native' and
>>> 'gnome-common-native'
>>
>> Isn't that quite a sledgehammer approach, why couldn't BBCLASSEXTEND +=
>> "native" be added to just those two recipes?
>
> With the current tiny set of gnome recipes, only those 2 needed it. In
> OE-classic with a lot more gnome a lot more was needed. Over time the gnome
> cleaned up their act as well.
>
> KDE on the other hand....

I Don't know what you intend to say, but KDE is a BBOM with lots of
magical glue code ;)
My workarounds increase the "zero support for cross compiling" to
"somewhat more than zero support" that is all.

-- 
Regards
Samuel


