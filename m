Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id EDFF66E918
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Feb 2014 09:47:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 27 Feb 2014 01:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,553,1389772800"; d="scan'208";a="482797709"
Received: from ssaevars-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.24])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2014 01:47:16 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Thu, 27 Feb 2014 09:47:15 +0000
Message-ID: <7112269.TWkEtcTFCO@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.13.4-200.fc20.x86_64; KDE/4.12.2; x86_64; ; )
In-Reply-To: <cover.1393470790.git.hongxu.jia@windriver.com>
References: <cover.1393470790.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH V2 0/4][meta-webserver] Apache / PHP upgrades
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
X-List-Received-Date: Thu, 27 Feb 2014 09:47:20 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Thursday 27 February 2014 11:22:06 Hongxu Jia wrote:
> Change in V2:
>     apache2-2.4.7: added support for TLS Next Protocol Negotiation
> 
>     The previous npn support patch (httpd-2.4.4-r1332643.patch) worked on
>     apache2-2.4.6 and conflicted with apache2-2.4.7, 4/4 patch fixed the
>     confliction with 2.4.7.
> //Hongxu

Thanks for doing this. For the modphp and phpmyadmin upgrades, I actually have 
5.5.9 and 4.1.8 build-tested here; once I've tested them at runtime I'll send 
a v3 (should be today).

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

