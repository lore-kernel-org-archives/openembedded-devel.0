Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4FE71633
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Aug 2015 10:55:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 28 Aug 2015 03:55:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,424,1437462000"; d="scan'208";a="792751996"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.143])
	([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2015 03:55:49 -0700
Message-ID: <55E03E94.50705@linux.intel.com>
Date: Fri, 28 Aug 2015 13:57:24 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1440687197-26742-1-git-send-email-schnitzeltony@googlemail.com>	<55DF25BF.4080304@linux.intel.com>	<CALbNGRTpF_HNK5wzOBQfjwUfXqguciU+9yCfcjOHmonjAc_hZg@mail.gmail.com>
	<1858940.qR1UtCzzK3@peggleto-mobl.ger.corp.intel.com>
In-Reply-To: <1858940.qR1UtCzzK3@peggleto-mobl.ger.corp.intel.com>
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
X-List-Received-Date: Fri, 28 Aug 2015 10:55:51 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/27/2015 06:28 PM, Paul Eggleton wrote:

> A different person asking doesn't make the idea any more palatable (not to me,
> at least...)
>
> Since this wasn't explored earlier though, if we absolutely must upgrade
> liberation-fonts and there really is no alternative to distributing this font
> other than to build it from source then we're left with little choice, but are
> both of those things true?

I haven't explored the situation in detail; I've only seen the 
RECIPE_NO_UPDATE_REASON that someone else added, and took what it says 
at face value: it is desirable to update the fonts, but absence of 
fontforge in oe-core prevents it.


Alex


