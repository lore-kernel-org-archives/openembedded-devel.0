Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id BE5AE746A6
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Oct 2018 15:55:32 +0000 (UTC)
Received: from [192.168.0.106] (cpe-174-109-247-98.nc.res.rr.com
	[174.109.247.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 97B2A2084D;
	Fri,  5 Oct 2018 15:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1538754933;
	bh=jqoZIhFkFu4SK5I8p5PCrEXrvWcb+ruJ290T8jTOSRg=;
	h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
	b=GH57G7kJsnuBZf92Oyv+1x1wdKndPfEXG2FCXVebYeGZOwdEMlTlpmy6M47+LSQ9a
	ajFKkbVhEI0Ws7f8IzTELP3KWk0+USCquGcV9vLtoZ5Lr/xQgpxRtjm1HN7C4qajjF
	mt68sEXy46bW4ir3L8Q6DyWH0sDDqha05j01muow=
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <fe502ba2-ec63-285a-9e43-1a72d8e9365d@kernel.org>
	<CADkTA4MXWfH=TY4hDro=33nvoPBYNx3P-4uEY2k=Li+xsadhfQ@mail.gmail.com>
From: Sinan Kaya <okaya@kernel.org>
Message-ID: <5e0741fc-371c-16ac-ae02-0c5a02167a91@kernel.org>
Date: Fri, 5 Oct 2018 11:55:32 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4MXWfH=TY4hDro=33nvoPBYNx3P-4uEY2k=Li+xsadhfQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [sumo] [meta-virtualization] [PATCH v1] docker: CVE-2018-10892
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
X-List-Received-Date: Fri, 05 Oct 2018 15:55:32 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 10/5/2018 11:41 AM, Bruce Ashfield wrote:
> Wrong list.
> 
> This needs to go to the meta-virtualization mailing list.

Thanks for the heads up. Is there a document somewhere saying which
patch needs to go to which list?

This is the second time I screwed up.

