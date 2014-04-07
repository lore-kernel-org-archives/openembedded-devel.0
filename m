Return-Path: <trevor.woerner@linaro.org>
Received: from mail-ig0-f176.google.com (mail-ig0-f176.google.com
	[209.85.213.176])
	by mail.openembedded.org (Postfix) with ESMTP id 29C5B6F8E4
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  7 Apr 2014 20:03:59 +0000 (UTC)
Received: by mail-ig0-f176.google.com with SMTP id uy17so4154919igb.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2014 13:04:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=dbff8bz/23p9aW9W75UAl+xRoQPLdCytI7daOE1d4KA=;
	b=TUN0VHLME6iU4J4lPMPGlWVGP4niXExdUgfvGr2Ihh0/2uSahjBMFOUjOxQt2H+RrA
	Y9yK0lDLKDPAsqv4BXso1HpqfW9B0/0C+c+FWFKZh9jJ26Zo6BhkMxi8CBNhmvhZZ3mH
	KgBf+FmEIpLIoFVm0zjDWE7f4yxGCofoWdlGyzq9ec2ocqE3gEN0AbVgb7ljD9Wk/1qF
	YRuinpvb70lMJL462Mxc9R2IEpBn0neKuyUwI1iBoK3gwZV1KcjDHwo1qzqBwOSJtTsG
	KVXOT3f3WJTdVOlykP1IuVPT9zgQ3SJhBlTO0+AAhFUp5ZdjCi7sj3ebtFpkbvALWE2z
	bAtg==
X-Gm-Message-State: ALoCoQl3Afo+bg9M7cnbs9VNuK2SVmoldVJm8/4TxdEefADR3JJT4it9alYdIGDNbj1uT7iJv2AP
X-Received: by 10.50.176.199 with SMTP id ck7mr300379igc.44.1396901040354;
	Mon, 07 Apr 2014 13:04:00 -0700 (PDT)
Received: from [192.168.141.83] (69-165-220-158.dsl.teksavvy.com.
	[69.165.220.158])
	by mx.google.com with ESMTPSA id kb5sm432303igb.1.2014.04.07.13.03.59
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 07 Apr 2014 13:03:59 -0700 (PDT)
Message-ID: <534304AE.9000108@linaro.org>
Date: Mon, 07 Apr 2014 16:03:58 -0400
From: Trevor Woerner <trevor.woerner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
References: <20140403130609.GF2132@jama>
In-Reply-To: <20140403130609.GF2132@jama>
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-04-03
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
X-List-Received-Date: Mon, 07 Apr 2014 20:04:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Is anyone seeing any build failures with proj-4.8.0? Or does anyone have
any local fixes? This one has been failing for me for a while, and yet
doesn't show up on the SOBBW lists.

