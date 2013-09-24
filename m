Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f173.google.com (mail-ve0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 90B89610FB
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 13:51:58 +0000 (UTC)
Received: by mail-ve0-f173.google.com with SMTP id cz12so3446785veb.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 24 Sep 2013 06:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=rLz+m24cd1Ddif9s/1yzUPRwx87xn+37zU3xej7IQdU=;
	b=BGqxTQd48yGCW2x0EPamp+6wfYJ0rgPGqA7PQhr84clacsQkUP26G2HY8Fjstav1XP
	BHADxwQf835Kafm+3vzPcda9l9ZhmGc44JMn03t+a/S5LGFm8lhaifClU0UpAfWRTq17
	sIw2mpwWq6CMauK/qcQleMHg8JwIEWwGDutUTuo1F/RZLsoYy4GIlUq0bv2BDd30tIZv
	PPSdr6voT1M98KVpvqiYeZlfujgD/RgRnJmgcCdynM8SrtyUiWebPBKjcCvv63/mT4xJ
	mPwzN5qX1ddNbXk6CML5/2X3OmJUs1PGMFWugJJp19LBDuLObM6wuqmsN4i9zq4/3ZEE
	ct1g==
X-Gm-Message-State: ALoCoQk8dpnGG56LW4fmj3bTIDhkdO9MrTq/8FcZplqEhdNU4AR404hU9eq9YRZKH9ka6OZaVKRR
X-Received: by 10.58.169.193 with SMTP id ag1mr6071517vec.26.1380030719907;
	Tue, 24 Sep 2013 06:51:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 24 Sep 2013 06:51:39 -0700 (PDT)
In-Reply-To: <20130919121131.GE18414@jama>
References: <1378999913-22567-1-git-send-email-ross.burton@intel.com>
	<20130919121131.GE18414@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 24 Sep 2013 14:51:39 +0100
Message-ID: <CAJTo0LbtppQegr=Z6M1Ewmd2b7rC5-LSdc6UDFf5Cdxz86=0DA@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH] dleyna: switch to git clones instead of generated tarballs
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
X-List-Received-Date: Tue, 24 Sep 2013 13:51:59 -0000
Content-Type: text/plain; charset=UTF-8

On 19 September 2013 13:11, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Sep 12, 2013 at 04:31:53PM +0100, Ross Burton wrote:
>> The tarballs used were the dynamically-generated tarballs from github, which
>> recently have changed checksum.  Avoid this problem entirely by fetching from
>> git, locked to the relevant tag.
>
> Merged, thanks!

Did you actually push that merge?  I don't see it merged here.

Ross

