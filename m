Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DEB896E5FC
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 May 2018 09:05:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2018 02:05:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,390,1520924400"; d="scan'208";a="55664775"
Received: from unknown (HELO [10.255.138.168]) ([10.255.138.168])
	by fmsmga001.fm.intel.com with ESMTP; 16 May 2018 02:05:31 -0700
To: Trevor Woerner <twoerner@gmail.com>, akuster808 <akuster808@gmail.com>
References: <20180510004908.26947-1-twoerner@gmail.com>
	<2d40764a-ff2e-06c1-898b-1f4f99fbda29@gmail.com>
	<CAHUNapT0E0S-7Dv51hcfkYbr0kBCq8RHTrkhucJzHtmkTfdDzg@mail.gmail.com>
From: Anuj Mittal <anuj.mittal@intel.com>
Message-ID: <b629ed74-5025-a418-ff68-8b8904fa90af@intel.com>
Date: Wed, 16 May 2018 17:05:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAHUNapT0E0S-7Dv51hcfkYbr0kBCq8RHTrkhucJzHtmkTfdDzg@mail.gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-multimedia][PATCH v2] openh264: switch away from github archive
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
X-List-Received-Date: Wed, 16 May 2018 09:05:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 05/16/2018 02:31 PM, Trevor Woerner wrote:
> The existing recipe has provisions for i386. If I understand correctly,
> qemux86 is i586 (?), and meta-intel's intel-core2-32 is i686 (?). Do I
> duplicate the i386 provisions for i586 and i686? Is there an easier way to
> specify all 32-bit IA systems? 

Does it work if you use _x86 instead of _i386?

Thanks,
Anuj

