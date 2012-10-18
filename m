Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1TOnsw-0003ga-53
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 13:03:30 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 18 Oct 2012 03:50:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,606,1344236400"; d="scan'208";a="229171867"
Received: from unknown (HELO helios.localnet) ([10.252.122.102])
	by orsmga002.jf.intel.com with ESMTP; 18 Oct 2012 03:50:08 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Jack Mitchell <ml@communistcode.co.uk>
Date: Thu, 18 Oct 2012 11:50:07 +0100
Message-ID: <2148345.1cljnmljF3@helios>
Organization: Intel Corporation
User-Agent: KMail/4.9.2 (Linux/3.2.0-32-generic-pae; KDE/4.9.2; i686; ; )
In-Reply-To: <1350305104-4418-1-git-send-email-ml@communistcode.co.uk>
References: <1350305104-4418-1-git-send-email-ml@communistcode.co.uk>
MIME-Version: 1.0
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH v2] hiawatha: add initial 8.5 recipe and associated files
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Oct 2012 11:03:30 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Jack,

On Monday 15 October 2012 13:45:04 Jack Mitchell wrote:
> From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
> 
> v1:
> - hiawatha: add initial 8.5 recipe and associated files
> 
> v2:
> - update hiawatha init file with LSB headers
> - use sed to put in correct sbin path
> ---
>  .../recipes-httpd/hiawatha/files/hiawatha-init     | 44
> +++++++++++++++++++++ .../recipes-httpd/hiawatha/hiawatha_8.5.bb         |
> 45 ++++++++++++++++++++++ 2 files changed, 89 insertions(+)
>  create mode 100644
> meta-webserver/recipes-httpd/hiawatha/files/hiawatha-init create mode
> 100644 meta-webserver/recipes-httpd/hiawatha/hiawatha_8.5.bb

I was all set to apply this and then I noticed the patch is missing signed-off-
by. Sorry to be a pain but could you resend with Signed-off-by added and also 
move any revision comments underneath the -- line so they don't show up in the 
commit message?

Thanks,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


