Return-Path: <ross.burton@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 137D46011C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Dec 2019 19:00:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Dec 2019 11:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,302,1571727600"; d="scan'208";a="225639787"
Received: from pozo-mobl.ger.corp.intel.com (HELO blackadder.local)
	([10.252.33.212])
	by orsmga002.jf.intel.com with ESMTP; 11 Dec 2019 11:00:27 -0800
To: openembedded-devel@lists.openembedded.org
References: <CANSQD5+CcEbaHxdfR8cjqdc6maXhrCgXy3eXrGD0dMgpiM_0LQ@mail.gmail.com>
	<7e5b400c-9c07-ff0d-df4b-9ca0329bfdbc@intel.com>
	<CANSQD5+e24bohovGjVgagiFrizqu2sj0SwzJWn+17tUJCthO_Q@mail.gmail.com>
	<CAHtQpK4zNtju4Own7yx+bTZsmyycW2dXoB0JOA=566X=h89wMw@mail.gmail.com>
	<20191210205704.wkwzy2kpgq2nqam2@vctlabs.com>
	<CANSQD5Ju4ZN7gW7GGm6ELdG63LQDAe-gbn1aFXK4oO1Ta5NhZQ@mail.gmail.com>
	<CAMKF1sqnj-iczhgfww+J6=3pWKf6KLn4UWkuSz9cAhQCSqwmcg@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <721294ef-b4ea-ab49-19d0-82bfc8fff9b8@intel.com>
Date: Wed, 11 Dec 2019 19:00:26 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:60.0)
	Gecko/20100101 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqnj-iczhgfww+J6=3pWKf6KLn4UWkuSz9cAhQCSqwmcg@mail.gmail.com>
Subject: Re: Building Linux Error
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
X-List-Received-Date: Wed, 11 Dec 2019 19:00:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 10/12/2019 23:50, Khem Raj wrote:
> On Tue, Dec 10, 2019 at 12:57 PM Kamel Ghalgaoui
> <kamelghalgaoui7@gmail.com> wrote:
>>
>> For information, I my kernel version is 5.3.11 and I have tar version: 1.26
>> $ which tar
>> /usr/local/bin/tar
>>
> 
> Interesting. I wonder if we should poison /usr/local for hosttools.

Probably not a great idea, as people may be installing stuff in 
/usr/local *because* their /usr is old.

Ross


