Return-Path: <chmorgan@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6B9776FE25
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 20:44:19 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id tp5so2287531ieb.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 13:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=eCPwZsd3GdhPk6ZmtdISwdc2Gbtmry67zU+oaolSKxY=;
	b=VqJyGYCkbpkGELY/RTSMwIZT7eNZvyAHzphnEI7is5mJF4PFN9BSOi6Vi+OunpxokZ
	dzQvL8re6IxBcvUwiJjCdKxXc3kLROFrTHQehTktErj/IUaSeRNzFO8sc7CVRpT5I703
	Ell5/eM+cGQglSEmiHISHy38LG6y17VUzuf8pmrW0gQoxwHw0Pc/AiamdB1mi3RiUZEd
	Vp0X2gED8p4BZh18xNJ0ytnLL2jI3pj2gKRKap7y7eAmxiMZmkljB3OlgNQscZsMJkTW
	0St6KIJIwBEhmnUUP1QtPsOxL01cSXN7HQ3XOQ4JAAqv67lLwrG7UoocX/RTTPQTRSrf
	QBeg==
X-Received: by 10.42.91.73 with SMTP id o9mr18184632icm.69.1401482660041; Fri,
	30 May 2014 13:44:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.64.228.141 with HTTP; Fri, 30 May 2014 13:44:00 -0700 (PDT)
In-Reply-To: <5388EB65.5000305@mlbassoc.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
From: Chris Morgan <chmorgan@gmail.com>
Date: Fri, 30 May 2014 16:44:00 -0400
Message-ID: <CAAPegz09QsB8utLQyStZgVyb7ZttbcvNbfMqMDJvLzjar9Hkwg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 0/2] dfu-util cleanup
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
X-List-Received-Date: Fri, 30 May 2014 20:44:26 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 4:34 PM, Gary Thomas <gary@mlbassoc.com> wrote:
> On 2014-05-30 14:29, Otavio Salvador wrote:
>>
>> On Fri, May 30, 2014 at 2:14 PM, Chris Morgan <chmorgan@gmail.com> wrote:
>>>
>>> Add a recipe for building 0.7, remove old 0.1 recipe.
>>
>>
>> I'd prefer this in a single commit.
>>
>
> I think he did it this way because of the [slightly confusing]
> version 0.4 that is still left in place.
>
> --
> ------------------------------------------------------------
> Gary Thomas                 |  Consulting for the
> MLB Associates              |    Embedded world
> ------------------------------------------------------------
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


Correct.

I'm not introducing 0.7 to replace 0.1, I'm introducing 0.7 so I'm at
the same rev as my Fedora box. Just happened to notice that 0.1, which
is super old, was still present so thought we might remove that.

Chris

