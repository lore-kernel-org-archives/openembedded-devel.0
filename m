Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id BA46D78323
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Nov 2017 08:56:39 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Nov 2017 01:56:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,337,1505804400"; d="scan'208";a="1033044736"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 03 Nov 2017 01:56:37 -0700
To: Liwei Song <liwei.song@windriver.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
References: <1509677735-140167-1-git-send-email-liwei.song@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <6b5e2d9d-6aea-c1d4-54b9-6c02c7443d85@linux.intel.com>
Date: Fri, 3 Nov 2017 10:56:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1509677735-140167-1-git-send-email-liwei.song@windriver.com>
Subject: Re: [oe-core][PATCH] kexec-tools: fix Unknown type (Reserved) and ELF core parse error when run kexec
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
X-List-Received-Date: Fri, 03 Nov 2017 08:56:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/03/2017 04:55 AM, Liwei Song wrote:
> When run kexec on NUC7i7BNH/NUC7i5BNH, got the following error:
> 
> "Please report this as bug. Using RANGE_RESERVED now"
> "ELF core (kcore) parse failed"
> 
> Apply three upstream patches to fix it.

This patch should go to oe-core list, and the issue can probably be 
resolved with an update to 2.0.15.


Alex

