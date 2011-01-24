Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PhQY8-0007lp-Nt
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Jan 2011 18:49:56 +0100
Received: by yie16 with SMTP id 16so1532219yie.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Jan 2011 09:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=fvWjaUh54eoLHSwgsy2z8Uke5ZLlPVHQ6yGQmAJyzS8=;
	b=k7E26fZ+SQ+akWa7Uo5ykJQO/DY9oitBAhGjZx5P/PRIOezKnXFE0HKEtO2PwIbC3a
	k29C2GfD+sfeg5qewnA8hhwibnVonZzVsY14+Dj5q4NLDEg+80IFdsKfTNPJ/pYvWBW+
	qbM4ZxqrrBAki6+kggkSSgGELIXZkeGDte054=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=XDpjV3h5fmFmfkmpqUs3p9yrM1yblaZoPYUmp7Fvf+8EPsQgnjp37BK4oNEUfb3izI
	N8lL4MXlJ2+aEF/xUXLmEri2gqyvbS8rb0wqaECe4G2RwZSGpLKPGs7nBTlQ5zMFoMrS
	5CN3zfN1PRHmlC9mPiHx0G0mAZfYcuteXAU9M=
Received: by 10.90.100.4 with SMTP id x4mr5357929agb.4.1295891350185; Mon, 24
	Jan 2011 09:49:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.45.13 with HTTP; Mon, 24 Jan 2011 09:48:47 -0800 (PST)
In-Reply-To: <4D3DAB2A.3070303@balister.org>
References: <4D36F9BE.1010601@xora.org.uk> <4D3DAB2A.3070303@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 24 Jan 2011 09:48:47 -0800
Message-ID: <AANLkTi=T++s65-mH91BBwT6OBUfzqcGDiq6J-LVk8+SJ@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Jan 2011 17:49:56 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 24, 2011 at 8:39 AM, Philip Balister <philip@balister.org> wrote:
> On 01/19/2011 06:48 AM, Graeme Gregory wrote:
>>
>> Hi, this email is sent as an ordinary member of OE.
>>
>> It seems to be on a technical level we are agreed that we should split
>> parts of OE out into the so called openembedded-core which will have a
>> stricter commit access and higher QA requirements on changes.
>>
>> I therefore think it is time to actually create the repository and let
>> the people who are interested in merging the good stuff from poky with
>> the good stuff from openembedded to create our "core". I don't think
>> there is any need to wait on the political part of the Yocto/OE
>> collaboration as its something we have agreed in principal to do anyway.
>>
>> I would request then that the TSC drive this forward with the server
>> admins and create this repo so work can happen.
>
>
> Has anything happened on this email? Has the TSC had a meeting to discuss? I
> know it has only been a week, but people are starting to do work based on
> these ideas and need some support from the TSC.
>

Yes I think we should start action on it soon. I would suggest to set
up the repository
as first step. As someone raised question about pull model it could be
TSC who decided
to appoint one gatekeeper based upon availability interest and
capability and it could be
rotated.secondly sane Starting point would be importing yocto and then
apply the OE improvements
on top thirdly breakdown oe into oe-meta repo to glue with the oe-core

> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


