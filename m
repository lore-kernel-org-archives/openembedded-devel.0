Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 62D6265CC1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Aug 2014 00:36:52 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id gl10so6240003lab.35
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 10 Aug 2014 17:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:content-type;
	bh=gbMmzUP2xq3KdQoC5V5XufiXg0yV2zyZnY6bUnrB8Ys=;
	b=kP2sNhQ87Z1hTw9dmvTr8we4yr+PH4kICuJaSmZKezN7z5N/hL+Oz1SlVgmM2tKw1o
	DaKUMaDb3qq1q76wYxHOBKUHQDFE67BkEvNgvi42TUalC/O3x9PlFq4sW0qPiZ76hX/k
	fMaA5SPSq3G4KXdCTwOwom98OGgJ6h7pDMSczyWxaLPXO5rha90nG92dPrhn57IuElJB
	bP0RLYEMWf0kNUCG6m951Cku+c6DjyVv4uC8PeQWPMyCjm6pOiX5tuvlEMav/smseiC4
	S4YzRgDYgJkNXKc5RnE8NxmR3LntNiP4AAP26naL/0P8LWhSV0grArYDLlpQpLZk4ok/
	Yf3Q==
X-Received: by 10.112.159.169 with SMTP id xd9mr5031072lbb.76.1407717412244;
	Sun, 10 Aug 2014 17:36:52 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.43.42 with HTTP; Sun, 10 Aug 2014 17:36:32 -0700 (PDT)
In-Reply-To: <20140810092431.GP14848@jama>
References: <cover.1407632366.git.chris_larson@mentor.com>
	<df6c707e6db09c6b640084b8a4a69919b147ad07.1407632366.git.chris_larson@mentor.com>
	<20140810092431.GP14848@jama>
From: Christopher Larson <chris_larson@mentor.com>
Date: Sun, 10 Aug 2014 17:36:32 -0700
X-Google-Sender-Auth: d_SN2FEqQ5RKuIQTeqQ418xdKFs
Message-ID: <CABcZANma2YyDV34G+9EcZ20n8Uj7cFjKXh2AHG0zSqd2b+f4wg@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe][PATCH 3/5] dnsmasq: fix parallel make issue
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
X-List-Received-Date: Mon, 11 Aug 2014 00:37:03 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Aug 10, 2014 at 2:24 AM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> > From: Christopher Larson <chris_larson@mentor.com>
>
> Is this v2 of this change which was sent earlier?
>


They should be the same, just this one is part of a series with other
changes. Either should work fine for that particular issue.

-Chris

