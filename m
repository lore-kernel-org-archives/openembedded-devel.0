Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C07526FE06
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 May 2014 16:19:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 30 May 2014 09:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,941,1392192000"; d="scan'208";a="547358870"
Received: from acdivito-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.223])
	by fmsmga002.fm.intel.com with ESMTP; 30 May 2014 09:19:26 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Date: Fri, 30 May 2014 17:19:26 +0100
Message-ID: <1823759.lCmpzXZFSI@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.14.4-200.fc20.x86_64; KDE/4.12.5; x86_64; ; )
In-Reply-To: <537D5AC7.8040302@windriver.com>
References: <1400658223-15804-1-git-send-email-ticotimo@gmail.com>
	<537D5AC7.8040302@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH v4 00/10] add perl modules
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
X-List-Received-Date: Fri, 30 May 2014 16:19:37 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Hongxu,

On Thursday 22 May 2014 10:02:47 Hongxu Jia wrote:
> On 05/21/2014 03:43 PM, Tim Orling wrote:
> > From: Tim Orling <TicoTimo@gmail.com>
> > 
> > Changes since v3:
> >    * Use ${CPAN_MIRROR} for all recipes
> >    
> >        * See patches for oe-core:
> >            http://patches.openembedded.org/patch/72457/
> >            http://patches.openembedded.org/patch/72459/
> 
> It seems these patches for oe-core have not been merged.

They have been merged now, in which case should I merge these meta-perl 
patches or do you want to?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

