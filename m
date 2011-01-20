Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Pfreq-0006Uz-FM
	for openembedded-devel@lists.openembedded.org;
	Thu, 20 Jan 2011 11:22:24 +0100
Received: by iyj18 with SMTP id 18so436178iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jan 2011 02:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=mCAqSdAdfHUebCDhKTMD+pvo7VxggPZm5ZwbTgQJxyI=;
	b=ke5EPNr62Ge6I/ZNGKlFBTrnncHvdXlxOrKv106g1nAii5uLy8zvWHq3hxwLrfeax0
	99dkNbHDxPs74SdQSClcZq9x+E/5y4VeRy8vOzMgiSgi5ZbWDHwUf/uCTfsE+fa8/t1K
	xlu1E1N1ay1Ac3e2RhFWrVG3FtyvY3FXd+qhI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fF3PQ7RGUAcN2xwAANYxANPU8VOUFwRTfg2JIcEHeetx8YcWyYsGP6+KVMIyDDkG+8
	YZsKzOQParTQHYPenWkU/Bc5faDAq28d6M3/rYh+k/S9hgjkdnokTL0OOXaamxCbqGXk
	vJpNkrw4oqBYG08V8j4e2oYYuZ8P2DweNq2ak=
MIME-Version: 1.0
Received: by 10.231.34.205 with SMTP id m13mr2236360ibd.184.1295518903157;
	Thu, 20 Jan 2011 02:21:43 -0800 (PST)
Received: by 10.231.213.234 with HTTP; Thu, 20 Jan 2011 02:21:43 -0800 (PST)
In-Reply-To: <AANLkTik3ysHryPYNcpObiyky4X98=9exDyKtJD_3yu+k@mail.gmail.com>
References: <4D36F9BE.1010601@xora.org.uk>
	<AANLkTi=sJGSCRxSF6tFPhrGb=NKfmiLNURg-n-Gmgc3Z@mail.gmail.com>
	<4D370A54.6020607@xora.org.uk>
	<AANLkTikUOPo2v+=qYF_afhSHxkyb1EK3HJC1_E4RRGub@mail.gmail.com>
	<AANLkTik3ysHryPYNcpObiyky4X98=9exDyKtJD_3yu+k@mail.gmail.com>
Date: Thu, 20 Jan 2011 11:21:43 +0100
Message-ID: <AANLkTikP0b5DUmNCpc0ST8pgW=B-VPhmX36NJvkm5iPO@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: openembedded-core git repository
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
X-List-Received-Date: Thu, 20 Jan 2011 10:22:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/1/19 Graham Gower <graham.gower@gmail.com>:
> On 20 January 2011 05:22, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2011/1/19 Graeme Gregory <dp@xora.org.uk>:
>>> Core should probably have a build bot which crunches a standard set of
>>> tests on each commit so unlike OE currently people don't wake up to bad
>>> day of debugging OE.
>>
>> I'm not sure if that is needed (at least not on for every commit).
>
> Doing this for every commit may be good from the point of view of
> keeping git-bisect useful.

Good point. Didn't think of that!

Frans


