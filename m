Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC0676FEFA
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  1 Mar 2018 18:52:11 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Mar 2018 10:52:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,408,1515484800"; d="scan'208";a="35206439"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 01 Mar 2018 10:52:11 -0800
To: akuster808 <akuster808@gmail.com>, "Burton, Ross" <ross.burton@intel.com>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <CAJTo0LYxqFFmUA9XcCO3_WO32NB4YLYy7pJK5ivyzPQYY5-hvQ@mail.gmail.com>
	<17c4a7f6-c188-1a8c-2371-74ec67ebfdac@linux.intel.com>
	<1d48c1f1-8b2d-2f8d-ff23-31890aeadbcc@gmail.com>
	<5542c5ec-fbbc-694a-3183-98bc78b12702@linux.intel.com>
	<da663886-ec79-fea4-3b44-7d5f03658945@gmail.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <2f68c3c6-1a26-bafe-9ed2-f35897509dc0@linux.intel.com>
Date: Thu, 1 Mar 2018 20:46:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <da663886-ec79-fea4-3b44-7d5f03658945@gmail.com>
Subject: Re: Splitting meta-oe?
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
X-List-Received-Date: Thu, 01 Mar 2018 18:52:12 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 03/01/2018 08:44 PM, akuster808 wrote:
> 
> These two commits introduced an ABI change.
> 
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=6e4990d8d226e1861a5a2b632cf93bc70feab3af
> http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-4.12/commit/include/linux/random.h?h=standard/base&id=20543a488913755be70f54be52b32f727e8179d8
> 
> This makes linux-kernel_4.12 different than linux 4.12.y.

This should probably be taken to the linux-yocto mailing list?

Alex

