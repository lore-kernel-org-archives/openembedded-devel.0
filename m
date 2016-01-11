Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id D460660588
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 08:08:41 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id z14so95480993igp.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2016 00:08:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ez9rO4Bu1u+4I/6JUZXvuZ4lLBgRMF3rQ4vRAWbk5Fs=;
	b=eafSs3AfwmPclOdcnUfYSzB+DSzc1+/aWveqynOzfy/8fhi1qmgowSatsJ90wuCwqS
	J1/IFbQP05JbhN3vxzCTFYMGIv+UyN+WSi527JCxyXCPBKQR2U4CewX+/rJJEWbRNDf5
	8tfaRQLRVQucUaV9YUk/4+clhqpxjNyz0jFuHhuDa2p/YCClIo8w7vc9GTYsCMQ5RbQX
	JXSZvzX92vJr7k9wbkueGBP/vvYcWNz3CZ7A7tzAlvCddJlGXpWZ/5rIjKxEhrH2P2/3
	yHlHzgdnrbNvhAEHLRkyQ5O70ND5kcRHNa6mS81DCk8wLVsP473CCeC6q9TeUcc36Ua6
	yUNA==
MIME-Version: 1.0
X-Received: by 10.50.43.133 with SMTP id w5mr10204007igl.52.1452499722318;
	Mon, 11 Jan 2016 00:08:42 -0800 (PST)
Received: by 10.36.25.81 with HTTP; Mon, 11 Jan 2016 00:08:42 -0800 (PST)
In-Reply-To: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
References: <1452496246-18628-1-git-send-email-koen.kooi@linaro.org>
Date: Mon, 11 Jan 2016 09:08:42 +0100
Message-ID: <CALbNGRQ7isqSbA=gRPYCFJBH7c8z0hmK+79e5ZmQ6zj0Q2Azhg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Cc: Koen Kooi <koen.kooi@linaro.org>
Subject: Re: [meta-oe][PATCH] various: delete qt4 recipes that break parsing due to missing classes
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
X-List-Received-Date: Mon, 11 Jan 2016 08:08:42 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 11, 2016 at 8:10 AM, Koen Kooi <koen.kooi@linaro.org> wrote:
> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
> ---
double efforts? [1]

[1] http://lists.openembedded.org/pipermail/openembedded-devel/2016-January/105406.html

Andreas

