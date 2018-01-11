Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B576D77DB5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Jan 2018 14:46:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jan 2018 06:46:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,344,1511856000"; 
   d="scan'208";a="9979160"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 11 Jan 2018 06:46:04 -0800
To: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@pr.hu>,
	openembedded-devel@lists.openembedded.org
References: <9f004ada-4627-0a82-cb3f-7ee9e38791b7@pr.hu>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <86ea3002-07b8-aa1a-d1dd-78a4a6dd906c@linux.intel.com>
Date: Thu, 11 Jan 2018 16:46:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <9f004ada-4627-0a82-cb3f-7ee9e38791b7@pr.hu>
Subject: Re: RFC: Record PE for shlib dependencies
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
X-List-Received-Date: Thu, 11 Jan 2018 14:46:04 -0000
Content-Type: text/plain; charset=iso-8859-2; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01/11/2018 04:07 PM, Böszörményi Zoltán wrote:

> Since my itch was too big now, I have proverbially scratched it.
> I have created a PR against Rocko here:
> https://github.com/openembedded/openembedded-core/pull/28/files
> 
> Please comment whether it's the right approach.

Looks okay, but:

Please rebase this against oe-core master, and submit to the oe-core 
mailing list.

Alex

