Return-Path: <eduardo@monkey.io>
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
	[209.85.161.179])
	by mail.openembedded.org (Postfix) with ESMTP id 55EA57705D
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Apr 2016 20:48:20 +0000 (UTC)
Received: by mail-yw0-f179.google.com with SMTP id g127so267269777ywf.2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Apr 2016 13:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=monkey-io.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=vyJu2a5sXXkdLVBXRLUGL0ill+k3Owy9MDLBxop68N4=;
	b=TIEa7F2u71V1jDIXst1IQl/57U5YLUVX5ZBfc+1UGg2ydbHF+efsPoXVoubi/Jtq8m
	Dg8Ss2mgOJjUhJ7bmY+EVw7r14mO6etnsIciMQGn3r/8LvncegdDG8CNQ7XEd5b+lfsD
	ENsQ1v7eKkYfj1yzelk8qjJDAf5xyyU4/YTU/E38ORaJsoOHRyUTCkEN7OYWRo9z2A9H
	+igB2sguA8pL1Bt8IK+dJT1vr6n2dpy8s/RtlcTy5Q/L3+y4kBMj83Igia2eQwUXqmaX
	1F3fTK8/7zSjm5tALKtMEYL20fSZ/xAqCKDfm0wRgMS90BfnsSMpv1ZD5EM2/D+sm5Vc
	kQSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=vyJu2a5sXXkdLVBXRLUGL0ill+k3Owy9MDLBxop68N4=;
	b=MdUfPSnK2xowi4vjojFEY74/SMlF2H2wEACXHaobq6/FzByz5U6yuHvH58lovmNHP6
	Nr2y/QrGN08V5mUwDsCuh9l5DtQsw7dHRVqxaKsWqBSR6KW/UyaffVXcyNYxZLpkC6uf
	+yuU+2wSZabu518zSYX4MufUvHlfzHpmQee1DpLaEKYYDEQPzvulk6kyoTuzqe0TEJ+q
	IM8V9Mr5z50LTujJZO8qr8xehBl3wEafLEw7ZhC4UlNbAyGbvGu1UdkxgyWt9xzg5+0R
	ht1Y2Mu0MW5+VgWNEuxtDQBda2d5MB3A50NqZlofcNIPOnqztuTrhz2uHm+ZX/ntVW91
	CdkA==
X-Gm-Message-State: AD7BkJLqEQt2rCgnHhuWgvVnT1wSN8Yf9JYL5EFzBNFwHnJt4hIYh0Bgbo82BQyvTy4CR3zQ4aHRZEn1fb4PSQ==
MIME-Version: 1.0
X-Received: by 10.37.231.216 with SMTP id e207mr21202249ybh.130.1459802901056; 
	Mon, 04 Apr 2016 13:48:21 -0700 (PDT)
Received: by 10.13.236.200 with HTTP; Mon, 4 Apr 2016 13:48:20 -0700 (PDT)
Received: by 10.13.236.200 with HTTP; Mon, 4 Apr 2016 13:48:20 -0700 (PDT)
In-Reply-To: <1898077.8Qsu7883hT@peggleto-mobl.ger.corp.intel.com>
References: <1459406572-8144-1-git-send-email-eduardo@monkey.io>
	<CAEaCVQjW0cmMDNyc3LhZQxv+RWfVmx9Bj-qgQx9AH1_+0=sTDA@mail.gmail.com>
	<20160402181714.GG2567@jama>
	<1898077.8Qsu7883hT@peggleto-mobl.ger.corp.intel.com>
Date: Mon, 4 Apr 2016 14:48:20 -0600
Message-ID: <CAEaCVQg1Cj67kVn_AA_g7fTL_mXooCG6v0-W4M0p1X+b694JhQ@mail.gmail.com>
From: Eduardo Silva <eduardo@monkey.io>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] fluentbit: add new recipe
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
X-List-Received-Date: Mon, 04 Apr 2016 20:48:23 -0000
Content-Type: text/plain; charset=UTF-8

Thanks. Already sent a Patch v2.
On Apr 4, 2016 1:46 PM, "Paul Eggleton" <paul.eggleton@linux.intel.com>
wrote:

> On Sat, 02 Apr 2016 20:17:14 Martin Jansa wrote:
> > On Fri, Apr 01, 2016 at 11:20:49AM -0600, Eduardo Silva wrote:
> > > on this case should be "RDEPENDS_${PN} = "zlib" OK ?
> >
> > NO
>
> It's build-time so you want zlib in DEPENDS. A runtime dependency will get
> added automatically (since binaries packaged by the recipe will be linking
> against libz.so).
>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
>

