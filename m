Return-Path: <gcho-openembedded-devel@m.gmane.org>
Received: from blaine.gmane.org (unknown [195.159.176.226])
	by mail.openembedded.org (Postfix) with ESMTP id 0E34C71AC0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Nov 2016 08:06:09 +0000 (UTC)
Received: from list by blaine.gmane.org with local (Exim 4.84_2)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1cBdQT-0007w8-23 for openembedded-devel@lists.openembedded.org;
	Tue, 29 Nov 2016 09:06:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 29 Nov 2016 09:06:00 +0100
Message-ID: <o1jct4$pvp$1@blaine.gmane.org>
References: <20161128225759.9756-1-raj.khem@gmail.com>
	<CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@blaine.gmane.org
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.4.0
In-Reply-To: <CAJTo0LZ+2+MhZ4TepH1dDzC3LyG7gz70TNEzoDjXgaBTjvHOsg@mail.gmail.com>
Subject: Re: [meta-oe][PATCH] libva: Import from meta-intel and update to 1.7.3
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
X-List-Received-Date: Tue, 29 Nov 2016 08:06:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Op 29-11-16 om 01:35 schreef Burton, Ross:
> On 28 November 2016 at 22:57, Khem Raj <raj.khem@gmail.com> wrote:
> 
>> This recipe is used by intel and amd BSP layers
>> additional copies are also there see
>> https://layers.openembedded.org/layerindex/branch/master/recipes/?q=libva
>>
> 
> Or maybe it should be in oe-core then?

If libva goes in, can we get libva-intel-driver in as well? Those go
hand-in-glove currently.

regards,

Koen



