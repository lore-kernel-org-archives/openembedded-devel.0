Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TJQ0b-0006cx-Qu
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Oct 2012 16:33:09 +0200
Received: by eeit10 with SMTP id t10so3488791eei.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Oct 2012 07:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=N6AwKVuaQr1QU3CAeCWuvFUB3nEi1fOd/wVnIp/kqGQ=;
	b=A3DC/XO1ZwlPZlHZSelUImWe2OVtBwMsOkMddz4hboBppQ4u44PFCiYDDWqoOeYEJA
	gJZaw/AckmGuXh8A7MhGr43pki/kh+wMa8iH3Bas455nTYv8LJ+lRu7z7CN6LGoDPHXC
	J647EESNnAEY3ed4qwjqEIJ8+dLke4XUWTiNsN9f98ybjaoxWDUlFI8e3h+Quo91SpVx
	eJQiWHtPzHZtDRxuTQD9uE1bT6G242sn5xKw8n3XeRWpH6MR1ufYcM6SHXcMuwCvd5Az
	i5myLZa+fQIQyqwmMCIydsgni1dbhgGUVcNRudtiLcw6P0f3eXShdGIwGGgNdPp3uoU2
	rdKA==
Received: by 10.14.202.71 with SMTP id c47mr2920833eeo.42.1349274010124; Wed,
	03 Oct 2012 07:20:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.173.69 with HTTP; Wed, 3 Oct 2012 07:19:39 -0700 (PDT)
In-Reply-To: <70CC66F5C30A414DADDA6973E4CA391A6CBF8D@039-SN1MPN1-001.039d.mgd.msft.net>
References: <cover.1349107616.git.paul.eggleton@linux.intel.com>
	<1396458.ob1fernpZs@helios>
	<74B58CA1-2332-42D6-9652-4226D9484259@dominion.thruhere.net>
	<5056040.jAUIlqh764@helios>
	<70CC66F5C30A414DADDA6973E4CA391A6CBF8D@039-SN1MPN1-001.039d.mgd.msft.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Oct 2012 07:19:39 -0700
Message-ID: <CAMKF1sptXGD+fZ1NQNH4AY5TcYxLEb4mFsTRJTotSP9uTQFyTw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [meta-webserver][PATCH 0/6] Add meta-webserver
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
X-List-Received-Date: Wed, 03 Oct 2012 14:33:09 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 3, 2012 at 7:08 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Wed, Oct 3, 2012 at 8:43 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> The answer is no, it doesn't.
>>
>> I guess on reflection we probably ought to be consistent here though - for
>> better or worse, this is not what has been done when pulling in recipes from
>> OE-Classic for the rest of meta-openembedded. The commit message does already
>> list the changes from the original, and I'll concede that having just one
>> revision doesn't give a huge amount in the way of insight on previous origin;
>> ultimately as you say, OE-Classic is still there as a reference for that.
>>
>> OK, I've squashed those commits out on the branch. Would it be worth me
>> posting a v2 after all these changes?
>
> Actually, this is one really annoying thing about OE. When people
> rename the file 'git blame' comes worthless. Is there a way around
> this?
>

does git blame -M -C help ?

> -M
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


