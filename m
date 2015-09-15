Return-Path: <mike.looijmans@topic.nl>
Received: from atl4mhob11.myregisteredsite.com
	(atl4mhob11.myregisteredsite.com [209.17.115.49])
	by mail.openembedded.org (Postfix) with ESMTP id 5A7FF75F3A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 12:34:49 +0000 (UTC)
Received: from mailpod.hostingplatform.com ([10.30.71.207])
	by atl4mhob11.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	t8FCYmY4027915 for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Sep 2015 08:34:48 -0400
Received: (qmail 3033 invoked by uid 0); 15 Sep 2015 12:34:48 -0000
X-TCPREMOTEIP: 88.159.208.100
X-Authenticated-UID: mike@milosoftware.com
Received: from unknown (HELO ?192.168.80.121?)
	(mike@milosoftware.com@88.159.208.100)
	by 0 with ESMTPA; 15 Sep 2015 12:34:47 -0000
To: openembedded-devel@lists.openembedded.org
References: <55F7EF3A.7020403@topic.nl>
	<CAJTo0LZQhC+QjAcNxxUuQpUkfWgXc-rVDohQe-sb8Ch1d57R2g@mail.gmail.com>
	<CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: TOPIC
Message-ID: <55F81066.5030903@topic.nl>
Date: Tue, 15 Sep 2015 14:34:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZVtrC-93qCesHSpet689+3vQN=Wc0+N46_H8g4qkFb7A@mail.gmail.com>
Subject: Re: gnome-icon-theme?
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
X-List-Received-Date: Tue, 15 Sep 2015 12:34:50 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-09-15 13:14, Burton, Ross wrote:
> On 15 September 2015 at 12:13, Burton, Ross <ross.burton@intel.com> wrote:
>
>> Yeah this was just removed from oe-core but the addition to meta-oe hasn't
>> happened.  I can send a patch now if there isn't one on the list.
>>
>
> Hm, alternatively,  we make adwaita-icon-theme provide gnome-icon-theme, as
> they're broadly compatible anyway.  Any thoughts?

In that case, you might as well replace the dependencies in the other recipes 
to adwaita-icon-theme directly I guess.



