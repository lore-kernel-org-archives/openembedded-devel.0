Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwester@dls.net>) id 1JT2Jb-0000vh-QH
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 22:53:53 +0100
Received: from gw.mwester.net ([209.242.5.110] helo=[192.168.1.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1JT2JI-0002Sq-7X
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Feb 2008 15:53:32 -0600
Message-ID: <47C095CA.6060407@dls.net>
Date: Sat, 23 Feb 2008 15:53:14 -0600
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Thunderbird 2.0.0.9 (Windows/20071031)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1203793457.8255.5.camel@dax.rpnet.com>	<fppt2j$thh$1@ger.gmane.org>	<20080223223439.528c6997@widy.localdomain>
	<200802232241.01317.openembedded@haerwu.biz>
In-Reply-To: <200802232241.01317.openembedded@haerwu.biz>
X-SA-Exim-Connect-IP: 216.145.245.197
X-SA-Exim-Mail-From: mwester@dls.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Uppercase overrides and parsing speed
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2008 21:53:53 -0000
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 8bit

Marcin Juszkiewicz wrote:
> Dnia Saturday, 23 of February 2008, Paul Sokolovsky napisa³:
>   
>> Koen Kooi <koen@dominion.kabel.utwente.nl> wrote:
>>     
>
>   
>>> Didn't we also agree that variable names shouldn't include '_' at
>>> all?
>>>       
>> How is that achievable? LETSUSEITLIKETHIS? Maybe exclude 'A' too? ;-)
>>     
>
> LETS-USE-IT-LIKE-THIS was one of suggestions.
>
>   

Oh come on, now - you can't be serious.  It's just not difficult enough 
or arcane enough with any of those choices!  We need to insist on this 
syntax for variables:

LET\'S\ USE\ IT\ LIKE\ THIS

;-) :-P

Didn't there used to be some recommendation for a variable naming 
convention that encoded the type into the name?  Somehow all these 
restrictions on the use of case and underscores reminds me of that 
notation  -- that idea seems to have faded away (thank goodness for 
that, too), and I don't think we should let OE go there either.  I'd 
rather take a small performance hit instead of having to remember even 
more rules about upper/lower case and other naming conventions.  I vote 
to leave well enough alone... JMO.

Mike (mwester)


