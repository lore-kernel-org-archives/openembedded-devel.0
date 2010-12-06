Received: from vms173009pub.verizon.net ([206.46.173.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PPjwq-0003Uz-Sp
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 23:54:21 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LD1008SH3JOBPA4@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	06 Dec 2010 16:52:42 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 1964614AF64; Mon,
	06 Dec 2010 17:52:36 -0500 (EST)
Date: Mon, 06 Dec 2010 17:52:36 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101206225236.GD29253@denix.org>
References: <AANLkTi==kWiyOrmeUeUVNeC8FT0B8XxruHA0X4qMaPs_@mail.gmail.com>
	<4CFD68A2.20408@intel.com>
MIME-version: 1.0
In-reply-to: <4CFD68A2.20408@intel.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.9
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: "poky@yoctoproject.org" <poky@yoctoproject.org>
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
X-List-Received-Date: Mon, 06 Dec 2010 22:54:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Mon, Dec 06, 2010 at 02:50:10PM -0800, Saul Wold wrote:
> On 12/06/2010 11:48 AM, Frans Meulenbroeks wrote:
>> I was checking libcdaudio for LICENSE info.
>> recipe says GPL
>> COPYING file is the GPLv2 one
>> README file says:
>>
>> libcdaudio is distributed under the GNU Library General Public
>> License, included in this package under the top level source directory
>> in the file COPYING
>>
>> C files also mention LGPL. but say v2 or later
>>
>> What to do with this in the LICENSE field? LGPLv2+ ?
>>
> This seems reasonable, you should also include the header chunk in the 
> LIC_FILES_CHKSUM, you can specify start and end lines for the checksum.

Saul,

We don't have this feature in OpenEmbedded yet... But it would be nice to port 
it from Poky though! :)

-- 
Denys


