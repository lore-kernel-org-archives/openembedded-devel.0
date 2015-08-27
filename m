Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5F0C260043
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Aug 2015 14:57:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 27 Aug 2015 07:57:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="792105228"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2015 07:57:38 -0700
Message-ID: <55DF25BF.4080304@linux.intel.com>
Date: Thu, 27 Aug 2015 17:59:11 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>
	<1440687197-26742-2-git-send-email-schnitzeltony@googlemail.com>
In-Reply-To: <1440687197-26742-2-git-send-email-schnitzeltony@googlemail.com>
Subject: Re: [PATCH 1/5] fontforge: update to 20150824
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
X-List-Received-Date: Thu, 27 Aug 2015 14:57:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 08/27/2015 05:53 PM, Andreas Müller wrote:
> --- a/meta-oe/recipes-graphics/fontforge/fontforge_20141126.bb
> +++ b/meta-oe/recipes-graphics/fontforge/fontforge_20150824.bb
> @@ -1,9 +1,9 @@
>   SUMMARY = "A font editor"
>   HOMEPAGE = "http://fontforge.github.io/en-US/"

Oe-core has liberation-fonts package which apparently can not be updated 
because newer versions depend on fontforge. Would you be interested in 
moving fontforge to oe-core and updating liberation-fonts?


Alex


