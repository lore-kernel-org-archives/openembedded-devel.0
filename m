Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 5C7306E671
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  9 Mar 2018 10:22:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Mar 2018 02:22:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,444,1515484800"; d="scan'208";a="23802533"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 09 Mar 2018 02:22:43 -0800
To: Zhang Xiao <xiao.zhang@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <20180309074650.5997-1-xiao.zhang@windriver.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <26c24905-f579-2018-d866-8b55cf1ba8a7@linux.intel.com>
Date: Fri, 9 Mar 2018 12:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180309074650.5997-1-xiao.zhang@windriver.com>
Subject: Re: [PATCH 1/3] valgrind: Fix multilib header conflict - valgrind/config.h
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
X-List-Received-Date: Fri, 09 Mar 2018 10:22:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/09/2018 09:46 AM, Zhang Xiao wrote:
> Header file conflict between 32-bit and 64-bit versions.

I believe these patches should go to oe-core list.

Alex

