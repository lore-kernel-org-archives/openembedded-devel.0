Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F1033601D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:20:20 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 18 Nov 2016 04:20:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,509,1473145200"; d="scan'208";a="32906839"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 18 Nov 2016 04:20:21 -0800
To: openembedded-devel@lists.openembedded.org
References: <20161118093659.9117-1-thilo.cestonaro@ts.fujitsu.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <abe2b6f7-0ca3-a569-a2ec-4381d9806d12@linux.intel.com>
Date: Fri, 18 Nov 2016 14:17:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Icedove/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161118093659.9117-1-thilo.cestonaro@ts.fujitsu.com>
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
X-List-Received-Date: Fri, 18 Nov 2016 12:20:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 11/18/2016 11:36 AM, Thilo Cestonaro wrote:
>  .../fix-missing-unistd.h-include.patch             | 39 ++++++++++++++++++++++
>  .../remove-CXX_FOR_BUILD-stuff.patch               | 32 ++++++++++++++++++
>  meta-oe/recipes-core/dbus/libdbus-c++_0.9.0.bb     | 24 +++++++++++++

Upstream-Status is missing in both patches. You can probably say 
"Inappropriate [upstream is dead]".

Alex


