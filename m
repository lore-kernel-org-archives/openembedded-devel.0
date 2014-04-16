Return-Path: <s.stirtzel@googlemail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id E54F965D1E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 07:00:30 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id wn1so4419265obc.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Apr 2014 00:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=9RC+cg6zwg1ia36HwHknTefGyfzfwjC1aBimtlFVG+U=;
	b=owBxJz2GXDvLijkvjZqai+JsEPY+iHO2eARifV9wPzZTRdkL9oDFgUGi7oqPoIB5/7
	sjQYHWmIvc06wlU0U9cZ+cMUl2NMczzBByLk6UptmC4Am7OdY7WCyvfthkCpdwyD3nk1
	avnoD5G2UkKwvzRZC+VJcloLm1EFNbdROolw67MrKRFGcc2AfSr+eemMePkuj6bIu/Y8
	51kXCx0WV4Pb19uIMKVlYOoOfb1rkOShXBhpwI6jFyLmqzYE+jGIFt+uF24+ehguMrcz
	eeXXpmNx81O6JRQ2HGlna/eCkbg/NTV2xZ18FtghcieiFeCA582E5KjVn59/ZWoBhg4p
	UlIA==
X-Received: by 10.182.126.137 with SMTP id my9mr392128obb.61.1397631631065;
	Wed, 16 Apr 2014 00:00:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.12.73 with HTTP; Wed, 16 Apr 2014 00:00:11 -0700 (PDT)
In-Reply-To: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
References: <CALYKT1hsAOf+qKTPO_fNpBf1u0CJoXm0L2Nz6VCafbqckYY2oA@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
Date: Wed, 16 Apr 2014 09:00:11 +0200
Message-ID: <CAGiJk9es1=1vxeLrtnNtSD4sfcDi9PEYwizk2SWrqUH_h4XGFw@mail.gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: What is the relationship between Open Embedded for MSM and Yocto Project?
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
X-List-Received-Date: Wed, 16 Apr 2014 07:00:37 -0000
Content-Type: text/plain; charset=UTF-8

2014-04-16 8:49 GMT+02:00 Journeyer J. Joh <oosaprogrammer@gmail.com>:
> Hello,
>
> First of all I thank Nicolas Dechesne and Brian Hutchinson, for the
> previous kind replies.
>
> While I was reading documents from Yocto Project, I found my source code in
> use in my company is of Open Embedded for MSM.
>
> I found this from the git remote url of my surce code. It is
>   git://codeaurora.org/quic/le/openembedded/openembedded-core
>
> And the one of Yocto project is
>   git://git.yoctoproject.org/poky
>
> From the git log prints poky is actively developped now but
> openembedded-core is not.
>
> In a nutshell(I learned this expression today^^),
> - What is the relationship between those two? Any differences? Commons?
> - Can I refer to the documents about poky for my openembedded-core?
>

Hi,

the relationship between OpenEmbedded and Yocto Project is summed at
http://en.wikipedia.org/wiki/Yocto_Project

You may want to use the up to date layer list (with links to the
official git repositories) here:
http://layers.openembedded.org/layerindex/branch/master/layers/


-- 
Regards
Samuel

