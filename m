Received: from [62.70.27.18] (helo=esparsett.troll.no)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <lpotter@trolltech.com>) id 1IucIs-0004MZ-Aj
	for openembedded-devel@lists.openembedded.org;
	Wed, 21 Nov 2007 00:14:50 +0100
Received: from esparsett.troll.no (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 2F6E874210
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 00:12:39 +0100 (CET)
Received: from mail.trolltech.com.au (unknown [10.1.1.12])
	by esparsett.troll.no (Postfix) with ESMTP id B541074256
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 00:12:38 +0100 (CET)
Received: from [10.1.1.181] (polarbear-replace.trolltech.com.au [10.1.1.181])
	by mail.trolltech.com.au (Postfix) with ESMTP id 44F29393D6D
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Nov 2007 09:12:37 +1000 (EST)
Message-ID: <474369E5.1020207@trolltech.com>
Date: Wed, 21 Nov 2007 09:12:37 +1000
From: Lorn Potter <lpotter@trolltech.com>
User-Agent: Thunderbird 2.0.0.0 (X11/20070326)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20071119120819.GA17788@lenovo><C7148B94-6A92-42DE-BF35-75B409DAA8E7@selfish.org><4741FB41.7080602@trolltech.com>	<1195551213.6337.9.camel@localhost.localdomain>
	<008f01c82b8a$89c8ab50$6e01a8c0@twilight>
In-Reply-To: <008f01c82b8a$89c8ab50$6e01a8c0@twilight>
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
X-List-Received-Date: Tue, 20 Nov 2007 23:14:50 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

Mike (mwester) wrote:
> I ask the OE team why are they are philosophically opposed to driving
> bitbake with make?  

Perhaps because oe's predecessor - buildroot, used make. Someone deemed 
make not good enough to build filesystems, and they decided to try 
something new.

Have I go that right?


-- 
Lorn 'ljp' Potter
Software Engineer, Systems Group, MES, Trolltech



