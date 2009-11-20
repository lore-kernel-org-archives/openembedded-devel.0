Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NBSdl-000543-7H for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:31:08 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NBScO-0004vs-DL
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Nov 2009 13:29:40 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 13:29:40 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Nov 2009 13:29:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Fri, 20 Nov 2009 13:29:15 +0100
Message-ID: <he622r$ni0$1@ger.gmane.org>
References: <992df8520911150534v4aeec248u91c5ca477de25eb9@mail.gmail.com>	<he5n72$ltj$1@ger.gmane.org>	<992df8520911200151q57520791n6395642f5bc18e@mail.gmail.com>	<he5tf8$91o$1@ger.gmane.org>
	<992df8520911200412l6d79d15dg58a2e88a6e50197c@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.6pre) Gecko/20091109 Shredder/3.0pre
In-Reply-To: <992df8520911200412l6d79d15dg58a2e88a6e50197c@mail.gmail.com>
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Initial Support for the Samsung Omnia (SGH-i900)
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
X-List-Received-Date: Fri, 20 Nov 2009 12:31:08 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20-11-09 13:12, Alex Ferguson wrote:
> On Fri, Nov 20, 2009 at 1:10 PM, Koen Kooi<k.kooi@student.utwente.nl>wrote:
>
>>
>> We stopped hardcoding event numbers in OE years ago, even the opie people
>> saw the light, so I wonder what's the matter with the omnia to go backwards
>> a few years :(
>
>
> I see where you're getting at, and I'll add that to my FIXME list. As I
> said, it's not a bug yet, but as you said, it might become one later.
> There's still a lot of things to be done.
>
> Thanks for the feedback. :)

I spent waaaaay too many days trying to figure out why touchscreens 
'suddenly' stopped working. Richard Purdie is the real hero for coming 
up with the udev rule.

regards,

Koen



