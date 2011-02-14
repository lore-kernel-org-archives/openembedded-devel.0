Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PotVO-0007sy-H5
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 09:09:58 +0100
Received: by iyj8 with SMTP id 8so4521626iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FMKeaubG4UyKbh1miWZMKgQEpEiLbHQGxoetC4Dtj3U=;
	b=yDKcc4IJCbwYyCfJY5gudT6lpyZ4BBfhTMx+nmT9lT68Bu7lVpVPYVu/NEyEnveJKZ
	vPaPCdTiIuocEYqgWtoyk6BNlwePWQW76lsVkcOSqHxor3oov48s2sThaY7SG/O93r1s
	szsc0MNP1YlqgwBMdTKD3iq9+lw16YnQaxhug=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=eTbX9xv6bzAPT7We0PyPbkfEnpgvST+18NCknZof7X6LAgT4uRKwY0apbtFV6ABtin
	mHIPMngE8w81Ykm9YyzhXNpenHW2sK2+0VNLDgDvTcdpdu6BzJoVuTjoy2xAzIhWDhvR
	79vI9KLyvA4ZrcUTH4eqjukgsOW7bNpMf1lek=
MIME-Version: 1.0
Received: by 10.42.170.70 with SMTP id e6mr4497465icz.299.1297670927693; Mon,
	14 Feb 2011 00:08:47 -0800 (PST)
Received: by 10.231.30.73 with HTTP; Mon, 14 Feb 2011 00:08:47 -0800 (PST)
In-Reply-To: <4D585D07.70305@xora.org.uk>
References: <ij8d1t$cd9$1@dough.gmane.org>
	<4D585D07.70305@xora.org.uk>
Date: Mon, 14 Feb 2011 09:08:47 +0100
Message-ID: <AANLkTi=FjYGco4xmNaE_2hFdWMr9Br3b3wCG1zZ_f4YB@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: TSC agenda items for the next meeting
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
X-List-Received-Date: Mon, 14 Feb 2011 08:09:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/2/13 Graeme Gregory <dp@xora.org.uk>:
> On 13/02/2011 10:50, Koen Kooi wrote:
>>
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Hi,
>>
>> The new TSC is holding a meeting next week and we wanted to see if
>> anyone wants to suggest items we put in the agenda for the meeting.
>>
>> If you have such items, please let us know by replying to this mail.
>>
>> regards,
>>
>> Koen
>
> Re-inforcement of the "don't delete all old versions" policy, make sure this
> is in the wiki somewhere.

Not sure what you mean with re-inforcement and what policy you are referring to.
This topic has been discussed and decided by the TSC last may. See
http://lists.linuxtogo.org/pipermail/openembedded-devel/2010-May/020047.html
For now I haven't really heard reasons to deviate from it, and I think
there are more important things requiring the TSCs attention (like the
ones you mention below).
But I feel it is a good plan to make this policy more explicit in the
wiki, it is now somewhat hidden.

Then again if we work more towards releases the reasons for keeping
old versions might be less relevant.
and of course we could also decide to keep old versions in a separate layer.

What I QA wise would like to see is that all recipes (also old
versions) fetch and are building (for the archs/distros they are
intended for).
Non building recipes create a bad impression quite quickly.

Frans

>
> Rough Yocto integration plan.
>
> Start to think about the Policies section on wiki and whether it is
> relevant/correct now, and also what needs to change going forward to Yocto.
>
> Graeme
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


