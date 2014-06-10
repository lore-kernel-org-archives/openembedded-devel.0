Return-Path: <ashcharles@gmail.com>
Received: from mail-vc0-f179.google.com (mail-vc0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id D228D6BCB3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 17:20:51 +0000 (UTC)
Received: by mail-vc0-f179.google.com with SMTP id id10so6437405vcb.38
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Jun 2014 10:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vOWGSdW4jdWGjONsiov/dR+TLHbYCg0hkLFov7bKmC4=;
	b=jx1AYjDhDYKF9CCGZ7BIrvfpv99EfT79BrrF6czWsmE9c6oZR6me91Nb9hp2ZPLQoX
	jBe9PbUENMWuwqRPB+NEZxzeezt6HCuSQYyoPZixZbXKqB8qKXwshOxYjY3vxJQfrGEz
	DhR41fQgfHXgdczWGcbPLIXwoJTlyGcF1wozuNdhu9NWbDLI8oG4mg+ZzszCmItBT9gt
	5a5sc8vHQy0kLEd7p8LhOT2w8iWAGrikUsPlSNd0PuUAcm3XhyeRmp4X6YEkPLN79WtL
	JIB1TznBbzcVGNDf6aUX9Xqq6ZcNDh4tRzw9wMZXaf2BxbrjxxGU+QC/2KCil91p93qE
	UQ9w==
X-Received: by 10.58.229.101 with SMTP id sp5mr31759654vec.42.1402420853033;
	Tue, 10 Jun 2014 10:20:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.198.163 with HTTP; Tue, 10 Jun 2014 10:20:22 -0700 (PDT)
In-Reply-To: <20140610171143.GH2433@jama>
References: <20140610112139.GD2433@jama>
	<1402418201-4389-1-git-send-email-ashcharles@gmail.com>
	<CAK8F28nWie5hLac3mFiB739BRfw=MQQ8q=39rZoV3i39vuvvcw@mail.gmail.com>
	<20140610171143.GH2433@jama>
From: Ash Charles <ashcharles@gmail.com>
Date: Tue, 10 Jun 2014 10:20:22 -0700
Message-ID: <CAK8F28nAWnNTun5TJhm7shu-SB2AC69JB-sFtT3aBa3MYdC_HA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Patch v2] xfce4-screenshooter: Ensure lib directory exists.
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
X-List-Received-Date: Tue, 10 Jun 2014 17:20:57 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 10, 2014 at 10:11 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> No, being in master-next only means that it's being tested in my Jenkins
> builds, I'm rebasing master-next every time I push something to master,
> so I'll just replace original patch with v2 in master-next for next Jenkins
> build.
Okay---perfect.  That makes sense.
>
>> 2. would you rather a v2 on the original patch I sent to the list?
>
> Sending PATCHv2 with --in-reply-to as you did now, is the best for me, thanks
Great.

Thanks,
Ash

