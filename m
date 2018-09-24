Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 6E8F16E616
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Sep 2018 23:09:25 +0000 (UTC)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6E6B520874;
	Mon, 24 Sep 2018 23:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537830566;
	bh=a9TyWq2EszcaOwY8tH90XI5LmjDGkK03w+Uenzr1YM0=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=mTlr+XQfJ2u9vEDLy/POdQ/XtYSEphbHWd/behVUSeAzHhAYMK8GmZ6RrrTYk+OV8
	Nc6u7u/orvD57AR4BgBsI4AbyAFTv3OkamgObIrmpYD6XgKu3TnmGOYXAFRGVz8KIl
	NnJtp5wCGGaJ35EpGx7lDWGCNX+O6/lxdVGAeKg8=
To: akuster808 <akuster808@gmail.com>,
	openembedded-devel@lists.openembedded.org
References: <20180924192102.25124-1-okaya@kernel.org>
	<55cc8cec-c2b6-e647-8d40-32c9fe6ac725@gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <94f9a727-6234-b785-a0fe-42097c93ec2d@kernel.org>
Date: Mon, 24 Sep 2018 19:09:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <55cc8cec-c2b6-e647-8d40-32c9fe6ac725@gmail.com>
Subject: Re: [sumo] [meta-networking] [PATCH v1] dnsmasq: CVE-2017-15107
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
X-List-Received-Date: Mon, 24 Sep 2018 23:09:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/24/2018 6:14 PM, akuster808 wrote:
> Changes for meta-openembedded should be sent to "
> openembedded-devel@lists.openembedded.org  "
> 
> I went ahead and pulled this in.

Thanks, I posted there too after seeing the patch failure. I'm finding
my around different lists.

