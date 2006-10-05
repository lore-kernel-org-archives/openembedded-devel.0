Received: from [203.16.214.66] (helo=mail.internode.on.net)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <duncan.grove@internode.on.net>) id 1GVQO5-000367-EI
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Oct 2006 12:23:34 +0200
Received: from [192.168.1.4] (unverified [121.44.96.149]) 
	by mail.internode.on.net (SurgeMail 3.2f) with ESMTP id 239458984 
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Oct 2006 19:47:50 +0930 (CST)
Message-ID: <4524DBC4.8030707@internode.on.net>
Date: Thu, 05 Oct 2006 19:47:40 +0930
From: Duncan Grove <duncan.grove@internode.on.net>
User-Agent: Thunderbird 1.5.0.7 (Windows/20060909)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: anoncvs access problems?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Oct 2006 10:23:34 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've just tried to do an OE build (bitbake nano) which failed trying to 
get ipkg-utils via cvs from anoncvs.handhelds.org. Trying to telnet 
anoncvs.handhelds.org 2401 I get a connection timed out, but I don't 
think it's me (firewalls, etc) as I can eg telnet anoncvs.netbsd.org 
2401 and get cvs access fine. Has anyone else been having any trouble? 
The weird thing is that from the logs at www.handhelds.org it looks like 
other people have been checking things in without a hitch -- perhaps 
it's just an access problem from my part of the world?

TIA,
Duncan


