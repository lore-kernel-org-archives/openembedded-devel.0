Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
	[209.85.210.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6DFB460089
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 18:59:53 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id j16so7072725otl.1
	for <Openembedded-devel@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=ATLBVZjQ0GKcSc9fHlTjYbhawWCKHgXS0NTjtCYAILg=;
	b=J1ESmFqfu1rB/vM9KNJlgM0kyoBO5xymEsuODXg2rBiOVRWXfwjssl9vu8qypzi5+4
	wNpgdLRDdqwiEfWzsUfuYjPLBw0VEillDq8mspDHz5FM236I6BGaj+tLY855c8LWGjlP
	ak4OZUtV7btofUgLZOzOVTt2zREkLJJU6c3Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=ATLBVZjQ0GKcSc9fHlTjYbhawWCKHgXS0NTjtCYAILg=;
	b=BXZAWhYWK9tqOPvKRJObiiV93dbakG/DeFkOb4IFmWvi9pv1zi2wrTP80D5jn+ao1t
	qPBdAxAVe/4ozIO0WSH8bb2a5KcwNCSUX8TOyH+KLvAa98yEaSgfjRiWqQUXE6lq08Ik
	uxzKG7RxeR1JCJfFcro30wHdT4+bbA9NDYuS6MJdq2UvGP2rkmIEvmzeC5KxZx/DWT7a
	Hg6Pk+oXo2KxXjhgqe+auLiUw1CXJc9l7Yf5AZ3Q1HUwUctkTc9/SoNq7eKopvyrbyRd
	Z5zkxAgXPSiTkX+4fxkho5Hj3+2ybXy+ZW5V2pwgr9caES7c+kZlEVSEc5P1Pb0mhX47
	VW6A==
X-Gm-Message-State: ANhLgQ2XsKZ3wRYCH0z/wbCC09ZZvbZmJ6gNlmt/a9IfYZ7K5rK87a3I
	+w0dfcGDZGaFc8zqR5tvF8aW6NtcIoc5J7H73zj4zJIkwVKsNg==
X-Google-Smtp-Source: ADFU+vtEd5Rz+zKdA1a1ya+Px26LKMKdyZTjjUAxkTSWBoE2ktGHiEcqndGXTvp66Hc8Q/1t9GBWddpN5NXEKjqfShU=
X-Received: by 2002:a9d:12b4:: with SMTP id g49mr8453384otg.50.1584730793953; 
	Fri, 20 Mar 2020 11:59:53 -0700 (PDT)
MIME-Version: 1.0
References: <CADfgfobNNXr9HSOiwyamzbZ4q1uc8wgD5PzobDF56cDyYui-HQ@mail.gmail.com>
	<CADfgfoYCjVip=oc_U0TdFzOVst5U-KU+R31JhdckRv77APzQ-g@mail.gmail.com>
In-Reply-To: <CADfgfoYCjVip=oc_U0TdFzOVst5U-KU+R31JhdckRv77APzQ-g@mail.gmail.com>
From: Michael Halstead <mhalstead@linuxfoundation.org>
Date: Fri, 20 Mar 2020 11:59:42 -0700
Message-ID: <CADfgfob4=Zeh=jn9b9uMqq6Wnt83oGmJ-8yf1wSXYEFTppv2Bg@mail.gmail.com>
To: bitbake-devel@lists.openembedded.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>, 
	openembedded-architecture@lists.openembedded.org, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Mailing list platform change March 20th
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
X-List-Received-Date: Fri, 20 Mar 2020 18:59:53 -0000
Content-Type: text/plain; charset="UTF-8"

The migration will begin shortly. List mail will be delayed until the
process is complete. E-mail sent during downtime should eventually be
delivered. However waiting to send until after the switch is recommended.

Thank you,
--
Michael Halstead
Linux Foundation / Yocto Project
Systems Operations Engineer

On Thu, Mar 19, 2020 at 9:44 AM Michael Halstead <
mhalstead@linuxfoundation.org> wrote:

> Everything is proceeding smoothly and this work will continue as planned.
> The migration starts at noon PDT tomorrow.
>
> List owners please take care of all outstanding moderation in the next 24
> hours to ensure a smooth transition.
>
> Thank you,
> --
> Michael Halstead
> Linux Foundation / Yocto Project
> Systems Operations Engineer
>
> On Fri, Mar 13, 2020 at 4:58 PM Michael Halstead <
> mhalstead@linuxfoundation.org> wrote:
>
>> We are moving our lists from Mailman to Groups.io. E-mail to lists will
>> be delayed during the move window. We are aiming to complete the migration
>> during business hours in the Pacific time zone.
>>
>> A new account will be created for you on the Groups.io platform if you
>> don't already have one.
>>
>> You can read more about the change on the wiki:
>> https://www.openembedded.org/wiki/GroupsMigration
>>
>> If there are serious issues we will rollback the changes. We will e-mail
>> all lists when work is complete.
>>
>> --
>> Michael Halstead
>> Linux Foundation / Yocto Project
>> Systems Operations Engineer
>>
>>

