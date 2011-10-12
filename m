Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RE0qM-0004S4-VA
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 17:35:43 +0200
Received: by pzd13 with SMTP id 13so334466pzd.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 08:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=wIGrrhwBB2hhwrZ13yXpgEmgSuvthQS6zoh5l9r6PKg=;
	b=wKICW9jX+8Tdjx95Xjc7AP2Pzn9MpTJRgsyPQdlxgy+xJS+QonVyY2/PU+FJwcup5O
	fe4pDYjhz/l8vUjQzwUCmaqipBZjl1vRc6iYPfDG/3rTmN1yTKtjX0u8RKts4DF2iBmL
	zX8LZZZx+OaeMURe4NzFYv7f+VLj1nnm00Byc=
Received: by 10.68.28.4 with SMTP id x4mr1992015pbg.56.1318433399075; Wed, 12
	Oct 2011 08:29:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.58.168 with HTTP; Wed, 12 Oct 2011 08:29:29 -0700 (PDT)
In-Reply-To: <1318408173.3556.4.camel@mattotaupa>
References: <4E953D5E.3050908@telia.com> <1318408173.3556.4.camel@mattotaupa>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Oct 2011 08:29:29 -0700
Message-ID: <CAMKF1spkbLAbLJmcvJkhqX=p3umU2un7Yn4Uf+8-P0xdwOX-vA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Can someone pls prune a few obsolete branches in openembedded?
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
X-List-Received-Date: Wed, 12 Oct 2011 15:35:43 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 12, 2011 at 1:29 AM, Paul Menzel
<paulepanter@users.sourceforge.net> wrote:
> Dear Ulf,
>
>
> Am Mittwoch, den 12.10.2011, 09:10 +0200 schrieb Ulf Samuelsson:
>> All the branches:
>>
>> ulf/linux-2.6.30*
>> and
>> ulf/test
>>
>> are no longer in use.
>> All the stuff is already in mainline.
>>
>> Can someone please remove them?
>
> Is for example `git push origin :ulf/test` not working?

thats not allowed since it can result in accidental deletion of wrong branches
>
>
> Thanks,
>
> Paul
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


