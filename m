Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1LQHVI-0003eZ-KU
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 09:35:10 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1LQHOG-00067f-AC
	for openembedded-devel@openembedded.org; Fri, 23 Jan 2009 08:27:48 +0000
Received: from p5483a069.dip0.t-ipconnect.de ([84.131.160.105])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 08:27:48 +0000
Received: from vjensen by p5483a069.dip0.t-ipconnect.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 23 Jan 2009 08:27:48 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Vitus Jensen <vjensen@gmx.de>
Date: Fri, 23 Jan 2009 08:27:40 +0000 (UTC)
Message-ID: <glbv1s$au0$1@ger.gmane.org>
References: <200901230131.09511.mickey@vanille-media.de>
	<87wscmn8ne.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: p5483a069.dip0.t-ipconnect.de
User-Agent: Pan/0.133 (House of Butterflies)
Sender: news <news@ger.gmane.org>
Subject: Re: Bugtracker Status
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
X-List-Received-Date: Fri, 23 Jan 2009 08:35:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Am Thu, 22 Jan 2009 22:55:17 -0200 schrieb Otavio Salvador:

> "Michael 'Mickey' Lauer" <mickey@vanille-media.de> writes:
> 
>> Hi guys,
>>
>> we have 1141 open bugs in the bugtracker, a couple of hundreds from
>> ancient autobuilder builds, some more hundreds application specific
>> bugs, and then some actual ones.
>>
>> I think there are two ways to deal with the mess:
>>
>> 1.) Officially close the bugtracker down.
>>
>> 2.) Attack the situation.
>>
>> I'm fine with either way, though if we'd go for 2.), I'd propose:
>>
>> 2.1.) Removing all autobuilder bugs completely (how can we script
>> that?) and stop autobuilder automatically adding bugs. It was a great
>> idea, but it didn't work out. We do not have enough manpower and it
>> just messes up the bugtracker.
>> 2.2.) Remove all software specific bugs that have an upstream and are
>> not distribution-relevant, such as GPE, Opie, Kernel, etc. 2.3.)
>> Reinstate the monthly bug squashing weekends.
>>
>> Opinions?
> 
> I propose to change the workflow a bit (and reuse few points you've
> proposed):
> 
>  1. stop using bugtracker to handle patches
>  2. use mailing list to handle patches (comments bellow)
>  3. drop autobuilder bug reporting (comments bellow)
...

While I just occasional work with OpenEmbedded I have to remark that I 
have two patches patches published which didn't make it into the 
repository the last months:

1. posted to this list (adds htmldoc)
2. in bugzilla (fixes php 5 compile)

I can live with that, just using my private branch.  But having gotten no 
comments what's wrong with those patches I think this shows that either 
way doesn't work at the moment.

And --- if you want my opinion --- it's much easier for me to monitor my 
comments in bugzilla or search patches there.

By[t]e,
   Vitus

-- 
Vitus Jensen, Hannover, Germany, Earth, Milky Way, Universe (current)



