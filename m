Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-vc0-f170.google.com (mail-vc0-f170.google.com
	[209.85.220.170])
	by mail.openembedded.org (Postfix) with ESMTP id 5661C6B5AD
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  1 Apr 2014 11:51:21 +0000 (UTC)
Received: by mail-vc0-f170.google.com with SMTP id hu19so9653722vcb.15
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Apr 2014 04:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Q7T4XS3ZJ+gyI08Sf1vungJM5QbE3ucOmGoD6w8WKBE=;
	b=E2RPf7u1nFLUJBW3V4o7++wj6y7w3nC9S75Lw6kaS08Kt8arR6/DB/AWPUKbxW5MKq
	Qpm3hyqpAUU82snptUHu+vkEek9QR+GSAYGxQ5JU+IriuNcmMJFrmaXPiQ9wgBg/Sa+M
	1JG9M5k7Ugu2P6gyxfj49CvUNj4T5HoCL9uk+2wvomUMo24AAcseas6xN4s/LzF2CRcK
	b0mVZhntLqo5Gn0UZKK51Vb6cC81cY/Q3T17ZK3829pGKl27ZTbv47zIlb5bUmL3JEoh
	XwauCm7i1eAaHM0w8rFCTCrA71b1mm4zGWmKGxe7k3jCLfuDRg2d8WSiEtFm5zlDVM/I
	DBkQ==
MIME-Version: 1.0
X-Received: by 10.52.33.176 with SMTP id s16mr64287vdi.49.1396353082706; Tue,
	01 Apr 2014 04:51:22 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Tue, 1 Apr 2014 04:51:22 -0700 (PDT)
In-Reply-To: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
References: <1396323568-18135-1-git-send-email-trevor.woerner@linaro.org>
Date: Tue, 1 Apr 2014 13:51:22 +0200
Message-ID: <CALbNGRQKaXtHAgiHwTBVxYEPywWBdxD+DG1e-siuVeXHGu6TDA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: patches@linaro.org
Subject: Re: [meta-oe][PATCH 0/4] 'gtkmathview' fix for SOBBW (2014-03-29)
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
X-List-Received-Date: Tue, 01 Apr 2014 11:51:27 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 1, 2014 at 5:39 AM, Trevor Woerner
<trevor.woerner@linaro.org> wrote:
> Hi Martin,
>
> Here is a fix for your "State of bitbake world, Failed tasks 2014-03-29". This
> patch set provides fixes and some clean-up for the gtkmathview package.
>
> Best regards,
>     Trevor
>
> Trevor Woerner (4):
>   gtkmathview: fix B!=S
>   gtkmathview: fix qa issue
>   gtkmathview: fix build error
>   gtkmathview: run through oe-stylize.py
>
>  .../mml-widget/gtkmathview/qualify-lookup.diff              | 13 +++++++++++++
>  meta-oe/recipes-extended/mml-widget/gtkmathview_0.8.0.bb    |  9 +++------
>  2 files changed, 16 insertions(+), 6 deletions(-)
>  create mode 100644 meta-oe/recipes-extended/mml-widget/gtkmathview/qualify-lookup.diff
>
> --
> 1.9.0
>
> --
Tested 1-3 - thanks

Andreas

