Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NXvym-00060a-D8
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Jan 2010 13:17:43 +0100
Received: (qmail 22706 invoked by uid 1003); 21 Jan 2010 12:15:22 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 21 Jan 2010 12:15:22 -0000
Message-ID: <4B584559.1090704@balister.org>
Date: Thu, 21 Jan 2010 07:15:21 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.5) Gecko/20091209 Fedora/3.0-3.fc11 Thunderbird/3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1264067024.3695.14.camel@mattotaupa.wohnung.familie-menzel.net>	<201001211102.11252.holger+oe@freyther.de>
	<883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
In-Reply-To: <883120D4-C490-4713-B872-F02376E88CEE@vanille-media.de>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Getting patches committed
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
X-List-Received-Date: Thu, 21 Jan 2010 12:17:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/21/2010 05:20 AM, Dr. Michael Lauer wrote:
> Am 21.01.2010 um 11:02 schrieb Holger Hans Peter Freyther:
>
>>>
>>> 2. Is there a way to have a staging branch where all patches are
>>> committed to, which have not been reviewed for let us say one week, to
>>> get more testing and before they go into the dev branch? Maybe it is
>>> easier for people to at least test build such a branch?
>>
>> Would you be interested in creating such a branch for us? I assume it is
>> certainly easier to git cherry-pick a patch than to download the mbox and use
>> git am..
>
> I fully agree. I'm neither using patchwork nor do I find patches on the list a good idea.
> I'd welcome for-oe-upstream trees that would contain patches that -- if good -- we could
> just pull from.

I actually like patches on the list, because it makes me aware of how is 
doing work and keeps me aware of the kinds of things people without 
commit access are interested in. Also, it gives people with commit 
access a forum for changes they would like reviewed.

I am not opposed to someone creating a git branch or branches created 
from list patches, but do not want to see the patches disappear from the 
list.

If the patch that was sent to the list comes from git-send-patch (I hope 
I hve that correct) there is a script contrib/patchwork/git-am.sh that 
makes it really easy to apply the patch.

Philip


