Return-Path: <asselsm@gmail.com>
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by mail.openembedded.org (Postfix) with ESMTP id B6A0278416
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  5 Jun 2018 15:51:57 +0000 (UTC)
Received: by mail-yw0-f193.google.com with SMTP id u124-v6so887243ywg.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Jun 2018 08:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tWDgNFFZeTjU/5yBVgPq89jbOmnwQeWfchD8lLMBm+s=;
	b=JuGeWt4kRPOlG7bi7eqRvRHrkSPpNCRF4KpEouGOEIFrpOQEPyHaYkVup+TieUR3Tq
	YPQ25Km9TrTVaoW5Rh+xEZ0230MD5CCZN5MO9h5XPskGvTDva2v2q7GdPXm835ro5l36
	hh1hgFA7K7QHmSdyvWG5GpRYMpSg8izspaE8LR11eLiiiG+WdGDLEuKytTXVnoQYYn7N
	VWulXRS4X0i4mFSa4iZEF5hednghX8DJU1rWnjmhcyARzsvPIa5JEnPyAeS5RfDklMya
	hW4OeGDm1gOEvDlHq/W7gohtd/ahTZ4fKMo9JEoP8CIXTOkI7XUx6Zw1471VEr/tvDvi
	mOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=tWDgNFFZeTjU/5yBVgPq89jbOmnwQeWfchD8lLMBm+s=;
	b=cGApujbmcEuPbhf7NHEOYyV1pxyQnTtF7Kb4p7w2Rn+pTbo6NqK5yYc+nQDh5ii160
	erTGJnwT83SOiySmILGXR0X93Ac86HlcCmsoyaH4TqmOoNOFv4qnR6xIQlqYHX+4eNr+
	AMvtYHr1x3idDDycbLd9TwsC1Kde8BSRxZRD34A7Qy0g2s0gAswwVFtnEUF/QnXVKFFB
	4OKjjVsSx9EWgn9fOY3pz3su+lvlr9PmyCRuRynax7YjtY8JCOh6wuyFOdAMcgknkeHx
	L/OEK00Tp5MT/Uen3AFGCxW2vqdZJDlV5XeWz/U0XSOZjByJ6gVCKNizvgtw1yCIVT7k
	g7jg==
X-Gm-Message-State: ALKqPweK2jMS2jE+Y1bKmUsM4lNe8nqBMo07sl6Mj/th4nfoBidgH+f5
	EBgva7fVRkWx9gC5PbvGEC+OVdYcf1kuFhU0V6Q=
X-Google-Smtp-Source: ADUXVKI0yOU0QqBLrWZczTQr03agLdsN5m5FsMn5BIXkDrCurZHi1CQ8+LLxPAfAANrGh7K/MCPFD9wshpKIJs7A/ao=
X-Received: by 2002:a81:6b41:: with SMTP id
	g62-v6mr13068101ywc.445.1528213918530; 
	Tue, 05 Jun 2018 08:51:58 -0700 (PDT)
MIME-Version: 1.0
Reply-To: mark.asselstine@windriver.com
Sender: asselsm@gmail.com
Received: by 2002:a25:3dc7:0:0:0:0:0 with HTTP;
	Tue, 5 Jun 2018 08:51:57 -0700 (PDT)
In-Reply-To: <CAPuovE+waNG3XcJshTPBiyRDyLN54vbiVf--_hAaKbMVOsqnOA@mail.gmail.com>
References: <10630413.xVAl2E7OaH@yow-masselst-lx1>
	<CAPuovE+waNG3XcJshTPBiyRDyLN54vbiVf--_hAaKbMVOsqnOA@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 5 Jun 2018 11:51:57 -0400
X-Google-Sender-Auth: wRquhZV3fPRf5LzucaNH6v3_dd8
Message-ID: <CAPuovELJj9ztBhTtTDNr1-jycGhyNp2ddJnmK=3S1jH_g0K9ew@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>,
	Maxin John <maxin.john@intel.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, mario.goulart@bmw-carit.de
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java] maintainer status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Jun 2018 15:51:58 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 5, 2018 at 11:18 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Tue, Jun 5, 2018 at 11:11 AM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>> Several of us have noticed that nothing has been merged to meta-java since
>> mid-April (roughly 8 weeks ago). With about a dozen commits sent to the list
>> and pending merges I thought I might email you, the maintainers, directly to
>> determine if this is expected to continue. Should we be looking to update the
>> maintainers list and/or recruiting new people to restore the vitality of this
>> repo? Have your roles or positions changed making it no longer viable for you
>> to contribute to this repo?
>>
>> Thanks in advance for your responses.
>
> I got this back upon sending this out:
>        ----- The following addresses had permanent fatal errors -----
>     <mario@ossystems.com.br>
>         (reason: 550-5.1.1 The email account that you tried to reach
> does not exist. Please try)
>
> So dropping him from the list and guessing that means we are down at
> least one maintainer.

Adding what I believe is Mario's new address to the TO list.

Mark

>
> Mark
>
>>
>> Mark
>>
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

