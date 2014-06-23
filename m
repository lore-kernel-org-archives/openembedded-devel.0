Return-Path: <cliff.brake@gmail.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 8764765F2A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 20:33:13 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so6057638qaq.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 23 Jun 2014 13:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=p6+VQQsqM2ThNKWcv+u6WisNGsO7Q6srBL2uur8tchk=;
	b=itanc+vFF7ksh81R6hZ5HB4iAOG7XWmkzB15ikI6e0iUYgbuClkItQeOG4Dw/81yVY
	fWiZIchp8f5rahgHSJu4VL2Mrz/bwqRVFNY9EeUnmrYviwXIbbZWNpRbcEG3WFE5BzmI
	a2NXBD1YBzrj8xN8g/uLx/GETAqA5cByTjeM69FZaCW5DLKwFq4ta0dFFxwKX/MwajF0
	LBxpn9erYkEA8xrP78bFDObYv6wYEm4Lf44D2AzoEhBw/YFFyRZjm7a2pV+wrvtlEtzz
	7123xNmCQWXtlQvO3tlymnaFwj/KrMINfd5BXPcewxgFeuGKs7MKtQ6YSPIDLOVX+9Ts
	sp3w==
MIME-Version: 1.0
X-Received: by 10.140.102.163 with SMTP id w32mr35629545qge.97.1403555593847; 
	Mon, 23 Jun 2014 13:33:13 -0700 (PDT)
Sender: cliff.brake@gmail.com
Received: by 10.140.17.44 with HTTP; Mon, 23 Jun 2014 13:33:13 -0700 (PDT)
In-Reply-To: <20140620160431.GY2117@jama>
References: <CAOd_LFwu0hwLcU1+oAvK9TVtsbbawDhRqd=1wafXfOKOWw5T+g@mail.gmail.com>
	<20140620160431.GY2117@jama>
Date: Mon, 23 Jun 2014 16:33:13 -0400
X-Google-Sender-Auth: vFE9WKTYTgzvZwCgagKQd3QyR8s
Message-ID: <CAOd_LFznwZYR68XeXKCcDoQyijih7TakvwnQreRSWPss460hZQ@mail.gmail.com>
From: Cliff Brake <cbrake@bec-systems.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][daisy] pull request, update README's, live555 fix
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
X-List-Received-Date: Mon, 23 Jun 2014 20:33:20 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jun 20, 2014 at 12:04 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jun 19, 2014 at 07:52:51AM -0400, Cliff Brake wrote:
>> The following changes since commit dca466c074c9a35bc0133e7e0d65cca0731e2acf:
>>
>>   python-efl: add dependency on python-dbus and lua to always build
>> edje and elementary bindings (2014-05-12 10:08:28 +0200)
>>
>> are available in the git repository at:
>>
>>   https://github.com/cbrake/meta-openembedded.git daisy-to-merge
>>
>> for you to fetch changes up to f3f1d14a6587d72388f50725b0a49c84cf417eb9:
>>
>>   live555: fix fetch problem (2014-06-18 13:42:35 -0400)
>
> BTW: there is daisy bundle on patchwork:
> http://patchwork.openembedded.org/bundle/jama/daisy/?archive=both
>
> When I notice some patch in queue marked as for daisy or requesting
> backport in text I move it to bundle (and mark it as archived)
>
> Would be great if one of you keeps an eye on this bundle and sort the
> patches there (they usually aren't marked as applied automatically and
> you need to do it manually).

I will try to watch this.

I was able to mark my merge request in this bundle as applied, but the
other two it does not seem like I can edit in patchwork.  (Still
figuring out patchwork flow ...)

Thanks,
Cliff

