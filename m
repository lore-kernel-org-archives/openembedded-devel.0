Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CFA19786DA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Nov 2017 13:39:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 05:39:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="8668998"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2017 05:39:16 -0800
To: Martin Jansa <martin.jansa@gmail.com>
References: <20171122163030.10224-1-alexander.kanavin@linux.intel.com>
	<20171122174718.GA4166@jama>
	<ecdbb200-afed-2a2d-f390-3de7d4122721@linux.intel.com>
	<CA+chaQf6LKVf5vRBSAmUxue2wb253o2bHs5XjN2CoL2t0Ox4MQ@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <5f24aa16-b33b-6e44-c23c-aefbbc8c7117@linux.intel.com>
Date: Thu, 23 Nov 2017 15:39:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CA+chaQf6LKVf5vRBSAmUxue2wb253o2bHs5XjN2CoL2t0Ox4MQ@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Thu, 23 Nov 2017 13:39:17 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/23/2017 02:06 PM, Martin Jansa wrote:
> https://www.openembedded.org/wiki/Styleguide#Format_Guidelines

Alright. I resent the patch, as I don't want to start a style war, but 
(as discussed previously) I will resist any attempts to enforce 
indentation in oe-core. We need to prioritize what we spend our time on 
ruthlessly, considering the project is constantly under-staffed.

Alex

