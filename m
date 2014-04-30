Return-Path: <paul.eggleton@linux.intel.com>
X-Greylist: delayed 685 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 30 Apr 2014 17:39:05 UTC
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 963A165D6A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Apr 2014 17:39:04 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 30 Apr 2014 10:27:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,959,1389772800"; d="scan'208";a="523911209"
Received: from cgwithan-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.122.50])
	by fmsmga001.fm.intel.com with ESMTP; 30 Apr 2014 10:27:33 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 30 Apr 2014 18:27:32 +0100
Message-ID: <2436764.vQCnP2Aayr@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.12.5 (Linux/3.13.10-200.fc20.x86_64; KDE/4.12.4; x86_64; ;
	)
In-Reply-To: <20140430160626.GN2486@jama>
References: <20140430160626.GN2486@jama>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [OE-core] State of bitbake world, Failed tasks 2014-04-30
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
X-List-Received-Date: Wed, 30 Apr 2014 17:39:06 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 30 April 2014 18:06:26 Martin Jansa wrote:
> > Khem sent couple of patches for B!=S issues, bit thanks to him!
> > 
> > I have local patch to set B=S/autotools-brokensep for remaining failing
> > recipes, but I'll wait a bit more for people to send fixes.
> 
> This patch was included in this build, that's why there is only few
> issues, next build will include oe-core/daisy to help with meta-oe/daisy
> stabilization.

I have a fix for modphp coming, I just need to test it to make sure I didn't 
break anything. Should have it sent out early tomorrow. I might be able to 
take a look at xdebug as well.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

