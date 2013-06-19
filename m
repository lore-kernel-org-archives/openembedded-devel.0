Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 0367660130
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 11:40:45 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so3625124vbh.15
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jun 2013 04:40:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=f/kTYhfuELm5hwUobHAIEjuCAa4/QTHI9VQ8UGtGuSw=;
	b=KxXckhpzgiGUHswyTQ5S1biOjeVsrOCctSLP5hPrN6J441dqmoTyum82QZ8rej5OIl
	LzudvxESVq7slYn0MItrGc4F+Cky6Wms/aZaud+KLYQJ78uY/qceEozXpm1e6CVAPJ+e
	1cVeZV9aMLxsy8pXJarcq/J/4YosR3qsxTI6VLCMHtZrtQCsBjrwXbIkcGbg6fxu5EMi
	tIrS/1kWrtTY3qB3B2Ik12/qxet/Rsim1FCxNKjTnkKRIHzIxPEctH4/2WvVRip+c+qP
	KXzsrDnNWakqJ20giJO6a03byE7yz1z+Or9N+304Haa3KMHiMFzOUbIWNx5UUl3JB2FE
	2NHw==
X-Received: by 10.52.29.179 with SMTP id l19mr692256vdh.51.1371642046600; Wed,
	19 Jun 2013 04:40:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Wed, 19 Jun 2013 04:40:26 -0700 (PDT)
In-Reply-To: <1721274.vjFAy2UInG@helios>
References: <1721274.vjFAy2UInG@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 19 Jun 2013 12:40:26 +0100
Message-ID: <CAJTo0LY4nFf_K6BSwp4acRQYubKgPUGHCQN5am=CeZ1YLHVMTw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQkUZBk5zW2mJGdWcRv7PSIQEvciV2huJ68kEA4UttqSEbKu/YWRZSoHxv3NJEKSdsZPwrNT
Subject: Re: Patchwork access
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
X-List-Received-Date: Wed, 19 Jun 2013 11:40:46 -0000
Content-Type: text/plain; charset=UTF-8

On 19 June 2013 10:09, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> A few people have been asking for access to patchwork recently, and it seems
> like it isn't possible to create an account at the moment. Can we come up with
> a plan to solve this?

It's also sad that the oe-core patchwork isn't really usable as it's
not detecting patches that have been merged.  Who's the right person
to investigate this?

Ross

