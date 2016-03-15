Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 41D456FFED
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2016 14:13:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 15 Mar 2016 07:10:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,339,1455004800"; d="scan'208";a="764559087"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 15 Mar 2016 07:10:56 -0700
To: openembedded-devel@lists.openembedded.org
References: <cover.1457535831.git.alexander.kanavin@linux.intel.com>
	<41b4e4a82cb652470eebe853bd1b6076cee59301.1457535831.git.alexander.kanavin@linux.intel.com>
	<20160310142507.GI2573@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <56E8170C.2010503@linux.intel.com>
Date: Tue, 15 Mar 2016 16:07:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Icedove/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160310142507.GI2573@jama>
Subject: Re: [PATCH 14/38] python-gst: remove the 0.10 recipe
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
X-List-Received-Date: Tue, 15 Mar 2016 14:13:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 03/10/2016 04:25 PM, Martin Jansa wrote:
> On Wed, Mar 09, 2016 at 05:05:30PM +0200, Alexander Kanavin wrote:
>> It depends on pygobject 2.x which has been update to 3.x in oe-core
>
> This wont make freesmartphone people happly (if there still are some)

Martin, I seriously think that you should implement a policy and process 
for deprecating and then removing obsolete and unused recipes from meta-oe.

We should be spending our time on solving issues with current software, 
not on providing life support to things that qualify as 'retro computing'.


Alex


