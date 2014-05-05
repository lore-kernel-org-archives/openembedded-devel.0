Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by mail.openembedded.org (Postfix) with ESMTP id 2242960650
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  5 May 2014 08:46:21 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id i7so2016153oag.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 05 May 2014 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=ziCwCh258h2lTabsZr0/ThFgiTOengTD0pJkshTUGT4=;
	b=iCTEidAvEiLK2p4HFxP5egWjaGa3UOIMa2jlGXFCMBQy8RS6gwO76V2k2CxNmegm9l
	KIHwc+swG+GC7Dz6dA67I0VldKMG3fyiVTjY5EX5xGt26R6uuvmykJxNLpceqh18J5zQ
	7ToaxfAEu3tEsw8UOXqKBbpy5tdC1iFZee35caPdyjOJNODID7g90mRUvkvX0rRVj3VG
	pkk7iZRS/fzbGhnjtf4xGiEFnyC6ljOe3DMWK8rlYKAeyEl5J/uzwFVZn1RbQbRr/k5p
	zv2UgfL8x2cqhXSX1ruepsiFMYce+kJZ9XYM58yrv/tsNaw2vsiFxiezU1Eqn7V6INj9
	OWtQ==
X-Received: by 10.182.225.163 with SMTP id rl3mr395751obc.79.1399279582440;
	Mon, 05 May 2014 01:46:22 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.12.73 with HTTP; Mon, 5 May 2014 01:46:02 -0700 (PDT)
In-Reply-To: <5364B398.5000802@embed.me.uk>
References: <5364B398.5000802@embed.me.uk>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Mon, 5 May 2014 10:46:02 +0200
Message-ID: <CAGiJk9dtWLypbYXsAANn01x5kmmX2=HXGoX7+G66jGp4eaLKxg@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: Website Text
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
X-List-Received-Date: Mon, 05 May 2014 08:46:23 -0000
Content-Type: text/plain; charset=UTF-8

2014-05-03 11:15 GMT+02:00 Jack Mitchell <martin.jansa@gmail.com>:

> * Support/Advantages/Available Recipes
>
>         - General input; can you think of any better subheadings or things
> we should be advertising?

Hi,

KDE desktop is not really "supported", it is at a stale tech preview stage.
Since my priorities have been shifted, there is no time to look into a
KDE Frameworks 5 port.
(Patches are welcome, but it may be easier to just fork the layer).


-- 
Regards
Samuel

