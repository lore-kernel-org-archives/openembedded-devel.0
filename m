Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 600 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 17:38:56 UTC
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 13C4C65D52
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:38:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Apr 2014 10:28:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="426019337"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by azsmga001.ch.intel.com with ESMTP; 30 Apr 2014 10:28:55 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Javier Viguera <javier.viguera@digi.com>
Date: Wed, 30 Apr 2014 18:28:54 +0100
Message-ID: <1474887.TWMWxXuYEb@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <53612125.8030702@digi.com>
References: <53612125.8030702@digi.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver] cherokee webserver SRC_URI broken again
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
X-List-Received-Date: Wed, 30 Apr 2014 17:38:57 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi Javier,

On Wednesday 30 April 2014 18:13:25 Javier Viguera wrote:
> Seems that cherokee webserver is missing again. The mirror that was set
> last time to download the package from is not accessible anymore [1].
> 
> On the mirrors page [2] there are some more; most of them are also down
> but there is still some of them that contain the package.
> 
> So at this point I think it's better to just put the package in one of
> the yoctoproject mirrors. If you think that we should use one of the
> still-working-mirrors let me know and I'll cook a patch for it.

I can't remember from our last discussion, did anyone talk to upstream about 
the pain they are inflicting on some of their users with the lack of proper 
source archives?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

