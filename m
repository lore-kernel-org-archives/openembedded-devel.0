Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1REOq8-0004zm-JB
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 19:13:04 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LT000BBPKV8B121@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Oct 2011 12:06:56 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 05CCF14AF5D; Thu,
	13 Oct 2011 13:06:44 -0400 (EDT)
Date: Thu, 13 Oct 2011 13:06:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111013170644.GI26170@denix.org>
References: <4E954243.4040209@telia.com> <4E957C19.6080106@slimlogic.co.uk>
MIME-version: 1.0
In-reply-to: <4E957C19.6080106@slimlogic.co.uk>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: Wiki write access disabled?
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
X-List-Received-Date: Thu, 13 Oct 2011 17:13:04 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Oct 12, 2011 at 12:38:01PM +0100, Graeme Gregory wrote:
> Did some experiments with FM on IRC, seems you need the approved flag to be 
> sat to edit wiki now.
>
> I don't know what the procedure is to set this flag. I have set it for 
> eFfeM now. I don't want to go ahead and add it for other users without a 
> nod from someone who knows more about the wiki than me.

So, how do we go about this limitation? Do we enable write access on a case by 
case basis? Right now I believe there is only a handful of people allowed to 
edit Wiki pages...

-- 
Denys


> I also note the virtual hosting of wiki.openembedded.org/.net is not quite 
> working.  You can't log in to .org and all pages seem to be missing on .net 
> domain.
>
> Graeme
>
>
> On 12/10/11 08:31, Ulf Samuelsson wrote:
>> Noticed that the wiki seems to be wrong on the 2011.03 release.
>>
>> http://www.openembedded.org/wiki/Release-2011.03
>>
>> The page tells you to:
>>
>> git checkout release-2011.03
>>
>> or
>>
>> git checkout -b release-2011.03 origin/release-2011.03
>>
>> I tried, and that failed.
>>
>> $ git checkout -b ulf/release-2011.03-2011-10-12 origin/release-2011.03
>>
>> and got the error message.
>>
>> fatal: git checkout: updating paths is incompatible with switching 
>> branches.
>> Did you intend to checkout 'origin/release-2011.03' which can not be 
>> resolved as commit?
>>
>> $ git remote show origin
>> did not show any "release-2011.03", but there is a "2011.03-maintenance"
>> which I guess is what you want.
>>
>> Tried to change the "http://www.openembedded.org/wiki/Release-2011.03" 
>> wiki page
>> to reflect this, but that was not possible, since I did not have write 
>> access any longer.
>>
>> Has the rules changed, or is this a mistake in configuration.
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


