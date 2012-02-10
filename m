Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1Rvvqz-0004ye-KQ
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 20:09:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2012 11:00:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="106211696"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 10 Feb 2012 11:00:42 -0800
Message-ID: <4F35695A.5020908@linux.intel.com>
Date: Fri, 10 Feb 2012 11:00:42 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAPw5SVERSLNnu8Fm6SOn3sYraytVmrR5iGYdOJ8NyQ=MQvreZw@mail.gmail.com>
	<1972877.1IzvdJB4e7@helios> <4F3567E0.8030809@palm.com>
In-Reply-To: <4F3567E0.8030809@palm.com>
Subject: Re: First time user: suggestions
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
X-List-Received-Date: Fri, 10 Feb 2012 19:09:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit



On 10/02/12 10:54, Rich Pixley wrote:
> On 2/10/12 04:40 , Paul Eggleton wrote:
>> Both the Yocto Project and Angstrom have their own source mirrors but
>> they are not enabled by default in OE-Core.
> I'm going to need to do this almost immediately for webos. Can you point
> me to doc on the current mirroring support? Or to the relevant source?
> Or to where that's done for either yocto or angstrom?

A change to enable this went into master recently:
http://git.openembedded.org/openembedded-core/commit/?id=ca8a3422eb96ea431c322532dfd1be9980d4d48c

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


