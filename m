Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B43B65DD6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Aug 2014 12:53:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Aug 2014 05:53:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,893,1400050800"; d="scan'208";a="586879340"
Received: from kmcfarla-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.95])
	by fmsmga002.fm.intel.com with ESMTP; 19 Aug 2014 05:53:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: YangHaibo <b40869@freescale.com>
Date: Tue, 19 Aug 2014 13:53:28 +0100
Message-ID: <1488715.AFk0jdnqDO@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.13.3 (Linux/3.15.10-200.fc20.x86_64; KDE/4.13.3; x86_64; ;
	)
In-Reply-To: <1408431709-5955-1-git-send-email-b40869@freescale.com>
References: <1408431709-5955-1-git-send-email-b40869@freescale.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][meta-webserver][PATCH] move fcgi-2.4.0 recipe and patch to correct folder
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
X-List-Received-Date: Tue, 19 Aug 2014 12:53:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday 19 August 2014 15:01:49 YangHaibo wrote:
> ---
>  meta-webserver/recipes-support/{ => fcgi}/fcgi_2.4.0.bb                   |

FYI, I moved this recipe to recipes-support deliberately. We shouldn't need to 
put it in a recipes-fcgi directory unless you expect to be adding a number of 
other recipes that would fall into the same category - is that the case?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

