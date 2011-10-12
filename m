Received: from slimlogic.co.uk ([89.16.172.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gg@slimlogic.co.uk>) id 1RDuSU-0007Jb-96
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 10:46:38 +0200
Received: from xora-desktop.xora.org.uk (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by slimlogic.co.uk (Postfix) with ESMTPSA id 5FB0013001B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Oct 2011 09:40:56 +0100 (BST)
Message-ID: <4E955297.4000100@slimlogic.co.uk>
Date: Wed, 12 Oct 2011 09:40:55 +0100
From: Graeme Gregory <gg@slimlogic.co.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110922 Lightning/1.0b2 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOd_LFzbT0j3wSjp+d3POcTUo9X9+aiYtax4d6tep3YXmTwb2g@mail.gmail.com>	<1318361177.3726.1.camel@mattotaupa>
	<1318408026.3556.3.camel@mattotaupa>
In-Reply-To: <1318408026.3556.3.camel@mattotaupa>
Subject: Re: git server move
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
X-List-Received-Date: Wed, 12 Oct 2011 08:46:38 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/10/11 09:27, Paul Menzel wrote:
> Dear OE folks,
>
>
> Am Dienstag, den 11.10.2011, 21:26 +0200 schrieb Paul Menzel:
>
>> Am Dienstag, den 11.10.2011, 15:11 -0400 schrieb Cliff Brake:
>>> Hi, we are moving git.openembedded.org to a new server.
>> is there more information about the reasons? Is it just a new machine?
>> Where is it hosted now?
>>
>>> SSH access on the old server has been disabled.  git:// still works there.
>>>
>>> As soon as DNS propagates, SSH access will work with the new server.
>>>
>>> Let me know if you see any problems.
>>>
>>> SSH keys will likely change, so expect messages about that.
>> So what are the fingerprints of the new keys? ;-)
> I hope the new fingerprint is the following.
>
> ed:99:0d:c1:6e:6c:02:75:df:36:25:4d:62:39:b7:e5
>
> Looking at what happened at<kernel.org>  I would have hoped to get an
> earlier response. Or do I miss something here that the fingerprint is
> not important?
>
>
Depends if you care about server substitution attacks or man in the 
middle attacks really :-)

Graeme




