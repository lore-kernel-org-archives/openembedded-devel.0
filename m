Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 96E5D6CC42
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Oct 2013 00:57:17 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id k11so3668478eaj.28
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Oct 2013 17:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=uoRbeARY9KoR+5MlcS/+uNCeFEec2sRvd1kUZYtKwDI=;
	b=Tr2C+zT6LXVpEQI1tN7Fpbh7XuTza0fHjI6KMHR+bfgbr9YJyqagMiJef3+I6d4hKD
	LGEhfgoqNUo/Pm9PZDI5cSymCrZi9nW7z846gwsKsTsOvJbpVNwqAG4YGw205/9d5dUs
	BvBCpbvpXbmU0krVaiVIDM0Kdic5mGUnozmwVCmri0GuwNRRNjQbm4mmTGEifn1Kl0sO
	6Pq8NbPDc7EArf4kUJ4Hq8f1nICpHHybgnOUEVWngvEZmW700b+7IYFqTpBwUdJurgd2
	JgoeEo8j+j/Y2RiKnSbuaqD8q/iG4XjBP8j9RTWrrgBf+/NTRjRD4fZFyoSgVE+rZMqy
	e5Kw==
X-Gm-Message-State: ALoCoQnqKHtaetizuElPyZEQ0r90va5VhJNMaNUnMSLCHzw04ZPv+SOlxnBAGUQNsYrE3PVOstme
MIME-Version: 1.0
X-Received: by 10.14.208.194 with SMTP id q42mr53521399eeo.31.1381193838806;
	Mon, 07 Oct 2013 17:57:18 -0700 (PDT)
Received: by 10.14.117.67 with HTTP; Mon, 7 Oct 2013 17:57:18 -0700 (PDT)
In-Reply-To: <20131007203527.GG18775@denix.org>
References: <20131007180120.GC18775@denix.org>
	<20131007202956.718ce202@e6520eb>
	<20131007183739.GD18775@denix.org>
	<20131007205710.386447ba@e6520eb> <20131007193306.GT6240@jama>
	<CAOMwXhNV3q5P_+kCZtnDNUpZpG-OvMoe7Rem=cw86Z6vx8WmbA@mail.gmail.com>
	<20131007194922.GE18775@denix.org> <20131007201536.GU6240@jama>
	<20131007202336.GF18775@denix.org>
	<CAOMwXhMpx8KjDyq_4fD949owFWE8r1O61E7D085+U31=fR5kNg@mail.gmail.com>
	<20131007203527.GG18775@denix.org>
Date: Mon, 7 Oct 2013 20:57:18 -0400
Message-ID: <CALmOhgmsSCvdcwGO-op9QtoNyF_bTkVsbj5BYmMg3uszXGUEsg@mail.gmail.com>
From: Trevor Woerner <trevor.woerner@linaro.org>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] Update to 5.1.1?
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
X-List-Received-Date: Tue, 08 Oct 2013 00:57:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

Would the intent here be to replace 5.1.0 with 5.1.1? Or to have both
versions available and let the user choose?

