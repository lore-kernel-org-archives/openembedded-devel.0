Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 2414B61F47
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Aug 2013 19:00:04 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 26 Aug 2013 12:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,961,1367996400"; d="scan'208";a="351846866"
Received: from unknown (HELO helios.localnet) ([10.252.123.18])
	by azsmga001.ch.intel.com with ESMTP; 26 Aug 2013 11:59:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: maxin.john@enea.com
Date: Mon, 26 Aug 2013 19:59:57 +0100
Message-ID: <2418237.2zCjuWRh6q@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1377515179-56257-1-git-send-email-maxin.john@enea.com>
References: <1377515179-56257-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] [PATCH] log4cplus: add recipe
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
X-List-Received-Date: Mon, 26 Aug 2013 19:00:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Maxin,

On Monday 26 August 2013 13:06:19 maxin.john@enea.com wrote:
> From: "Maxin B. John" <maxin.john@enea.com>
> 
> log4cplus provides a simple C++ logging API for log management.
> 
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  .../recipes-devtools/log4cplus/log4cplus_1.1.1.bb    |   18
> ++++++++++++++++++ 1 file changed, 18 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
> 
> diff --git a/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
> b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb new file mode
> 100644
> index 0000000..5a6d7eb
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/log4cplus/log4cplus_1.1.1.bb
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "log4cplus provides a simple C++ logging API for log
> management" 

If you're setting a short description only, please set it in SUMMARY rather 
than DESCRIPTION.

> +SECTION = "libs"
> +HOMEPAGE = "http://sourceforge.net/projects/liblog4cplus/"

This HOMEPAGE value is incorrect.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

