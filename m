Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BD6E17198A
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Nov 2016 15:53:39 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 16 Nov 2016 07:53:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,500,1473145200"; d="scan'208";a="31584884"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga004.jf.intel.com with ESMTP; 16 Nov 2016 07:53:40 -0800
To: openembedded-devel@lists.openembedded.org
References: <20161116102307.7678-1-thilo.cestonaro@ts.fujitsu.com>
	<e098613f-6906-c91c-41cf-721df6a03f49@linux.intel.com>
	<1479310757.4732.17.camel@ts.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <d64b7bf9-8bfc-3d40-b28b-95ed62a2379c@linux.intel.com>
Date: Wed, 16 Nov 2016 17:53:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <1479310757.4732.17.camel@ts.fujitsu.com>
Subject: Re: [meta-oe][PATCH] libdbus-c++: added recipe for it
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
X-List-Received-Date: Wed, 16 Nov 2016 15:53:39 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/16/2016 05:42 PM, thilo.cestonaro@ts.fujitsu.com wrote:
> the whole mail is the patch. I send it via git send-email and there
> is the signed off line in it. But I can attach it and send it
> manually with my mail program if the git send-email thing is no
> good.

The patch that you are sending adds three files: one recipe and two 
patches. It is those two patches that you need to fix. Their filenames 
are fix-missing-unistd.h-include.patch and 
remove-CXX_FOR_BUILD-stuff.patch. Is this clear?

Alex



