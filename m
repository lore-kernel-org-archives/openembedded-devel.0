Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 15261607BB
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 May 2015 12:55:34 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 21 May 2015 05:55:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="574830605"
Received: from linux-8hqz.fi.intel.com (HELO linux-8hqz.site) ([10.237.68.142])
	by orsmga003.jf.intel.com with ESMTP; 21 May 2015 05:55:34 -0700
Message-ID: <555DD5E9.4040403@linux.intel.com>
Date: Thu, 21 May 2015 15:56:09 +0300
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <555B59D4.80304@linux.intel.com>	<555B9872.50301@gmail.com>	<CAJTo0Lbn8OnaONPtHSm+cxOwQBgefJyAR+yPP1Q2ubmudUAMCA@mail.gmail.com>	<555CA7FF.4050702@linux.intel.com>
	<555CC1EE.7090501@gmail.com>
In-Reply-To: <555CC1EE.7090501@gmail.com>
Subject: Re: [meta-ruby] proposal: moving ruby to oe-core
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
X-List-Received-Date: Thu, 21 May 2015 12:55:37 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 05/20/2015 08:18 PM, akuster808 wrote:
> I have some ruby class changes but I will wait for this transition to 
> complete.

I didn't copy the class to oe-core, because it's not needed for building 
webkit. I copied only the recipe for the ruby runtime. Is that ok?

Alex

