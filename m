Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1OwYp7-0002lg-PZ
	for openembedded-devel@lists.openembedded.org;
	Fri, 17 Sep 2010 13:09:54 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id 2BE8FA5585
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 12:08:55 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id 36IQT2sjWe39
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 12:08:53 +0100 (BST)
Received: from [192.168.1.119] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id 1B99BA5576
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Sep 2010 12:08:50 +0100 (BST)
Message-ID: <4C934C38.5050608@xora.org.uk>
Date: Fri, 17 Sep 2010 12:08:40 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.9) Gecko/20100908 Lightning/1.0b2 Thunderbird/3.1.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimF0DyLTfajYY0zWdnLDRuE8_00iufG4V5dRY12@mail.gmail.com>
	<AANLkTi=+EyFf3VbmfaeEk0LfhKgvWW30soUA71HRarpu@mail.gmail.com>
In-Reply-To: <AANLkTi=+EyFf3VbmfaeEk0LfhKgvWW30soUA71HRarpu@mail.gmail.com>
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: removal of alsa-scenario_git.bb ?
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
X-List-Received-Date: Fri, 17 Sep 2010 11:09:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

 On 17/09/10 09:36, Frans Meulenbroeks wrote:
> 2010/9/17 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
>> Hi all,
>>
>> Yesterday I bumped upon alsa-scenario_git.bb.
>> This one had a DP of -1 and does not fetch.
>>
>> At first I thought a bad SRCREV but when trying to clone the git I
>> also got a failure:
>>
>> frans@frans-desktop:/tmp$ git clone git://slimlogic.co.uk/alsa-scenario
>> Initialized empty Git repository in /tmp/alsa-scenario/.git/
>> fatal: The remote end hung up unexpectedly
>>
>> If this persists should we remove the recipe?
>> I also could not identify any user.
>>
>> I'm especially interested in the views of Graeme on this as he added the recipe.
>>
>> Frans
>>
> Meanwhile it has been brought to my attention that this is probably an
> outage in the git server. I'll keep an eye on it. 
Just to confirm that recipe is maintained by Slimlogic employees and is
used a lot. Im just waiting to hear back why that git repo is not
currently served.

Graeme



