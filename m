Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f176.google.com (mail-ie0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id AA61262252
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 19:07:09 +0000 (UTC)
Received: by mail-ie0-f176.google.com with SMTP id tr6so10321002ieb.21
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Aug 2014 12:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=UlVen1lJsOb1V8s9GGuWYbYVIEg/gK4kHFsCFd39DQ4=;
	b=xupU+TH9nRgj6vZOBxazReeMqlQ6yMnvVb31hLqDkYNhMdg76aBq3jEO9kAQVkxy/N
	HgtL4OM3bZ2g0Ii3wXV4TUQKhPrVYqrTeRTrFJgNDyRum8ccg1TybErvf8bb/wwGI8y4
	44I4S2d43dsowdYWeFRx65z3hP3zX9jgf1bRi9N8h9kge+j4sCSY1cqv3o6B3u3guiQf
	gZmNHP1mg5PetyOZr9HhX5rLO1ir4rL/jdI9ASg47LBhuNGsP8DerBiz9xQ5uDKBokfF
	S3FUwuKbw+qS9fYaoXRL99P3Y8rZEOLXyRf7Pyq3o+D3HWb5wWYTZTJmtb8skOz4sFF2
	AvfA==
X-Received: by 10.50.111.112 with SMTP id ih16mr17333966igb.30.1408993629764; 
	Mon, 25 Aug 2014 12:07:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.102.67 with HTTP; Mon, 25 Aug 2014 12:06:39 -0700 (PDT)
In-Reply-To: <CABcZAN=OaZWwXTa4_pm5E3=MYN5_UM5fbr4=yMjjXkVnJrR8Eg@mail.gmail.com>
References: <1408991911-47249-1-git-send-email-yasir_khan@mentor.com>
	<20140825185443.GA23339@haswell>
	<CABcZAN=OaZWwXTa4_pm5E3=MYN5_UM5fbr4=yMjjXkVnJrR8Eg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 25 Aug 2014 12:06:39 -0700
Message-ID: <CAMKF1spqSGLqU4CJd6a=U6kXZU+SrfFs4-4SnU86Xn5c1yojqQ@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] lmbench: add lmbench-exception LICENSE
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
X-List-Received-Date: Mon, 25 Aug 2014 19:07:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 25, 2014 at 11:53 AM, Christopher Larson
<chris_larson@mentor.com> wrote:
> On Mon, Aug 25, 2014 at 11:54 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On 14-08-25 23:38:31, Yasir-Khan wrote:
>> > Signed-off-by: Christopher Larson <chris_larson@mentor.com>
>> > Signed-off-by: Yasir-Khan <yasir_khan@mentor.com>
>> > ---
>> >  meta-oe/licenses/GPL-2.0-with-lmbench-restriction  |  108
>> ++++++++++++++++++++
>>
>> Is there some SPDX compliant naming convention for this
>
>
>
> Afaik this is already the convention, see e.g. GPL-2.0-with-bison-exception
> on https://spdx.org/licenses/. Of course, this specific exception isn't in
> the SPDX license list, but it follows suit.
>

yeah, I was more interested if this is an accepted license there but
it seems to be not yet so may be also file it there ?

http://spdx.org/spdx-license-list/request-new-license

> -Chris
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

