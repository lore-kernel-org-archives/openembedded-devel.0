Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B7AF262133
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 06:59:43 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Oct 2017 23:59:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,473,1500966000"; d="scan'208";a="1178048518"
Received: from imakwana-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.142.79])
	by orsmga001.jf.intel.com with ESMTP; 02 Oct 2017 23:59:40 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 03 Oct 2017 19:59:36 +1300
Message-ID: <2561400.H1CvI5UtaZ@peggleto-mobl.ger.corp.intel.com>
Organization: Intel Corporation
In-Reply-To: <5286c04f07048d6547bc53ed6e4745905b4061d6.1506995850.git.paul.eggleton@linux.intel.com>
References: <cover.1506995850.git.paul.eggleton@linux.intel.com>
	<5286c04f07048d6547bc53ed6e4745905b4061d6.1506995850.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/1] dnsmasq: upgrade to 2.78
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
X-List-Received-Date: Tue, 03 Oct 2017 06:59:43 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Tuesday, 3 October 2017 2:58:03 PM NZDT Paul Eggleton wrote:
> This update fixes a number of bugs including the following
> vulnerabilities:
> 
>   CVE-2017-13704
>   CVE-2017-14491
>   CVE-2017-14492
>   CVE-2017-14493
>   CVE-2017-14494
>   CVE-2017-14495
>   CVE-2017-14496
> 
> Further details can be found in the changelog here:
> 
>   http://www.thekelleys.org.uk/dnsmasq/CHANGELOG
> 
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Oops, clearly I messed up the layer prefix, should have been meta-networking. 
Sorry about that.

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

