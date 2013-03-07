Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UDbgY-00069H-GM
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Mar 2013 15:20:43 +0100
Received: by mail-ob0-f176.google.com with SMTP id v19so357740obq.35
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Mar 2013 06:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=4M7J+xSNFoJvYC867oE+jJGWtJwD7bHt1R0iqMv6STM=;
	b=IdOe8wBiNFfPjnvw86nGO/jESj9g4eQ7gPSgBsOopOkWkLH23jHB6LuGE8W8rGxQqY
	bDmw7oUgc9bGIZc1wASM2Ap7J5nO8eSnu1Sik/6/RTsXC9g+Pesjk6S3WGuB0XwMy6Je
	MLQ3OrzmrQ8nbA8p7lxiuxgaJNfuNV/v1pJOMpsrvLMStz2TZdql7kNteYLRsDBW18pj
	DHwJQypZzUhuwNh6CUSsC4LX8l9XzKBTxvYonSG0713cfeNroWLzAHoVztRKG0a1AdV1
	L0RXW8kdwQbLzzkCQe0TaxTP+tTXJUkgH5e7jCkHcE5rTIdi+nVdThHxcLOXIUZaAmcI
	5yrg==
MIME-Version: 1.0
X-Received: by 10.60.172.108 with SMTP id bb12mr26795285oec.110.1362665049891; 
	Thu, 07 Mar 2013 06:04:09 -0800 (PST)
Received: by 10.60.76.199 with HTTP; Thu, 7 Mar 2013 06:04:09 -0800 (PST)
In-Reply-To: <1623937.LnU3QZzoXA@helios>
References: <1362649839-9160-1-git-send-email-koen@dominion.thruhere.net>
	<1362649839-9160-3-git-send-email-koen@dominion.thruhere.net>
	<CAGiJk9fvW_5jNScu23YvC81i-R481ykNMRaj8aHM92etym8m1g@mail.gmail.com>
	<1623937.LnU3QZzoXA@helios>
Date: Thu, 7 Mar 2013 15:04:09 +0100
Message-ID: <CAGiJk9ccLrFrRqE24onbmLJROVogmpSRUCRtQdr5JaDGqc71Aw@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-kde][PATCH 3/3] README: update contributor list
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
X-List-Received-Date: Thu, 07 Mar 2013 14:20:45 -0000
Content-Type: text/plain; charset=UTF-8

2013/3/7 Paul Eggleton <paul.eggleton@linux.intel.com>:
> On Thursday 07 March 2013 13:09:38 Samuel Stirtzel wrote:
>> Unrelated to your patches:
>> There are some upcoming changes, but they don't fit into yocto 1.4
>> (assumed that yocto is the orientation point for third-party OE-layer
>> releases).
>> So there will be a yocto-1.4 branch in advance and the development
>> will continue on master.
>
> FYI, the layer index web interface I'm putting together [1] will understand
> certain branch names across all layers, and the convention so far has been to
> use the release names i.e. denzil, danny, etc. If you are able to follow this
> as well once the 1.4 codename has been announced then your branch will show up
> correctly in the new interface.
>
> Cheers,
> Paul
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=3272
>

Good to know,
so layers like meta-qt5 [1] for example will be found more easily.

I will rename the branch after the codename has been announced,
but yes it would be easier if the name could get announced long before
the release.


[1] https://github.com/meta-qt5/meta-qt5


--
Regards
Samuel


