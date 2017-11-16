Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 9CF3B78726
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 Nov 2017 15:40:48 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 07:40:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,404,1505804400"; 
   d="scan'208";a="5744557"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 16 Nov 2017 07:40:48 -0800
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
References: <20171115141502.21516-1-ricardo.ribalda@gmail.com>
	<4f5c0b05-f8a5-d542-7a20-c40dd5100ae6@linux.intel.com>
	<CAPybu_3CD3bRmYu97GD2gwOj0oX7xN2_Rkq0F3EfiWToMySJxw@mail.gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <e4e86915-7e8e-5cb3-cc46-f2e9ce94f68b@linux.intel.com>
Date: Thu, 16 Nov 2017 17:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <CAPybu_3CD3bRmYu97GD2gwOj0oX7xN2_Rkq0F3EfiWToMySJxw@mail.gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] meson: update meson to 0.43.0
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
X-List-Received-Date: Thu, 16 Nov 2017 15:40:48 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/16/2017 05:37 PM, Ricardo Ribalda Delgado wrote:

>>>
>>> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
>>
>>
>> Meson is being moved to oe-core; can you please check the patches posted to
>> oe-core list?
> 
> Do you mean review the patches on oe-core , or port my patches to oe-core?
> 

Check if any of your changes need to be rebased on top of my oe-core 
patchset, and if so, send the rebased patches there. And generally test 
my patchset.

Alex

