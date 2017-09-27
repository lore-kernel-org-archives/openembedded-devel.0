Return-Path: <guy@guy-morand.ch>
Received: from smtp-sh2.infomaniak.ch (smtp-sh2.infomaniak.ch [128.65.195.6])
	by mail.openembedded.org (Postfix) with ESMTP id E3F7960720
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Sep 2017 06:39:40 +0000 (UTC)
Received: from smtp6.infomaniak.ch (smtp6.infomaniak.ch [83.166.132.19])
	by smtp-sh.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8R6dTC8015502
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 27 Sep 2017 08:39:35 +0200
Received: from [192.168.13.135] ([62.192.30.6]) (authenticated bits=0)
	by smtp6.infomaniak.ch (8.14.5/8.14.5) with ESMTP id v8R6dPIV046276
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Wed, 27 Sep 2017 08:39:25 +0200
To: Tim Orling <timothy.t.orling@linux.intel.com>
References: <1506075891-4205-1-git-send-email-guy@guy-morand.ch>
	<CADNbA1rjSSNANYovFMQEAW3bWHbc3Ey4JtuCUPWMrZa9--MR8w@mail.gmail.com>
	<6d06fafc-14cc-f8b1-1d73-f83b6f6436f7@guy-morand.ch>
	<48605F2E-2616-4585-9503-3C953AE0A518@linux.intel.com>
From: Guy Morand <guy@guy-morand.ch>
Message-ID: <f4113b49-34d4-b3d9-13e6-176b2adff30c@guy-morand.ch>
Date: Wed, 27 Sep 2017 08:39:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <48605F2E-2616-4585-9503-3C953AE0A518@linux.intel.com>
X-Antivirus: Dr.Web (R) for Unix mail servers drweb plugin ver.6.0.2.8
X-Antivirus-Code: 0x100000
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH 1/3] Add python3 matplotlib
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
X-List-Received-Date: Wed, 27 Sep 2017 06:39:41 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Tim,


Ok good about matplotlib, this one is not an easy beast :p! Have you 
also planned to integrate pandas? Otherwise I will happily just send a 
better patch just for this one!


Best regards,


Guy


On 09/27/2017 07:16 AM, Tim Orling wrote:
> FYI, I have a related series in progress, but I can and will happily rebase on top of yours. My series is much more complicated for reasons that I will send to the ML when I get a couple more dependent packages being picked up by matplotlib properly. It will be worth the wait :)
>
> —Tim
>
>> On Sep 25, 2017, at 11:31 PM, Guy Morand <guy@guy-morand.ch> wrote:
>>
>> Derek,
>>
>> Arrgg I just copied the recipe from my meta-layer that has a different structure! Sorry for wasting your time with my worthless patches, I'll try better!
>>
>> Thanks anyway for your feedbacks!
>>
>> Best regards,
>>
>> Guy
>>
>> On 09/26/2017 12:40 AM, Derek Straka wrote:
>>> Also, could you incorporate the changes into the existing python-* recipes so they both use the .inc files.  It makes my automated updates easier.  Thanks!
>>>
>


