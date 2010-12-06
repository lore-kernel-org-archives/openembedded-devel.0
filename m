Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <saul.wold@intel.com>) id 1PPjuG-0003Oy-7K
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 23:51:41 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 06 Dec 2010 14:50:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.59,307,1288594800"; d="scan'208";a="684500224"
Received: from unknown (HELO [10.255.13.6]) ([10.255.13.6])
	by orsmga001.jf.intel.com with ESMTP; 06 Dec 2010 14:50:11 -0800
Message-ID: <4CFD68A2.20408@intel.com>
Date: Mon, 06 Dec 2010 14:50:10 -0800
From: Saul Wold <saul.wold@intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100621 Fedora/3.0.5-1.fc13 Lightning/1.0b2pre
	Thunderbird/3.0.5
MIME-Version: 1.0
To: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
In-Reply-To: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
X-SA-Exim-Connect-IP: 134.134.136.20
X-SA-Exim-Mail-From: saul.wold@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
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
X-List-Received-Date: Mon, 06 Dec 2010 22:51:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
> I was checking libcdaudio for LICENSE info.
> recipe says GPL
> COPYING file is the GPLv2 one
> README file says:
>
> libcdaudio is distributed under the GNU Library General Public
> License, included in this package under the top level source directory
> in the file COPYING
>
> C files also mention LGPL. but say v2 or later
>
> What to do with this in the LICENSE field? LGPLv2+ ?
>
This seems reasonable, you should also include the header chunk in the 
LIC_FILES_CHKSUM, you can specify start and end lines for the checksum.


Sau!

> Frans
> _______________________________________________
> poky mailing list
> poky@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/poky
>



