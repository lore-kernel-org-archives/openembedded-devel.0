Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BA72C73257
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Apr 2016 11:32:18 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 28 Apr 2016 04:32:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="942031403"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.71])
	by orsmga001.jf.intel.com with ESMTP; 28 Apr 2016 04:32:18 -0700
Date: Thu, 28 Apr 2016 14:32:18 +0300
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160428113218.GA28777@mbabyjoh-desk.ger.corp.intel.com>
References: <1461182993-22950-1-git-send-email-danismostlikely@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1461182993-22950-1-git-send-email-danismostlikely@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH 1/2] openjdk-8: make jar repacking optional
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
X-List-Received-Date: Thu, 28 Apr 2016 11:32:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Apr 20, 2016 at 02:09:52PM -0600, Dan McGregor wrote:
> From: Daniel McGregor <daniel.mcgregor@vecima.com>
> 
> Repacking the runtime jar files takes a long time, and is only done
> to save some space. Make it optional to speed up builds that don't
> need it.
> 
> Signed-off-by: Daniel McGregor <daniel.mcgregor@vecima.com>
> ---
>  recipes-core/openjdk/openjdk-8-cross.inc | 21 ++++++++++++++++++++-
>  recipes-core/openjdk/openjdk-8_72b05.bb  |  7 +------
>  recipes-core/openjdk/openjre-8_72b05.bb  |  7 +------
>  3 files changed, 22 insertions(+), 13 deletions(-)

Pushed these two patches. Thanks!

Best Regards,
Maxin

