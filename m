Return-Path: <stunpix@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 4F27A6A9D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 12:33:29 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id h11so2540316wiw.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 14 Nov 2014 04:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=+85pn2Q7z51l0bWIMAJ80jxFddB917mTgFNWCiBvYts=;
	b=vOKbrcU3THVRIFDPqZujHecd0bfG0yIjux+WCqxm4gIYGl0t4B1qIL7pMt8mGdpc6O
	MuALSjQj3ihilboXFCQyn/4xDMogsxXYjjV8pxprUuP+Q+0OPadWIJ3JgCZJqtFnD6wm
	MQjrcqbnduRBDuMiyZ5Sk5dYGg66qqfNzQI3x/GFbW8xWH5SCFjvEKtieSDor09L/9cE
	N1olXwNYLf+Xv/wFiPCzCVDjrJkZRIWdTcyh8QSDB7RTPYnD0K6Ga1TTfW8RuRH8XNTh
	PGAZ9Cl9Z1ZS94ALDj6Cj1ztuVvr0FY1IEKVlYO7OLM2TQl0ItCNZX04xU9uW7KO/j9C
	DYVA==
MIME-Version: 1.0
X-Received: by 10.194.200.101 with SMTP id jr5mr13230659wjc.6.1415968391345;
	Fri, 14 Nov 2014 04:33:11 -0800 (PST)
Sender: stunpix@gmail.com
Received: by 10.27.90.21 with HTTP; Fri, 14 Nov 2014 04:33:11 -0800 (PST)
In-Reply-To: <20141114115613.GA2458@jama>
References: <3B9CABF3-66A1-4B2A-A01B-87ABFDCB797F@stunpix.com>
	<20141114115613.GA2458@jama>
Date: Fri, 14 Nov 2014 14:33:11 +0200
X-Google-Sender-Auth: 0HhclZkXZ1MNIY4Icfxu-OWMHNE
Message-ID: <CAE6DSAHsOZTHcK1JfKuHLuA5AiEsOVR1KfzUsMb8V+g9YQKaVw@mail.gmail.com>
From: Alexander Shashkevych <alex@stunpix.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: How to organize OE environment for intermediate builds
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 14 Nov 2014 12:33:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 14, 2014 at 1:56 PM, Martin Jansa <martin.jansa@gmail.com> wrote:

>> How do you escape this? How to best organize OE environment for intermediate builds without commits?
>>
>> PS: I hope you understand that endless commit'n'push of each little change for just-to-test is extremely superfluous.
>
> Check externalsrc.bbclass

That's what I'm looking for. Thank you!

Regards,
Alexander

