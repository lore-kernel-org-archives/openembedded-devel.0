Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 785C377D11
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Jun 2017 19:07:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 01 Jun 2017 12:07:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,281,1493708400"; d="scan'208";a="1155511348"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga001.fm.intel.com with ESMTP; 01 Jun 2017 12:07:47 -0700
Message-ID: <1496344585.26945.85.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Branden Archer <brarcher@lexmark.com>
Date: Thu, 01 Jun 2017 14:16:25 -0500
In-Reply-To: <CAADoZg08aEjHeFb30CHjicODL2OMzJtq3XnwyGHFnRG-p7EEdQ@mail.gmail.com>
References: <CAADoZg08aEjHeFb30CHjicODL2OMzJtq3XnwyGHFnRG-p7EEdQ@mail.gmail.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH] Upgrade zsh to 5.3.1
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
X-List-Received-Date: Thu, 01 Jun 2017 19:07:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

please 1. send the patch with git-send-email and 2. when formating the
patch, use git format-patch -M, this way git will detect renames (which
are upgrades in this context)

Leo

On Thu, 2017-06-01 at 12:59 -0400, Branden Archer wrote:
> Attached please find a patch to consider for the zsh recipe which upgrades
> zsh from 5.0.5 to 5.3.1.
> 
> The rationale for upgrading the recipe is in part to pick up a potential
> security related fix in 5.0.7 from 2014 as well as pick up additional
> features and bug fixes.
> 
> Thanks,
> 
> - Branden
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel



