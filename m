Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dp@xora.org.uk>) id 1PxzJl-0005C0-Tx
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 11:11:33 +0100
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 657BBA4702
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 09:58:45 +0000 (GMT)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id WYQT1cUuJ-Zu
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 09:58:44 +0000 (GMT)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 9BBADA4700
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Mar 2011 09:58:44 +0000 (GMT)
Message-ID: <4D79F2A5.6060406@xora.org.uk>
Date: Fri, 11 Mar 2011 10:00:05 +0000
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.15) Gecko/20110303 Lightning/1.0b2 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110311081950.GG7353@excalibur.local>
In-Reply-To: <20110311081950.GG7353@excalibur.local>
X-Enigmail-Version: 1.1.1
Subject: Re: OE Bugzilla Future
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
X-List-Received-Date: Fri, 11 Mar 2011 10:11:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/03/2011 08:19, Stefan Schmidt wrote:
> Comments? Volunteers?
>
Is there any newer bug tracking systems which should be considering?

If we keep bugzilla then we are still running a system where people do
everything twice. They email patches to OE mailing list for review and
also have to file them into bugzilla. If we could somehow combine the
two functions. Effectively integrate patchwork and bug tracker into one
system. I have no idea if such a bug tracker exists.

Also I might suggest we shift to launchpad or another hosted solution.
That way we can lesson the load on the admin team.

Im happy to step up and be a bug massager if we decide to run with a
bugtracker, but I think we need to decide if that is the correct
workflow for us first.

Graeme



