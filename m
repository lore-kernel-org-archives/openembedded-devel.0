Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 1B37C6AC2B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  8 Mar 2015 11:08:00 +0000 (UTC)
Received: by paceu11 with SMTP id eu11so50970171pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 08 Mar 2015 04:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to;
	bh=PeC8AJaluajCfvRLXwKOzTlI0nF04XW9Nr2OpAQ3X+M=;
	b=suzd4KhQDytv8IZlthTuhuEUfvVUY61tA5YM+wXFDMDivgj8/Bzlp0kS/RqXdxxBwp
	5UcJY+mdvuBQardHyw6MBFRp/XcwrKXtfS6gOZg8mTDEyevg1sqo6Lhsef/YiMxjVZB0
	ABSUYIycbTrO2kTTPGU6hqjDCVhJq7bskTza9u1UfHgSXNsRLLTtrM32Q4V9+4LhIpzQ
	xTcaWpPNA+ajzluvDEJc89RND0y0Jooc53dk6Jj3tEwYRMlpjU0uQ47Gu6Qv4YFxuQ0y
	L2TJ8GezkFgTZWHvXD6t5yPnYXPiFro8TBQ96JJO7ovxaHI6o2fKF+JPwPNdioZ4uawh
	FelQ==
X-Received: by 10.66.182.199 with SMTP id eg7mr40828986pac.57.1425812882173;
	Sun, 08 Mar 2015 04:08:02 -0700 (PDT)
Received: from ?IPv6:2601:9:3580:84c:55a9:942c:de45:64b7?
	([2601:9:3580:84c:55a9:942c:de45:64b7])
	by mx.google.com with ESMTPSA id
	bx13sm14553032pdb.19.2015.03.08.04.08.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 08 Mar 2015 04:08:01 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2070.6\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20150305141706.GS2337@jama>
Date: Sun, 8 Mar 2015 04:08:00 -0700
Message-Id: <8F9F4054-4B53-4A33-B156-D76FAFD21201@gmail.com>
References: <1425518853-20124-1-git-send-email-raj.khem@gmail.com>
	<20150305141706.GS2337@jama>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2070.6)
Subject: Re: [PATCH 1/2] nodejs: Upgrade to 0.12.0
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
X-List-Received-Date: Sun, 08 Mar 2015 11:08:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


> On Mar 5, 2015, at 6:17 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> 
> nodejs-0.12.0: nodejs-npm requires /bin/bash, but no providers in its
> RDEPENDS [file-rdeps]
> 


send a v3 with fix

