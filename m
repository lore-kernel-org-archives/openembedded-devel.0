Return-Path: <maciej.pijanowski@3mdeb.com>
Received: from 17.mo5.mail-out.ovh.net (17.mo5.mail-out.ovh.net
	[46.105.56.132])
	by mail.openembedded.org (Postfix) with ESMTP id 6943B7D41C
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 13:31:01 +0000 (UTC)
Received: from player762.ha.ovh.net (unknown [10.109.160.251])
	by mo5.mail-out.ovh.net (Postfix) with ESMTP id CF78624884F
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 11 Aug 2019 10:44:01 +0200 (CEST)
Received: from 3mdeb.com (89-66-81-159.dynamic.chello.pl [89.66.81.159])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player762.ha.ovh.net (Postfix) with ESMTPSA id 9787B8C83F0A;
	Sun, 11 Aug 2019 08:43:57 +0000 (UTC)
To: Khem Raj <raj.khem@gmail.com>
References: <20190810212014.23197-1-maciej.pijanowski@3mdeb.com>
	<20190810212014.23197-3-maciej.pijanowski@3mdeb.com>
	<CAMKF1spHtAufpqMCUwnxhZn1yp5yGQk5je_GhjNNYu3FGis5Gg@mail.gmail.com>
From: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <e42a0f62-edc3-636d-38d1-0bb444f11085@3mdeb.com>
Date: Sun, 11 Aug 2019 10:43:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1spHtAufpqMCUwnxhZn1yp5yGQk5je_GhjNNYu3FGis5Gg@mail.gmail.com>
X-Ovh-Tracer-Id: 15371067006607896268
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduvddruddvvddgtdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	piotr.krol@3mdeb.com
Subject: Re: [meta-python][PATCH 3/7] python-engineio: upgrade to 3.9.3
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
X-List-Received-Date: Sun, 11 Aug 2019 13:31:02 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I think I failed to commit sha256/md5 update. Resent v2 of this patch.

On 11.08.2019 09:39, Khem Raj wrote:
> seeing fetch fails
>
> https://errors.yoctoproject.org/Errors/Details/260608/
>
> On Sat, Aug 10, 2019 at 2:39 PM Maciej Pijanowski
> <maciej.pijanowski@3mdeb.com> wrote:
>> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
>> ---
>>   .../python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} | 0
>>   .../{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb}      | 0
>>   2 files changed, 0 insertions(+), 0 deletions(-)
>>   rename meta-python/recipes-devtools/python/{python-engineio_3.5.0.bb => python-engineio_3.9.3.bb} (100%)
>>   rename meta-python/recipes-devtools/python/{python3-engineio_3.5.0.bb => python3-engineio_3.9.3.bb} (100%)
>>
>> diff --git a/meta-python/recipes-devtools/python/python-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python-engineio_3.5.0.bb
>> rename to meta-python/recipes-devtools/python/python-engineio_3.9.3.bb
>> diff --git a/meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb b/meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
>> similarity index 100%
>> rename from meta-python/recipes-devtools/python/python3-engineio_3.5.0.bb
>> rename to meta-python/recipes-devtools/python/python3-engineio_3.9.3.bb
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
Maciej Pijanowski
Embedded Systems Engineer
https://3mdeb.com | @3mdeb_com


