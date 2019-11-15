Return-Path: <ross.burton@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 98F8C7FBD7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 19:25:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Nov 2019 11:25:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,309,1569308400"; d="scan'208";a="230553619"
Received: from bpuehrin-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.43.253])
	by fmsmga004.fm.intel.com with ESMTP; 15 Nov 2019 11:25:46 -0800
To: openembedded-devel@lists.openembedded.org
References: <1573752010-26608-1-git-send-email-leon.anavi@konsulko.com>
	<dbae500e-b459-005e-ec2b-5d4f5ef66f18@gmail.com>
	<2feeb01f-2110-e266-3bdb-635c38577c39@mailbox.org>
	<30fccbf16335d228013fb5d59b0ae1cc18c25a38.camel@gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <ea1acf07-73d8-0e08-8979-2e89c6552bbb@intel.com>
Date: Fri, 15 Nov 2019 19:25:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <30fccbf16335d228013fb5d59b0ae1cc18c25a38.camel@gmail.com>
Subject: Re: [meta-oe][PATCH] surf: Add simple web browser
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
X-List-Received-Date: Fri, 15 Nov 2019 19:25:45 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 15/11/2019 17:30, Khem Raj wrote:
> On Fri, 2019-11-15 at 16:09 +0100, Carlos Rafael Giani wrote:
>> meta-browser would be more appropriate.
> 
> I was contemplating that as well. but these layer has more chromium and
> firefox lineage

But it's called meta-browser and not meta-firefox-and-chromium. :)

Ross

