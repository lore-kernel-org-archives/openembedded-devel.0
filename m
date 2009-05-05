Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M1RMp-0006FY-64
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 May 2009 22:35:55 +0200
Received: from gandalf.denix.org ([71.251.49.215]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJ600LMKU9CL68L@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	05 May 2009 15:29:42 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3600F6B8049; Tue,
	05 May 2009 16:29:36 -0400 (EDT)
Date: Tue, 05 May 2009 16:29:36 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090505202936.GA22698@denix.org>
References: <c384c5ea0905030555t48379d37o700254a1c49a4600@mail.gmail.com>
	<49FD9A75.3000609@balister.org> <49FD9EEA.4030608@dls.net>
	<ac9c93b10905030918t25211118yc27bb1177f1e65cb@mail.gmail.com>
	<49FDCB08.4010803@opensimpad.org>
MIME-version: 1.0
In-reply-to: <49FDCB08.4010803@opensimpad.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [RFC]: Remove #####...##### lines
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
X-List-Received-Date: Tue, 05 May 2009 20:35:55 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, May 03, 2009 at 06:49:12PM +0200, Bernhard Guillon wrote:
> Frans Meulenbroeks wrote:
>> I do agree that PR = "r0" in a recipe should be ok. (actually I think
>> that unaware of this I violated that rule a number of times :-) )
>>
>>   
> I like PR = "r0"
> Else it is easy to forget to bump it on updates. The manual also mention it 
> [1].

+1 - I agree it's easy to forget to bump it, if it's not there...

-- 
Denys


