Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ig0-f182.google.com (mail-ig0-f182.google.com
	[209.85.213.182])
	by mail.openembedded.org (Postfix) with ESMTP id B27A860043
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 10:47:18 +0000 (UTC)
Received: by igui7 with SMTP id i7so79110117igu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:47:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=gzmikRTn2tLg7Ao3sBCczF+RLNchJMdSNu81CpU4fr0=;
	b=XyqpJWbmKbpmcqB51J5G2XbWGddB26jW7iR4ai5jRaL1hRyPgOFhTusyV8uuFOYDtD
	ZlqersmKX0gh+lj23Hpkg0NDkI02BcKHG6y30EhFt+n+SwwiVJus6FQQ5jnQtRhw35n4
	kWfj6q/VSTxNUD9svijrzp3eCeSG9V1qLPmKav4P3QQj/QWvzYNB1J6Idiu9VlYIhXRq
	Oiv9w2m/5qsip9vf2zjrQyArtvN8Q2h0LjLwEOyECjWGGjMbfxdCZrJfIjazh/le+xMi
	Uvmn1NAF+N0dZPsO29DMv9rywOHX/2PogdJp1H45k8mENwvsMCAMGiW2HeJKMDcseA7G
	izAQ==
X-Gm-Message-State: ALoCoQkZ8eD3gj3vjWjEm38LihC+49idYRfLfRGxiXvSNBfhVPFVpOlznu+jpkhkHpPzg7AA8HRj
X-Received: by 10.50.225.35 with SMTP id rh3mr20718209igc.29.1439894838294;
	Tue, 18 Aug 2015 03:47:18 -0700 (PDT)
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com.
	[209.85.213.174])
	by smtp.gmail.com with ESMTPSA id v1sm12574031igk.3.2015.08.18.03.47.17
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Aug 2015 03:47:17 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by igui7 with SMTP id i7so79109801igu.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2015 03:47:17 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.50.88.8 with SMTP id bc8mr23044900igb.46.1439894837172; Tue,
	18 Aug 2015 03:47:17 -0700 (PDT)
Received: by 10.36.218.7 with HTTP; Tue, 18 Aug 2015 03:47:17 -0700 (PDT)
In-Reply-To: <20150818104524.GA30532@jama>
References: <cover.1438618378.git.akuster808@gmail.com>
	<55CCFF62.30603@gmail.com> <20150818104524.GA30532@jama>
Date: Tue, 18 Aug 2015 07:47:17 -0300
Message-ID: <CAP9ODKqwoqQo+OHhW-tj9NT6CCZjMOu4Gbuk7M79k+2jkk77fg@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [PATCH 00/55] For meta-oe fido-next
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
X-List-Received-Date: Tue, 18 Aug 2015 10:47:20 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 18, 2015 at 7:45 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Aug 13, 2015 at 01:34:42PM -0700, akuster808 wrote:
>> can I get a status on this request?
>
> Sorry for delay caused by my vacation, I've just merged it to fido-next.
>
> Send your ACKs when it's ready for merge to fido.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

