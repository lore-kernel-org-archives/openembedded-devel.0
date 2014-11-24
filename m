Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 0C99B70A61
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 10:39:28 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id dc16so6230440qab.11
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Nov 2014 02:39:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=xEkPsYYslbPyaiqH0jodzCq/IytqDEEZ7UQO/1v8A6k=;
	b=BR16mfUz/QZwarDUsx+sK9ZGTz0kZ3LqGVH2419tRBW/UQmqcCgnmvfLYLRJQndIrn
	nwOLs9GpAqTPAsthu1JplpEOy3nXJzgo/1P4AVspNBby+xDURe2n9aEvErvo/THDgBoZ
	gOFxVTyXjpraz5fjgo4sE578/eb5L0C+2s3GP8uXAZEyytHt+gHF9Y8CerHp025JF0TR
	pB4o9bLLwQmve2Btd2x3CU4SIESHV7E0ws7KR9QnGXzwQGc2du3t7AXpw/vL3d+XNVwD
	R4a+q637iBEoHMwDEY6uM37nzg9py4XSHTmuvI5HgcOh4O/ZlKbh9wXnDz2wYut07sze
	mv5A==
X-Gm-Message-State: ALoCoQkGU+MeTtiCZz9UYr3gfJUxlX9cqTG86i5yazej/6Bi78j4hvXvOUBLetk2j1ks7zdB9Owl
X-Received: by 10.140.94.233 with SMTP id g96mr27703365qge.77.1416825568888;
	Mon, 24 Nov 2014 02:39:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Mon, 24 Nov 2014 02:39:08 -0800 (PST)
In-Reply-To: <1416811526-54855-3-git-send-email-biannm@cn.fujitsu.com>
References: <1416811526-54855-1-git-send-email-biannm@cn.fujitsu.com>
	<1416811526-54855-3-git-send-email-biannm@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Nov 2014 10:39:08 +0000
Message-ID: <CAJTo0LaWJfvjnZ9_6dMuXC_Vqs-YzxWXxnuz3etnTvR2OMJ0Mg@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [PATCH 2/6] [meta-oe] fontcacheproto: Port fontcacheproto from openembedded.
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
X-List-Received-Date: Mon, 24 Nov 2014 10:39:35 -0000
Content-Type: text/plain; charset=UTF-8

On 24 November 2014 at 06:45, Bian Naimeng <biannm@cn.fujitsu.com> wrote:

>  .../recipes-graphics/xorg-proto/fontcacheproto_0.1.3.bb  | 16
> ++++++++++++++++
>

Just to continue the theme:

commit 3f516bbcc57e1f12cde55ff9049202efa2e27f60
Author: Ross Burton <ross.burton@intel.com>
Date:   Wed Oct 10 13:51:16 2012 +0100

    xorg: remove fontcache support

    This was removed from the Xorg server in 2008.

    (From OE-Core rev: 02fc0a197ca16e983becb0aedeb9238a0aeb6661)

Ross

