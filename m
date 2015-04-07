Return-Path: <anders@chargestorm.se>
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 3A30F72A23
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Apr 2015 07:46:03 +0000 (UTC)
Received: by layy10 with SMTP id y10so35885440lay.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Apr 2015 00:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-type:content-disposition
	:in-reply-to:organization:user-agent;
	bh=N057h5+4mCmY6fO7MdObOYUtUDnQNyeNb5F5DNWbtNM=;
	b=I1H+zojnN2Hd+cVo2OxHUvvSXphtX94w2w5ErJqlgwTJVnW8Ejk89rEHCmexh/yN3J
	sqbOU7im7PhEBwozIrHHl+L8L/ybVHv8SGYnwims+biPLIpV16rhCa+Kpf4a3w8j9/Ur
	s203pKS4h0gv0lkQIBLbiZPb8AhQ78mDxUVgUkNrpd9giT+kUk7+ON9EAHYSwYHotmWY
	ZAh/nle3JrXTl5XEHgWJq+3rb9WmxhZkWk3Bb/x40uFWbcYg02f8F6v08u6NWUDWI7y6
	ALTuN1GA4z8HUE9nNS5yrIISytZ6mwwjYnsPeyefmP9z8U9VoPKyaGL6WnuFJBaXqMj/
	y1AQ==
X-Gm-Message-State: ALoCoQn/p+IAtCFriQKhhXH/SVlTnUnzGImVq0aaOY3JWQxuznPC4e0pDhMJI5vxr0Ihg1ONK+Dl
X-Received: by 10.112.120.199 with SMTP id le7mr11332498lbb.48.1428392762811; 
	Tue, 07 Apr 2015 00:46:02 -0700 (PDT)
Received: from ad.chargestorm.se (213-64-219-84-no126.business.telia.com.
	[213.64.219.84])
	by mx.google.com with ESMTPSA id wh9sm1560797lbb.45.2015.04.07.00.46.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Apr 2015 00:46:01 -0700 (PDT)
Date: Tue, 7 Apr 2015 09:45:59 +0200
From: Anders Darander <anders@chargestorm.se>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20150407074559.GA22775@ad.chargestorm.se>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1428391439-29110-1-git-send-email-biannm@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1428391439-29110-1-git-send-email-biannm@cn.fujitsu.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-oe][PATCH]indent: license should be GPLv3
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
X-List-Received-Date: Tue, 07 Apr 2015 07:46:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Bian Naimeng <biannm@cn.fujitsu.com> [150407 09:31]:

> The license of indent should be GPLv3

No that I'm using this recipe myself, but, indeed the license is wrong.

Acked-by: Anders Darander <anders@chargestorm.se>

-- 
Anders Darander
ChargeStorm AB / eStorm AB

