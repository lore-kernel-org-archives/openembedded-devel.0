Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0E0B561883
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Aug 2013 17:06:34 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 01 Aug 2013 10:06:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,795,1367996400"; d="scan'208";a="374684018"
Received: from unknown (HELO helios.localnet) ([10.252.122.169])
	by fmsmga001.fm.intel.com with ESMTP; 01 Aug 2013 10:06:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Joe Slater <jslater@windriver.com>
Date: Thu, 01 Aug 2013 18:06:33 +0100
Message-ID: <39299095.V2I0ppqtmc@helios>
Organization: Intel Corporation
User-Agent: KMail/4.10.5 (Linux/3.8.0-27-generic; KDE/4.10.5; i686; ; )
In-Reply-To: <1375374204-5632-1-git-send-email-jslater@windriver.com>
References: <1375374204-5632-1-git-send-email-jslater@windriver.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-selinux][PATCH 1/1] audit: Fixed swig host contamination issue
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
X-List-Received-Date: Thu, 01 Aug 2013 17:06:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Joe,

On Thursday 01 August 2013 09:23:24 Joe Slater wrote:
> From: Anders Hedlund <anders.hedlund@windriver.com>
> 
> CQID: 428272
> 
> The audit build uses swig to generate a python wrapper.
> Unfortunately, the swig info file references host include
> directories.  Some of these were previously noticed and
> eliminated, but the one fixed here was not.
> 
> Signed-off-by: Anders Hedlund <anders.hedlund@windriver.com>
> Signed-off-by: Joe Slater <jslater@windriver.com>

These meta-selinux patches should go to the yocto@yoctoproject.org mailing 
list, as specified in the MAINTAINERS file in meta-selinux.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

