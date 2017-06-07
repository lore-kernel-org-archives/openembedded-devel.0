Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0B6F278145
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Jun 2017 16:12:28 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Jun 2017 09:12:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,311,1493708400"; d="scan'208";a="112057973"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.119])
	by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2017 09:12:28 -0700
Message-ID: <1496852475.26945.134.camel@linux.intel.com>
From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
To: Ismo Puustinen <ismo.puustinen@intel.com>
Date: Wed, 07 Jun 2017 11:21:15 -0500
In-Reply-To: <20170607110854.5275-1-ismo.puustinen@intel.com>
References: <20170607110854.5275-1-ismo.puustinen@intel.com>
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] opencv: fix compilation error when OpenCL is enabled.
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
X-List-Received-Date: Wed, 07 Jun 2017 16:12:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2017-06-07 at 14:08 +0300, Ismo Puustinen wrote:
> The patch which changes test module function visilibility was missing
> some OpenCL symbols. Export also those.
> 
> Signed-off-by: Ismo Puustinen <ismo.puustinen@intel.com>
> ---
>  .../opencv/0001-To-fix-errors-as-following.patch   | 41 ++++++++++++++++++----
>  1 file changed, 34 insertions(+), 7 deletions(-)
> 

no bb change to include this patch?




