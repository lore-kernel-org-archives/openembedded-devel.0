Return-Path: <fathi.boudra@linaro.org>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 76A746BA72
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Aug 2013 04:57:37 +0000 (UTC)
Received: by mail-la0-f47.google.com with SMTP id eo20so4305609lab.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2013 21:57:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=UPSlf4eOKB+TuTCETHqAGE0h7bX9YAxsNKLo6QOBttk=;
	b=iEuj1RjHpjpKCJmToNktgv1onz6ZOB4WQDF7GU2AS2pM7QHYYZPmiEkhI8H3kw9tSh
	0K1o6rwpaOrbfgy25L4YK/tZStDlurEgbOYyhU3LOCsYI2dpgnfV5kfZkN55iDJ9W5e3
	hqY87x4hPRGP7fG2LTzdpTDtfbXeWmyrpr6ef4kz9eJGcr/SlS3kvlBFAydN2KA+R4Ol
	GTv3WY+cBXcpu4jmd7ARcoxWdTWBOYlRLUMIu6ocvv71iedk1CZ3XvFNSZE2ntH34NCQ
	ywxubLB+xriVSbGYTPfNxJSDu6eYAW1ECxWtqfZVAGc5c/oIII5WV0hBGOPN6TtLAlRS
	W1YQ==
X-Gm-Message-State: ALoCoQnGgmjGMHDNBHBUFOsGOjByU5l+diIfuPiiPVlQEuztUKVugXCCOWxJ2LvaZPvJBxGZjXj3
MIME-Version: 1.0
X-Received: by 10.152.3.42 with SMTP id 10mr22317452laz.22.1377665857294; Tue,
	27 Aug 2013 21:57:37 -0700 (PDT)
Received: by 10.112.160.73 with HTTP; Tue, 27 Aug 2013 21:57:37 -0700 (PDT)
In-Reply-To: <CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
References: <1377589711-14948-1-git-send-email-b40290@freescale.com>
	<CAGNsrLC=F+urFnDux=ZB1RSez3jF7err6KEqV3zcBj_x6pXEqA@mail.gmail.com>
	<CA452391058F6D4E9715FB2C29D9312A016BC265@039-SN2MPN1-023.039d.mgd.msft.net>
Date: Wed, 28 Aug 2013 07:57:37 +0300
Message-ID: <CAGNsrLC9ZP5seQjwsvb=Py0QE6-fVy8FnRSV7NWxwz9bAS+EUA@mail.gmail.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH ] libhugetlbfs: add recipe
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
X-List-Received-Date: Wed, 28 Aug 2013 04:57:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

On 28 August 2013 05:56, Luo Zhenhua-B19537 <B19537@freescale.com> wrote:
> Hi,
>
> libhugetlbfs should be moved to a common layer, since it can be used by other BSPs

agreed.

> except linaro.

what do you mean by "except Linaro"?

Cheers,
Fathi

