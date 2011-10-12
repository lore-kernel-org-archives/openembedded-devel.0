Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1RDxDr-00067w-EH
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 13:43:43 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id BBA0F13001B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 12:38:02 +0100 (BST)
Message-ID: <4E957C19.6080106@slimlogic.co.uk>
Date: Wed, 12 Oct 2011 12:38:01 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E954243.4040209@telia.com>
In-Reply-To: <4E954243.4040209@telia.com>
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
X-List-Received-Date: Wed, 12 Oct 2011 11:43:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Did some experiments with FM on IRC, seems you need the approved flag to 
be sat to edit wiki now.

I don't know what the procedure is to set this flag. I have set it for 
eFfeM now. I don't want to go ahead and add it for other users without a 
nod from someone who knows more about the wiki than me.

I also note the virtual hosting of wiki.openembedded.org/.net is not 
quite working.  You can't log in to .org and all pages seem to be 
missing on .net domain.

Graeme


On 12/10/11 08:31, Ulf Samuelsson wrote:
> Noticed that the wiki seems to be wrong on the 2011.03 release.
>
> http://www.openembedded.org/wiki/Release-2011.03
>
> The page tells you to:
>
> git checkout release-2011.03
>
> or
>
> git checkout -b release-2011.03 origin/release-2011.03
>
> I tried, and that failed.
>
> $ git checkout -b ulf/release-2011.03-2011-10-12 origin/release-2011.03
>
> and got the error message.
>
> fatal: git checkout: updating paths is incompatible with switching 
> branches.
> Did you intend to checkout 'origin/release-2011.03' which can not be 
> resolved as commit?
>
> $ git remote show origin
> did not show any "release-2011.03", but there is a "2011.03-maintenance"
> which I guess is what you want.
>
> Tried to change the "http://www.openembedded.org/wiki/Release-2011.03" 
> wiki page
> to reflect this, but that was not possible, since I did not have write 
> access any longer.
>
> Has the rules changed, or is this a mistake in configuration.
>



