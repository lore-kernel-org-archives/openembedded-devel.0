Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 72F8A77000
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Oct 2015 10:56:24 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 01 Oct 2015 03:56:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,616,1437462000"; d="scan'208";a="781748806"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 01 Oct 2015 03:56:09 -0700
Date: Thu, 1 Oct 2015 09:09:57 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151001060957.GA12230@mbabyjoh-mobl.fi.intel.com>
References: <17C19527BD855F428F22685986FD58BEA01C37@IRSMSX103.ger.corp.intel.com>
MIME-Version: 1.0
In-Reply-To: <17C19527BD855F428F22685986FD58BEA01C37@IRSMSX103.ger.corp.intel.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java] Commit duplication
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
X-List-Received-Date: Thu, 01 Oct 2015 10:56:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Erkka,

On Wed, Sep 23, 2015 at 08:37:40AM +0000, Kaaria, Erkka wrote:
> Hi,
> 
> There seem to have been a bad merge commit made December 17 2014 (http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=12a0b10b35b1829eec11ea653af53d127a8b6fd1). This commit introduced duplicate commits into the git history (for example, http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=8042dd1f8e3ccee2ddb31e792e3f88c6e2583847 and http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/commit/?id=7b66b4940804b72150b33248b16b582ae6a48751). These duplications are causing issues with certain tools.
>

Yes, those commits looks really weird. However, fixing those commits 
to make it work with tools like "combo-layer" might require some git 
related work and a "force push".

Would that be acceptable for all to do a force push on the upstream 
repository ?

Best Regards,
Maxin

