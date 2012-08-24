Received: from ams-iport-2.cisco.com ([144.254.224.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mertsas@cisco.com>) id 1T4qjN-0002TU-6I
	for openembedded-devel@lists.openembedded.org;
	Fri, 24 Aug 2012 12:03:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=mertsas@cisco.com; l=1114; q=dns/txt;
	s=iport; t=1345801864; x=1347011464;
	h=message-id:date:from:mime-version:to:subject:references:
	in-reply-to:content-transfer-encoding;
	bh=T6y9dUF5Vw73MCr62xTIzvJowbyGZokYSRuFNdH4YWM=;
	b=KkNOaXL/5YDS3oCTAJ5wmCs9latGr1I30BbLCJF2A7l1wagJXAI95thx
	G4qVSI4d3HCD+/kqP7ijMOuMpZmifmyUCKLcMw1iNjQK9fBx9LTzjTGDk
	Bp96SCZunIt8pAKgir8F9WNQFhr/JTyPv61OtxiFWXUxEmoiXkH3et2hN 8=;
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: Av8EAOtNN1CQ/khN/2dsb2JhbABFulSBB4IgAQEBBAEBAQ8BWwoRCxgJFg8JAwIBAgEVAS8TBgIBAR6HawuZJqAVjn2DHAOTKYIrgRSESIhRgWeCZQ
X-IronPort-AV: E=Sophos;i="4.80,302,1344211200"; d="scan'208";a="76216636"
Received: from ams-core-4.cisco.com ([144.254.72.77])
	by ams-iport-2.cisco.com with ESMTP; 24 Aug 2012 09:51:01 +0000
Received: from [10.54.74.11] (dhcp-10-54-74-11.cisco.com [10.54.74.11])
	by ams-core-4.cisco.com (8.14.5/8.14.5) with ESMTP id q7O9p19a016504
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2012 09:51:01 GMT
Message-ID: <50374DAF.8070500@cisco.com>
Date: Fri, 24 Aug 2012 11:47:27 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <mertsas@cisco.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.6esrpre) Gecko/20120730 Thunderbird/10.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAFpD06TQ1AXs+09BEpCqB26jPsDjw7mkEYkSmm6wO1QyP3-WTA@mail.gmail.com>
In-Reply-To: <CAFpD06TQ1AXs+09BEpCqB26jPsDjw7mkEYkSmm6wO1QyP3-WTA@mail.gmail.com>
Subject: Re: Hello
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
X-List-Received-Date: Fri, 24 Aug 2012 10:03:09 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi, and welcome.

The way we started was by looking at the angstrom distribution. That is
available as a oe-core layer, and you can easily start by compiling that
one.
After that, we started taking stuff from angstrom, into our own
repository. Starting with configurations, and changing them as we
wanted. And when we had our own, angstrom based, distro up and running,
we started adding what we needed. But start looking at angstrom, and
understand how oe works, at least that is my tip.

- Martin

On 08/24/12 11:14, Giuseppe Longo wrote:
> Hello everyone,
> i'm a new member of this list.
>
> Although i have no experience, i would like to learn howto create
> linux distro for embedded systems.
>
> I would like to ask some basic questions:
> - where do you start to create a linux distro?
> - i need an embedded device without any os or firmware?
>
> Thanks,
> Best regards.
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



