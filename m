Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 967576BCA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Nov 2018 13:47:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Nov 2018 05:47:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,290,1539673200"; d="scan'208";a="278233622"
Received: from unknown (HELO rkubodac-desk.ger.corp.intel.com)
	([10.252.37.242])
	by orsmga005.jf.intel.com with ESMTP; 28 Nov 2018 05:47:39 -0800
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: akuster808 <akuster808@gmail.com>
In-Reply-To: <b443dc91-db87-f835-7a33-98cd9ccf2bea@gmail.com> (akuster's
	message of "Tue, 27 Nov 2018 13:05:04 -0700")
Organization: Intel Corporation
References: <20181120154041.9420-1-raphael.kubo.da.costa@intel.com>
	<CAMKF1soR+4fXBd1q0bLCndQjROO-zTnvcQSs80TmDP=KKZcMuQ@mail.gmail.com>
	<b443dc91-db87-f835-7a33-98cd9ccf2bea@gmail.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
Date: Wed, 28 Nov 2018 14:47:38 +0100
Message-ID: <871s75joud.fsf@rkubodac-desk.ger.corp.intel.com>
MIME-Version: 1.0
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][sumo][PATCH] nodejs: Enable system ICU support
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
X-List-Received-Date: Wed, 28 Nov 2018 13:47:39 -0000
Content-Type: text/plain

akuster808 <akuster808@gmail.com> writes:

> On 11/26/18 10:45 AM, Khem Raj wrote:
>> Armin
>>
>> This is ok for rocko
>> On Tue, Nov 20, 2018 at 7:40 AM Raphael Kubo da Costa
>> <raphael.kubo.da.costa@intel.com> wrote:
>>> From: Khem Raj <raj.khem@gmail.com>
>>>
>>> Latest Chromium needs it during build
>
> Is this keeping chromium from building.

Yes.

