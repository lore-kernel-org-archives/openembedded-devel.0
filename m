Return-Path: <ashcharles@gmail.com>
Received: from mail-ve0-f171.google.com (mail-ve0-f171.google.com
	[209.85.128.171])
	by mail.openembedded.org (Postfix) with ESMTP id D8B4E601A2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 20:13:10 +0000 (UTC)
Received: by mail-ve0-f171.google.com with SMTP id jz11so4319338veb.30
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 26 Jun 2014 13:13:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=B+/9TfYXUBmwHFZqNkXHVzw9/ofrCZaP+l/C3I00/B8=;
	b=TVgAC1njvvt7oiZftLebzeq4m6SK6A5PIxHfUV0Gvcspmrb1ttV2Mw5uuaZG0CuA2P
	Y4UsQnS66mOsiBHGic3hTTwvVkQIPa+VwIbvZmXrKs0P9IRbuoN+k6BEJ8Riuq4/H9Rq
	MA59E2jpFW0SM0lAoAOew4rJLCqZbk5u4JYm3fIeaQgKpWgAXph11fh4W9Hret4Gaunr
	cuDAF/bkwN+uhsF6pHpPo3HBiz0Xel9ZCFF5DjwIrTsftj2gVeYXz8c7nybM4O3O/mn/
	+8S67AvsQQinyIOsab200EjlfJRZ2y7eB+gpR3Psq1aCaKbMbI1Nw4xmtOUxRU3T7xxY
	rQBQ==
X-Received: by 10.220.99.66 with SMTP id t2mr4771582vcn.40.1403813591324; Thu,
	26 Jun 2014 13:13:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.196.229 with HTTP; Thu, 26 Jun 2014 13:12:41 -0700 (PDT)
In-Reply-To: <53AC7457.3030103@balister.org>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
	<53AB1718.7000608@balister.org> <20140625185504.GD1580@denix.org>
	<CAMCfZKEOYwA=9CtEVVccXASOJXHsh5agvPWvG6imOJXXCEv8Zw@mail.gmail.com>
	<53AB5ADB.3080403@balister.org>
	<CAMCfZKHUaFwx_pQdgqbeS1C-WmKM9DEcNfixug9Jw8Z645epuQ@mail.gmail.com>
	<20140626180954.GG1580@denix.org>
	<CAK8F28kHj_JJh84XWcVt7wy2p70BvpV+WCF4n2r1=FWrRQT8cQ@mail.gmail.com>
	<53AC7457.3030103@balister.org>
From: Ash Charles <ashcharles@gmail.com>
Date: Thu, 26 Jun 2014 13:12:41 -0700
Message-ID: <CAK8F28neQBPbxdfcMGoZ-tyxb1CNoAVO_KC3GDO6tzTjaTpLJg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: State of the art for creating an image that you can dd to an SD card
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
X-List-Received-Date: Thu, 26 Jun 2014 20:13:18 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 26, 2014 at 12:28 PM, Philip Balister <philip@balister.org> wrote:
> Ones with a really ancient MLO, I think. Hopefully, all of those
> binaries are gone from the Internet now.
>
> Philip

Excellent---thanks.  I had assumed this was boot ROM dependent, not
MLO dependent!
--Ash

