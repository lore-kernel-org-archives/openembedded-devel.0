Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B22A0786D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 09:45:47 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 01:45:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="8605046"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2017 01:45:47 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
	<20171122174718.GA4166@jama>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <ecdbb200-afed-2a2d-f390-3de7d4122721@linux.intel.com>
Date: Thu, 23 Nov 2017 11:46:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171122174718.GA4166@jama>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] neon: add the recipe from oe-core
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
X-List-Received-Date: Thu, 23 Nov 2017 09:45:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/22/2017 07:47 PM, Martin Jansa wrote:
>> +do_compile_append() {
>> +	oe_runmake -C test
> 
> Use 4 spaces for indentation instead of tabs.

Please explain why.

Alex

