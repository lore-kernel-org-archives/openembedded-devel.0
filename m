Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1SKHde-0003Db-IV
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Apr 2012 01:16:46 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 17 Apr 2012 16:07:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="154881177"
Received: from unknown (HELO helios.localnet) ([10.252.120.85])
	by fmsmga002.fm.intel.com with ESMTP; 17 Apr 2012 16:07:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Ulf Samuelsson <openembedded@emagii.com>
Date: Wed, 18 Apr 2012 00:07:17 +0100
Message-ID: <2900608.HO3vnnHahd@helios>
Organization: Intel Corporation
User-Agent: KMail/4.8.2 (Linux/3.0.0-17-generic-pae; KDE/4.8.2; i686; ; )
In-Reply-To: <4F8DF031.60109@emagii.com>
References: <4F8DF031.60109@emagii.com>
MIME-Version: 1.0
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: RFC: Support for R/W git in bitbake
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
X-List-Received-Date: Tue, 17 Apr 2012 23:16:46 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 18 April 2012 00:35:29 Ulf Samuelsson wrote:
> Today bitbake supports read only git access in recipes.
> For various reasons, I would like to be able to do recipes
> which would check out in a read/write mode.

Could you elaborate on "various reasons"?

Would the new externalsrc bbclass be useful in your case?

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


