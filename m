Received: from [209.85.220.224] (helo=mail-fx0-f224.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MhXBS-0001jl-N4
	for openembedded-devel@lists.openembedded.org;
	Sun, 30 Aug 2009 01:18:11 +0200
Received: by fxm24 with SMTP id 24so1184760fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 29 Aug 2009 15:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=qwiEO3/lETJ4x9pAqUTYAxW2+sxRnOydCPFnZ8e2wpg=;
	b=jw5wskZ1QrVKH5px5S2M11XrvRXi8kWT5BbQiVpNL9bsG7c2m6zQsJmjWr6SDo0O87
	lG6RCCAaq8giszUmC338AkZCN+SWfksQW+2gDEZ2FOFYU+p9hQQx53i2sS0roW5a7HYI
	crC+7rEbSEfmj3Q+8IH8DP+nJMwYVsDJCE4yQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=K4C63XHvm2Bx1yy94DWt2ZXEAAm+1G74kX6PDWLAvxvwdJXh28N2Zr0JEOxa9jPwfj
	NeBKk8EcDk6KALPfE8Vi2rVkmoGrTfLGkWq+DS5dqciXo2H9ke57Ingori0ga4dzFsWJ
	Caiejoa6yC38t0ZshSgKRfJwQppCIxZRO+Y2M=
MIME-Version: 1.0
Received: by 10.103.50.28 with SMTP id c28mr1242498muk.17.1251586789237; Sat, 
	29 Aug 2009 15:59:49 -0700 (PDT)
In-Reply-To: <a63ecaf0908291539w658d9484r5d0d4b82dc041ab@mail.gmail.com>
References: <a63ecaf0908281452x12ab1a84w9df0b4a9e0f98163@mail.gmail.com>
	<19c1b8a90908281524m6c00b34eg7eb8fca9652a74f@mail.gmail.com>
	<a63ecaf0908291539w658d9484r5d0d4b82dc041ab@mail.gmail.com>
Date: Sun, 30 Aug 2009 01:59:49 +0300
Message-ID: <fce2a370908291559n6c7d9c4fy8c323155b56ce006@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Error with xterm_207.bb in Fedora
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
X-List-Received-Date: Sat, 29 Aug 2009 23:18:11 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 30, 2009 at 1:39 AM, Sushi Sensei<sinestado@gmail.com> wrote:
> Txs Khem!
>
> How I can to requesta a git account?
>
>
>
> 2009/8/28 Khem Raj <raj.khem@gmail.com>
>
>> On Fri, Aug 28, 2009 at 2:52 PM, Sushi Sensei<sinestado@gmail.com> wrote:
>> > There are an error when try to select the mode for install:
>> > A patch for sinstall.sh will be added
>> > For example, changing line 120:
>> >
>> > PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e
>> 's/r-./5/g'
>> > -e 's/--[sxt]/1/g'`
>> >
>> > for:
>> >
>> > PROG_MODE=`echo ".$cf_mode" | sed -e 's/^..//' -e 's/rw./7/g' -e
>> 's/r-./5/g'
>> > -e 's/--[sxt]/1/g'|tr -d '.'`
>> >
>> >
>> > I don't know to who send this "patch"
>>
>>
>> git-format it nicely and send it to very same list.
>>
>> http://wiki.openembedded.net/index.php/User_contributions
>>
>>
>> Thx
>>
>> -Khem
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>
> --
> ------------------------------------------------------
> --- Timeo Danaos et dona ferentes ---
> ------------------------------------------------------
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

You don't need git account for openembedded to be able to clone
repository locally and then send patches to this mailing list with git
send-email.


