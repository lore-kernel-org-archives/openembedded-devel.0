Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f46.google.com (mail-pa0-f46.google.com
	[209.85.220.46])
	by mail.openembedded.org (Postfix) with ESMTP id 21B3C73D9D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 17:12:13 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so135636501pac.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Apr 2015 10:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=bBqt3SOdTdmhEtIgzzRPUNzVdkmPBLW0NeRhUXnhUPc=;
	b=ue/RRiQdwV1mb+gIBd5H009rItv7ZQpVGXA/qnSG7f0Lj/iJxP/qf0/CrHW7LrbzMq
	8K9fcw1K45euJjEdgC5Nek1j3gy1tNmIJeydHmt64VLX61u3TER8Wjw5v3t/Pl8wONcG
	lbbnlqPFPLWsTApzfBrWvjQpLLXjuE3gYcfPNksBDi+qrhkcriuHGTrqJqGkFRrJQSLu
	xTEU5BbpAu7P5c8B5AmlCaLziwT3ZqfLLjd/VyOdXVnyQvYLnvuuIFAU/9ZJ4+xlGOWc
	7u6+AXE/eG8RrOV14CDqjGKVGorOpDVqMwT2Yb3snpyymupG3m8F9xcZ78/QNnwl2Rji
	1feA==
X-Received: by 10.67.24.33 with SMTP id if1mr23825116pad.24.1430154734877;
	Mon, 27 Apr 2015 10:12:14 -0700 (PDT)
Received: from [192.168.0.13] (c-76-103-142-85.hsd1.ca.comcast.net.
	[76.103.142.85]) by mx.google.com with ESMTPSA id
	gj9sm16428253pbc.77.2015.04.27.10.12.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 27 Apr 2015 10:12:13 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2098\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrO9G9nNyADvRpXG3hhQQDC-=B4okpsL93VLMx7M0i06g@mail.gmail.com>
Date: Mon, 27 Apr 2015 10:12:12 -0700
Message-Id: <3EA16728-34D3-4FBF-B45B-175AA746104C@gmail.com>
References: <1430153054-1252-1-git-send-email-raj.khem@gmail.com>
	<CAP9ODKrO9G9nNyADvRpXG3hhQQDC-=B4okpsL93VLMx7M0i06g@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.2098)
Cc: pnandyala <Pavan.Nandyala@lnttechservices.com>,
	Zoltan Kuscsik <zoltan.kuscsik@linaro.org>,
	knagabhirava <kalyankumar.nagabhirava@lnttechservices.com>
Subject: Re: [meta-browser][PATCH 1/2 V4] cef3: Add recipe for Chromium Embedded Framework
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
X-List-Received-Date: Mon, 27 Apr 2015 17:12:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Apr 27, 2015, at 9:57 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:
>=20
> - proper patch headers

can you point to patch header guidelines for meta-browser ?=

