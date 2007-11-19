Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1IuECo-0002ZE-6f
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Nov 2007 22:30:58 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 39634741CC
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 22:07:48 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id C4EE67421E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Nov 2007 22:07:47 +0100 (CET)
Received: from lorn-potters-mac-mini-2.local (unknown [172.18.1.3])
	by mail.trolltech.com.au (Postfix) with ESMTP id 379F03A91B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Nov 2007 07:07:46 +1000 (EST)
Message-ID: <4741FB41.7080602@trolltech.com>
Date: Tue, 20 Nov 2007 07:08:17 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0.0.9 (Macintosh/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo>
	<C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
In-Reply-To: <C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org>
Subject: Re: Getting Started -Makefile
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Nov 2007 21:30:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Holger Freyther wrote:
> Am 19.11.2007 um 13:08 schrieb David Farning:
> 
>> This eliminates many of problems the new users have setting up bb
>> and oe.  There is no need to know any thing about svn of monotone.
> 
> Hey,
> 
> this is the issue you want to solve? IMO developers should know about  
> how to build software and this includes getting the source. I think  
> it is no use in hiding OpenEmbedded and BitBake behind a GNU Makefile.

well, me and lot of other developers disagree. Hence the popularity of 
the openmoko makefile.

Are you trying to make it easier or harder to generate file systems? 
Lots of developers do not have time to learn the symantics of 
bitbake/monotone, etc.

Anything that can make it easier to set up and build is needed. 
Otherwise it is just easier to build it from scratch.



-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech


