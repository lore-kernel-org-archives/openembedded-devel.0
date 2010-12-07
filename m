Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <saul.wold@intel.com>) id 1PPnT1-0007XT-A8
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Dec 2010 03:39:48 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2010 18:38:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.59,308,1288594800"; d="scan'208";a="865240789"
Received: from unknown (HELO [10.255.13.6]) ([10.255.13.6])
	by fmsmga001.fm.intel.com with ESMTP; 06 Dec 2010 18:38:16 -0800
Message-ID: <4CFD9E17.5070209@intel.com>
Date: Mon, 06 Dec 2010 18:38:15 -0800
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>	<4CFD68A2.20408@intel.com>
	<20101206225236.GD29253@denix.org>
In-Reply-To: <20101206225236.GD29253@denix.org>
X-SA-Exim-Connect-IP: 192.55.52.93
X-SA-Exim-Mail-From: saul.wold@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [poky] libcdaudio license issue
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Dec 2010 02:39:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2010 02:52 PM, Denys Dmytriyenko wrote:
> On Mon, Dec 06, 2010 at 02:50:10PM -0800, Saul Wold wrote:
>> On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
>>> I was checking libcdaudio for LICENSE info.
>>> recipe says GPL
>>> COPYING file is the GPLv2 one
>>> README file says:
>>>
>>> libcdaudio is distributed under the GNU Library General Public
>>> License, included in this package under the top level source directory
>>> in the file COPYING
>>>
>>> C files also mention LGPL. but say v2 or later
>>>
>>> What to do with this in the LICENSE field? LGPLv2+ ?
>>>
>> This seems reasonable, you should also include the header chunk in the
>> LIC_FILES_CHKSUM, you can specify start and end lines for the checksum.
>
> Saul,
>
> We don't have this feature in OpenEmbedded yet... But it would be nice to port
> it from Poky though! :)
>
Denys, sorry I saw this via my poky email and did not notice it was OE 
also, I will what what I cross post next time!

Glad to hear that you like the idea!  We will have all Poky recipes 
checksummed this week!

Sau!



