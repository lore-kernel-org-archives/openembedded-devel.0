Return-Path: <prvs=215580024=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 20FE97F749
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 09:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1573810993; x=1605346993;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=S6AmZomG5EZN+/2J/6sPu8mMdzyXEPnvyQ4UvE2/Awk=;
	b=Jl4wH7MK/EDjI/01Kjsb1X9vTAdf83DVd0gsQ4ah5KYGrlkiECVNafI/
	wWrMFztyNxjgD5wTYcafRfzFtogEOtlK1KSaR3PI1riK0C0iov0it/gnD
	Q9FXpY9cExsR8GvxCZPuMN1gSsENjvH8IIMW64vxrafB2rIcu2uTqEMKa
	sH75t+chqoZu+fhd+Um1PkJezUYR7m6Cq+HkpzbgFi0+dCO3S6QPAofDx
	cuIIupJicksvaDrF1FUpMKBV3N5OBwu+iYvxw8i9MqJVc5C1kqKoMYySQ
	YChAZY/Q2vKbGnTbwXRKE8uw6WxQShzqur+WoyMF0xsH2j8fq+l0UB0GH A==;
IronPort-SDR: 8N0hvmuSkc4AJ+Rw+IvIDXANGK03ekIcVDgs1SteL1/AVhL+877MZRz/BThTORUk/eMYN+nNfc
	/IVwZay9AE0Np2BwqvpQdU1OfOyKCXYLMAjfyXU7ByFpeD+Wn3dq9OUd2RU3vi7r6lBiI22qG8
	iz/sCbf0u2IaDfgtW5uub/jRIybhnmpexdwSrey+osa31JUXbVkryEEyiDCCPmEprRjMQBK2Vn
	eRn5+ejnvsoVJNdeMthdOIUTH6c+lvbPaPWotE2Jv/djdF8f9RtPx02jS6bV2XTAZkuvrF0BgW
	9Rg=
X-IronPort-AV: E=Sophos;i="5.68,307,1569276000"; d="scan'208";a="20914842"
To: Chris Laplante <chris.laplante@agilent.com>,
	<openembedded-devel@lists.openembedded.org>
References: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <e453d52d-3660-ecb4-06b3-148f1076a9c7@skidata.com>
Date: Fri, 15 Nov 2019 10:43:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <1573065695-91730-1-git-send-email-chris.laplante@agilent.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: [meta-java] [PATCH v2 0/2] add patches to fix BigDecimal
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
X-List-Received-Date: Fri, 15 Nov 2019 09:43:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi,
this is a note to let you know that I've just added this series to the
master-next branch of the meta-java repository at
     git://git.yoctoproject.org/meta-java

As soon as it has gone through some more testing it will likely be
merged to the master branch.

If you have any questions, please let me know.

regards;Richard.L

On 06/11/2019 19:41, Chris Laplante wrote:
> v2: split into two commits; add sign-offs; add description to commits
> 

