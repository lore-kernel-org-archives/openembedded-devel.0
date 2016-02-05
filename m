Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 31CD177303
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Feb 2016 17:05:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga104.fm.intel.com with ESMTP; 05 Feb 2016 09:04:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,401,1449561600"; d="scan'208";a="909327694"
Received: from mbabyjoh-mobl.fi.intel.com ([10.237.72.71])
	by fmsmga002.fm.intel.com with ESMTP; 05 Feb 2016 09:04:39 -0800
Date: Fri, 5 Feb 2016 19:07:16 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160205170716.GA29356@mbabyjoh-mobl.fi.intel.com>
References: <cover.1454638380.git.jackie.huang@windriver.com>
MIME-Version: 1.0
In-Reply-To: <cover.1454638380.git.jackie.huang@windriver.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: Re: [meta-java][PATCH 0/5] Fix several license issues
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
X-List-Received-Date: Fri, 05 Feb 2016 17:05:08 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Feb 05, 2016 at 10:16:56AM +0800, jackie.huang@windriver.com wrote:
> From: Jackie Huang <jackie.huang@windriver.com>
> 
> Fixed the following license issues:
> WARNING: jikes-native: No generic license file exists for: IBM in any provider
> WARNING: cup-native: No generic license file exists for: CUP in any provider
> WARNING: jacl-native: No generic license file exists for: JACL in any provider
> WARNING: jlex-native: No generic license file exists for: JLEX in any provider
> WARNING: classpath: No generic license file exists for: Classpath in any provider
> 
> --
> The following changes since commit b7fe60a8e23664b3c637fa913ccdcfd0c122487e:
> 
>   cacao: remove invalid configure options (2016-01-29 11:37:51 +0200)
> 
> are available in the git repository at:
> 
>   git://git.pokylinux.org/poky-contrib.git jhuang0/d_java-licenses_160205-0
>   http://git.pokylinux.org/cgit.cgi//log/?h=jhuang0/d_java-licenses_160205-0
> 
> Jackie Huang (5):
>   jikes: fix the license name
>   cup: add the license file
>   jacl: fix license and add license files
>   jlex: fix the license and add JLEX license file
>   classpath: fix the license
> 
>  licenses/AMD                         | 50 ++++++++++++++++++++++
>  licenses/CDS                         | 83 ++++++++++++++++++++++++++++++++++++
>  licenses/CUP                         | 20 +++++++++
>  licenses/JLEX                        | 19 +++++++++
>  licenses/SUN                         | 31 ++++++++++++++
>  recipes-core/classpath/classpath.inc |  2 +-
>  recipes-core/jacl/jacl_1.4.1.bb      |  5 ++-
>  recipes-core/jikes/jikes_1.22.bb     |  2 +-
>  recipes-core/jlex/jlex_1.2.6.bb      |  4 +-
>  9 files changed, 209 insertions(+), 7 deletions(-)
>  create mode 100644 licenses/AMD
>  create mode 100644 licenses/CDS
>  create mode 100644 licenses/CUP
>  create mode 100644 licenses/JLEX
>  create mode 100644 licenses/SUN
>
Pushed these changes to the repo. Thank you!

Best Regards,
Maxin

