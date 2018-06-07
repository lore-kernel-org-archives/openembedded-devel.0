Return-Path: <prvs=68935beb6=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 9FA1D770CB
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Jun 2018 05:39:08 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,486,1520895600"; d="scan'208";a="10719698"
To: Henning Heinold <henning@itconsulting-heinold.de>
References: <20180510160956.85938-1-jason.wessel@windriver.com>
	<6bf492f0-0f73-4b58-5eab-70f5213f0963@skidata.com>
	<20180606211415.GB16170@mail.itconsulting-heinold.de>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <fc64aba0-20aa-55d8-2da5-3bc544fad6be@skidata.com>
Date: Thu, 7 Jun 2018 07:39:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180606211415.GB16170@mail.itconsulting-heinold.de>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-java][PATCH] icetea7, openjdk-8: Fix depenency to xproto -> xorgproto
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
X-List-Received-Date: Thu, 07 Jun 2018 05:39:09 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06/06/2018 11:14 PM, Henning Heinold wrote:
> On Wed, Jun 06, 2018 at 11:57:42AM +0200, Richard Leitner wrote:
> 
> Hi,
> 
> I have applied the patch to master and master-next.

Thanks!

> 
> Should it be applied to some stable branches?

No, currently only master and master-next is fine.
In oe-core's sumo branch (and the stable branches before) it's still
called xproto.

> 
> Bye Henning
> 
> PS: Thanks for testing it.

regards;Richard.L

