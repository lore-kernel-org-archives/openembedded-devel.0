Received: from [82.195.155.133] (helo=mail.techworks.ie)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cgagneraud@techworks.ie>) id 1MdLq7-00028u-Ut
	for openembedded-devel@lists.openembedded.org;
	Tue, 18 Aug 2009 12:22:52 +0200
Received: from archeopterix.techworks.local (unknown [86.43.120.173])
	by mail.techworks.ie (Postfix) with ESMTP id CC2073AB65
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 18 Aug 2009 11:05:48 +0100 (IST)
Message-ID: <4A8A7D58.9000305@techworks.ie>
Date: Tue, 18 Aug 2009 11:07:20 +0100
From: Christian Gagneraud <cgagneraud@techworks.ie>
User-Agent: Thunderbird 2.0.0.21 (X11/20090320)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A88450A.8030609@techworks.ie> <20090818013941.GB18879@denix.org>
In-Reply-To: <20090818013941.GB18879@denix.org>
Subject: Re: [stable][patch] git: Add missing patch, apply it only	when version >= 1.5.3
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
X-List-Received-Date: Tue, 18 Aug 2009 10:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko wrote:
> On Sun, Aug 16, 2009 at 06:42:34PM +0100, Christian Gagneraud wrote:
>> Hi,
>>
>> Git-native fails to build (angstrom-2008.1 on stable branch) because aa 
>> patch is missing in the packages/git/files folder.
>> According to this message [1], the missing patch is not needed for the 
>> version being build, but is needed for newer version
> 
> 1.6.0.4 is the only version of git available from both .dev and stable 
> branches for quite some time now and it does not require that patch. All the 
> older versions were removed. Please make sure you are looking at the right 
> stable branch - stable/2009:
> 
> http://cgit.openembedded.org/cgit.cgi/openembedded/log/?h=stable/2009

Damned! I picked up the wrong one! Thanks for pointing that.

Chris

> 



