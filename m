Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1Py3WI-0004IF-RM
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Mar 2011 15:40:50 +0100
Received: (qmail 10391 invoked by uid 1003); 11 Mar 2011 14:39:08 -0000
Received: from unknown (HELO ?192.168.128.32?)
	(philip@opensdr.com@70.56.61.235)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	11 Mar 2011 14:39:08 -0000
Message-ID: <4D7A33FB.3020506@balister.org>
Date: Fri, 11 Mar 2011 07:38:51 -0700
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc14
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <20110311081950.GG7353@excalibur.local>
	<4D79F2A5.6060406@xora.org.uk>
In-Reply-To: <4D79F2A5.6060406@xora.org.uk>
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
X-List-Received-Date: Fri, 11 Mar 2011 14:40:50 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/11/2011 03:00 AM, Graeme Gregory wrote:
> On 11/03/2011 08:19, Stefan Schmidt wrote:
>> Comments? Volunteers?
>>
> Is there any newer bug tracking systems which should be considering?
>
> If we keep bugzilla then we are still running a system where people do
> everything twice. They email patches to OE mailing list for review and
> also have to file them into bugzilla. If we could somehow combine the
> two functions. Effectively integrate patchwork and bug tracker into one
> system. I have no idea if such a bug tracker exists.
>
> Also I might suggest we shift to launchpad or another hosted solution.
> That way we can lesson the load on the admin team.
>
> Im happy to step up and be a bug massager if we decide to run with a
> bugtracker, but I think we need to decide if that is the correct
> workflow for us first.

I'd like to see a place for users to report build failures and other 
bugs in the meta-data. I do not think it should be for reporting distro 
issues.

Patchwork is working well for tracking patches already, so we should not 
encourage people to post patches to bugzilla.

Having clear policies for what kind of bugs we track and how they are 
managed is critical. An example of a management task is assigning bugs 
to individuals, some people may be OK with having a bug master assign 
them bugs and others may not. Peoples wishes should be respected.

Philip


