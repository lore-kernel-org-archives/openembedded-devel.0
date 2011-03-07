Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PwYZq-0004kV-Jj
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Mar 2011 12:26:14 +0100
Received: by iyb26 with SMTP id 26so4088282iyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Mar 2011 03:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=9zQCO+7/LkvvHpMsqgItQUYjts9dnc3EVIjdr1Swj6U=;
	b=I11PMkJF5RSvx1lTYvk5+OsTLZa7nzljAeKcwIwShz6QdIPSBUNwyG9ZODiQtKR6hz
	Z0A/YGUGcu7nW80XvJgD0Jp004jRru+3au/DOksfYujCQrISlTDk2z5Kqyjobgg+As1R
	Pmr50l5z8Ltff0WI3k/CnDqCQhtXCMglq8Ius=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fjjlxknmyXac5f18gqqgeTfncsjQ4jxOwZfpXSOk2e6dvwpcRDXPn8V2qJ54RO5GIl
	NghH5o4rr0gXNCJ8rHmHh3pS9Pol0xRUMNKCtCYJcz6CA8vYMNuD2gyyXK3fdxmgSkq4
	at6dzhEn+0mhMcmNAHTRD76VXX+OIsk3WXj00=
MIME-Version: 1.0
Received: by 10.231.39.135 with SMTP id g7mr2787726ibe.173.1299497080824; Mon,
	07 Mar 2011 03:24:40 -0800 (PST)
Received: by 10.231.19.5 with HTTP; Mon, 7 Mar 2011 03:24:40 -0800 (PST)
In-Reply-To: <1299495229.2132.19.camel@phil-desktop>
References: <AANLkTinrZHXCyA2USHeuOijx0KrZrNVY7K3uhqwpLaao@mail.gmail.com>
	<1299188687.17920.150.camel@lenovo.internal.reciva.com>
	<AANLkTinT-GUhvmLxh80M-41SOAW7c8suBTg9ZR+Pmntq@mail.gmail.com>
	<1299495229.2132.19.camel@phil-desktop>
Date: Mon, 7 Mar 2011 12:24:40 +0100
Message-ID: <AANLkTikf1SibvHoA5TzEmEpsg3a+Wob5RbDY1-CJHf0e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gcc ICE (gcc 4.1.2, nios2), test program included
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
X-List-Received-Date: Mon, 07 Mar 2011 11:26:14 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/3/7 Phil Blundell <philb@gnu.org>:
> On Mon, 2011-03-07 at 11:24 +0100, Frans Meulenbroeks wrote:
>> > b) debug the failure for yourself (see the gcc manual and/or mailing
>> > list for advice); or
>>
>> Guess that is the road to travel. Maybe someone has some pointers on
>> how to get started with this.
>
> I guess the obvious places to start would be the GCC internals manual:
>
> http://gcc.gnu.org/onlinedocs/gccint/
>
> and the GCC wiki:
>
> http://gcc.gnu.org/wiki/
>
> In particular http://gcc.gnu.org/wiki/DebuggingGCC has some tips for
> running the compiler under the debugger.

Thanks, I hope that'll get me started. Actually ofc I know the
internals doc but was not aware of the wiki debugging page.

Frans


