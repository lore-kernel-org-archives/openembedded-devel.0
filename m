Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1RE0WX-0003ka-BQ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Oct 2011 17:15:13 +0200
Received: (qmail 14001 invoked by uid 1003); 12 Oct 2011 15:09:29 -0000
Received: from unknown (HELO ?192.168.1.108?)
	(philip@opensdr.com@96.240.183.10)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	12 Oct 2011 15:09:29 -0000
Message-ID: <4E95ADA8.7060303@balister.org>
Date: Wed, 12 Oct 2011 11:09:28 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.23) Gecko/20110928 Fedora/3.1.15-1.fc14 Thunderbird/3.1.15
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E954243.4040209@telia.com> <4E957C19.6080106@slimlogic.co.uk>
In-Reply-To: <4E957C19.6080106@slimlogic.co.uk>
X-Enigmail-Version: 1.1.2
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
X-List-Received-Date: Wed, 12 Oct 2011 15:15:13 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 10/12/2011 07:38 AM, Graeme Gregory wrote:
> Did some experiments with FM on IRC, seems you need the approved flag to
> be sat to edit wiki now.
> 
> I don't know what the procedure is to set this flag. I have set it for
> eFfeM now. I don't want to go ahead and add it for other users without a
> nod from someone who knows more about the wiki than me.
> 
> I also note the virtual hosting of wiki.openembedded.org/.net is not
> quite working.  You can't log in to .org and all pages seem to be
> missing on .net domain.

I believe Mickey needs to talk with Tom about updating the .net DNS.

Philip

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
> 


