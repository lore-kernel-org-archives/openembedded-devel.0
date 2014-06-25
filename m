Return-Path: <philip@balister.org>
Received: from starfish.geekisp.com (starfish.geekisp.com [216.168.135.166])
	by mail.openembedded.org (Postfix) with SMTP id EB1D6601A8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 25 Jun 2014 18:38:17 +0000 (UTC)
Received: (qmail 10816 invoked by uid 1003); 25 Jun 2014 18:38:18 -0000
Received: from unknown (HELO ?10.16.32.86?) (philip@opensdr.com@64.186.172.226)
	by mail.geekisp.com with (DHE-RSA-AES128-SHA encrypted) SMTP;
	25 Jun 2014 18:38:18 -0000
Message-ID: <53AB1718.7000608@balister.org>
Date: Wed, 25 Jun 2014 11:38:16 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <53AA0672.7070606@balister.org>
	<2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <2894594.Bns9GHPWX5@peggleto-mobl5.ger.corp.intel.com>
X-Enigmail-Version: 1.6
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: State of the art for creating an image that you can dd to an SD card
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Jun 2014 18:38:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 06/25/2014 03:07 AM, Paul Eggleton wrote:
> On Tuesday 24 June 2014 16:14:58 Philip Balister wrote:
>> What's the best available solution for creating an image you can dd to
>> an SD card? It seems like this wheel has been invented several times and
>> I am wondering if people are converging on one approach.
>>
>> Bonus points for resizing the linux partition.
>>
>> How are people doing this today?
> 
> I think wic has seen some uptake and enhancement since its introduction a 
> couple of releases ago. It has certainly worked for me in writing SD cards for 
> Galileo. We seem to be a bit short on documentation for it though...

Googling for "wic sd" doesn't help. I've seen some commits, so I'll take
a look in the meta data.

Philip

> 
> Cheers,
> Paul
> 

