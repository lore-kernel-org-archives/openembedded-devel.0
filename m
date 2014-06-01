Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 041566FB5A
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  1 Jun 2014 02:39:45 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id rl12so3189794iec.21
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 31 May 2014 19:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2RmaJfGVV367Ug6PrbIK0gYJgKMxV0YKtDYsLiVPqG8=;
	b=lGM7mSLOUf/BkmxTGqvlPFiIbcXIaZJmM9ZBq74WfW+HCqwli+47erAmmimbc2ZVRh
	ZcqOYgrLCjnRjodwROU3FXQzHzfuiInBfIVvmNbe8SgxKPa0b/XfZFmnQqi8XDeYUbhk
	P43q+CTpPEkhFUDBYh7YkBVba451m91RIcmp+UsgPc+T3A5iCSTPe0Z4JPge9WaWRBGv
	uJWvko41orO/XFUJXoOxXOeB4e3A0ekRj6ajT6J7OB+WrFq47Qi8XZuLN0uInSt8ZQmE
	d6VtXRSbu8lEP1D1JJxOFTZ0SaTerNf8Ave1xebbErmUz8Qzil14L20n4yShhEPifw1F
	qwOw==
MIME-Version: 1.0
X-Received: by 10.42.68.18 with SMTP id v18mr25338904ici.1.1401590386160; Sat,
	31 May 2014 19:39:46 -0700 (PDT)
Received: by 10.50.117.33 with HTTP; Sat, 31 May 2014 19:39:45 -0700 (PDT)
Received: by 10.50.117.33 with HTTP; Sat, 31 May 2014 19:39:45 -0700 (PDT)
In-Reply-To: <5388EB65.5000305@mlbassoc.com>
References: <CAAPegz1HGg34=2kp7DUj8hOR3dmc1QtVe+hFvQPVoNhz5ptTeg@mail.gmail.com>
	<CAP9ODKppar=6rRFF0Vb+TQL3e+XZgirCfdMWXSN7cviQVBAFSg@mail.gmail.com>
	<5388EB65.5000305@mlbassoc.com>
Date: Sat, 31 May 2014 19:39:45 -0700
Message-ID: <CAMKF1sq00_iLbSEhsYbGh39VZbJQ7hdHoDN=hcQj7EYGUjTDhQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Sun, 01 Jun 2014 02:39:48 -0000
Content-Type: text/plain; charset=UTF-8

On May 30, 2014 1:34 PM, "Gary Thomas" <gary@mlbassoc.com> wrote:
>
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

is there a reason to keep 0.4 usually its better to maintain one recipe
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

