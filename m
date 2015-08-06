Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id C0C31734DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  6 Aug 2015 13:02:27 +0000 (UTC)
Received: by iggf3 with SMTP id f3so10648185igg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 06:02:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:content-type;
	bh=NTtkolfhGmcTnuiLbxB6i1JeHpwWK9e2tEecfNkpZoA=;
	b=TjWkuwmPAuPRi1ch31JzQw+wIBscVhVYC1wKjZ5sQBevj3PvWPh1ZJIwgxfZeM2Bu7
	sIGAz38uZhmk70kj7WtASOkxV70AGCGDEnG0mZoLg8UHQ5um9Iu/W8ygu9wRzs3KX0Qx
	Q/g1uwS1B0tI1pUagRVShaH4SMoKXto1komQYC3YRvrhwaqBKme2YhEwb65k73l8U5+c
	X4GMNUr8VW0CCOIABORaGtSLcE3vh3Dx4eRdgp4nNQ6A7JTS6uEOblav1n0SUwWAkAei
	X+0IzNGuIhXDHK8PtTa4PpGh8869eC5J3EkA+xF5tn60CPXtU7tS3yCizx5eYfoK7CU/
	GGXw==
X-Gm-Message-State: ALoCoQkFg/BpS67wbWQp8m69XzsPR1O1kmJjRFWyI16EzU7NojGDtPSDnhFpdyvnZHhkFKNyK3uP
X-Received: by 10.50.64.212 with SMTP id q20mr3585604igs.5.1438866147343;
	Thu, 06 Aug 2015 06:02:27 -0700 (PDT)
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com.
	[209.85.213.175])
	by smtp.gmail.com with ESMTPSA id i7sm1292135igt.18.2015.08.06.06.02.26
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Aug 2015 06:02:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by iggf3 with SMTP id f3so10647666igg.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 06 Aug 2015 06:02:25 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.61.234 with SMTP id t10mr3238867igr.19.1438866145905;
	Thu, 06 Aug 2015 06:02:25 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Thu, 6 Aug 2015 06:02:25 -0700 (PDT)
In-Reply-To: <55C30BCC.2090309@skidata.com>
References: <556EA59A.8010007@skidata.com>
	<CAP9ODKpB0A9JZbWdS80Dq2bNX1VG5e3PKTpSpCvdvCrwD4965g@mail.gmail.com>
	<55ACECA1.10102@skidata.com> <55C30BCC.2090309@skidata.com>
Date: Thu, 6 Aug 2015 10:02:25 -0300
Message-ID: <CAP9ODKrm-OgC5=_HTrPSpfNsGrab2cus7s8v1eRGa68_GLW5ZQ@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH] openjdk-7: 75b13-2.5.4: fix xawt build
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
X-List-Received-Date: Thu, 06 Aug 2015 13:02:29 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 6, 2015 at 4:25 AM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> Hello,
> any updates on this patch?

The patch didn't apply so I asked you to rebase. Can you rebase and send?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

