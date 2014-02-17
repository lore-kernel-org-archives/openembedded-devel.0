Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 454346E7BE
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 16:41:27 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 Feb 2014 08:41:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,861,1384329600"; d="scan'208";a="482991593"
Received: from nithyasr-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.246])
	by fmsmga002.fm.intel.com with ESMTP; 17 Feb 2014 08:41:26 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 17 Feb 2014 16:41:25 +0000
Message-ID: <66319671.qyeNrjsMK8@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.2 (Linux/3.12.10-300.fc20.x86_64; KDE/4.12.2; x86_64; ;
	)
In-Reply-To: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392655039-10538-1-git-send-email-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Eric =?ISO-8859-1?Q?B=E9nard?= <eric@eukrea.com>
Subject: Re: [meta-browser][PATCH] nspr: Rename .bbappend to match new version from oe-core
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
X-List-Received-Date: Mon, 17 Feb 2014 16:41:27 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday 17 February 2014 17:37:19 Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend} | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename recipes-support/nspr/{nspr_4.10.2.bbappend => nspr_4.10.3.bbappend}
> (100%)
> 
> diff --git a/recipes-support/nspr/nspr_4.10.2.bbappend
> b/recipes-support/nspr/nspr_4.10.3.bbappend similarity index 100%
> rename from recipes-support/nspr/nspr_4.10.2.bbappend
> rename to recipes-support/nspr/nspr_4.10.3.bbappend

This bbappend should be merged back into OE-Core - meta-browser shouldn't be 
carrying generic fixes for a core recipe. Could someone please sort that out?

Thanks,
Paul 

-- 

Paul Eggleton
Intel Open Source Technology Centre

