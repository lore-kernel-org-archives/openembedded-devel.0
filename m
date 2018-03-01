Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 53B7678816
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 11:48:49 +0000 (UTC)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 03:48:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="208001712"
Received: from mbabyjoh-desk.fi.intel.com (HELO
	mbabyjoh-desk.ger.corp.intel.com) ([10.237.72.84])
	by fmsmga005.fm.intel.com with ESMTP; 01 Mar 2018 03:48:49 -0800
Date: Thu, 1 Mar 2018 13:51:53 +0200
From: "Maxin B. John" <maxin.john@intel.com>
To: nick83ola <nick83ola@gmail.com>
Message-ID: <20180301115152.GB14042@mbabyjoh-desk.ger.corp.intel.com>
References: <CABPh3UNxJfqzMtZKNNtEAVzHBm--=fA7mxH5szKX+jm=Y2_AwQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABPh3UNxJfqzMtZKNNtEAVzHBm--=fA7mxH5szKX+jm=Y2_AwQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: BUG: openjre-8 won't compile on qemux86/ latest meta-java repo
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
X-List-Received-Date: Thu, 01 Mar 2018 11:48:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Wed, Feb 28, 2018 at 12:58:09PM +0000, nick83ola wrote:
> $ bitbake openjre-8
<snip> 
> (virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/classpathx/gnujaf_1.1.1.bb:do_compile)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 956 tasks of which 946 didn't need to be
> rerun and 2 failed.
> 
> Summary: 2 tasks failed:
> 
> virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/xml-commons/jaxp1.3_1.4.01.bb:
> do_compile
> 
> virtual:native:/home/nicklunghi/src/yocto-openhab/sources/meta-java/recipes-core/classpathx/gnujaf_1.1.1.bb:
> do_compile

Please share details about the build machine and "PREFERRED_PROVIDER_virtual/java*" settings in your local.conf.
(fired an openjre-8 for qemux86 build on a fedora 22 and it was successful with meta-java master branch)

Best Regards,
Maxin

