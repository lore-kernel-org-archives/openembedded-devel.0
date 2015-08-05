Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f170.google.com (mail-pd0-f170.google.com
	[209.85.192.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3DB5960017
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Aug 2015 20:33:52 +0000 (UTC)
Received: by pdrh1 with SMTP id h1so4905915pdr.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 13:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=EaxcHCXSn2va4rBspOxEAZ0y+RFNaimO028W+XLRmeA=;
	b=UcVshGiqImhzyZbeAjQRw8k/V+8/O8y/He9nogRLFgSV/b4fNLcv8z+lq76lzgM9Xu
	e1uOgYlshk+8ScDM1FwewWkntrUotkJC3Z0ePIxtvTZLz9skZMHuAvV0Fvb31kuXnUHP
	WNbdJUx/Dg8NPGNZsMP84QFM1IySwrX4yd2tUqCs/pYyxMQAXVUMDHJxe7nq+wgm3I7a
	aXsf/HqLyd1/r1jncZ7J+qr0Xz7zuJ18L73ubrFKxazi6YzequQMKNGzPtXMv5tARDya
	EZ5fomvEVIDZOcEnCf8QEpkXm2Y9Rbaiwg+SYZgsT6beDkaQhUYGY54sP1uu/tkyts7M
	rJtg==
X-Gm-Message-State: ALoCoQn3YpjCPtRhN7+b+NBzPMeb5tJeS6e8hJL8CT33+DtQrBP3cj1S+LsC03ISFZfgnACO7YQl
X-Received: by 10.70.123.72 with SMTP id ly8mr23280419pdb.134.1438806831942;
	Wed, 05 Aug 2015 13:33:51 -0700 (PDT)
Received: from mail-pa0-f51.google.com (mail-pa0-f51.google.com.
	[209.85.220.51]) by smtp.gmail.com with ESMTPSA id
	wz11sm3862919pbc.72.2015.08.05.13.33.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Aug 2015 13:33:50 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by pabyb7 with SMTP id yb7so12304205pab.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Aug 2015 13:33:50 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.68.197.199 with SMTP id iw7mr22998560pbc.85.1438806830425;
	Wed, 05 Aug 2015 13:33:50 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Wed, 5 Aug 2015 13:33:50 -0700 (PDT)
In-Reply-To: <B399646F8CA055479BEC55F6B065A04A3703DA8B@FMSMSX108.amr.corp.intel.com>
References: <B399646F8CA055479BEC55F6B065A04A3703DA8B@FMSMSX108.amr.corp.intel.com>
Date: Wed, 5 Aug 2015 17:33:50 -0300
Message-ID: <CAP9ODKrkQ0RtcHiCf72Bmq70PKOd8pbYc2+y2W5=Y-d87Z8Kvg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: "otavio@ossystems.com.br" <otavio@ossystems.com.br>,
	"mario@ossystems.com.br" <mario@ossystems.com.br>
Subject: Re: [meta-java] [Openjdk-8 enabling patch]
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
X-List-Received-Date: Wed, 05 Aug 2015 20:33:56 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 5, 2015 at 4:29 PM, Awasthi, Vinay K
<vinay.k.awasthi@intel.com> wrote:

I know you can do better; please follow the OE commit guidelines please.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

