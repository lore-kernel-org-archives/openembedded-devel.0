Received: from mail.geekisp.com ([216.168.135.169] helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1NpGHr-00015l-2O
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Mar 2010 08:25:04 +0100
Received: (qmail 21753 invoked by uid 1003); 10 Mar 2010 07:21:59 -0000
Received: from localhost (HELO ?192.168.0.202?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 10 Mar 2010 07:21:59 -0000
Message-ID: <4B974894.5010709@balister.org>
Date: Wed, 10 Mar 2010 08:21:56 +0100
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <mailman.5417.1268191803.14961.openembedded-devel@lists.openembedded.org>	<759741.73773.qm@web88207.mail.re2.yahoo.com>
	<ade1bdc1003092230u1b16756i138a2745963dea29@mail.gmail.com>
In-Reply-To: <ade1bdc1003092230u1b16756i138a2745963dea29@mail.gmail.com>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: git.openembedded.org server down?
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
X-List-Received-Date: Wed, 10 Mar 2010 07:25:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I just saw a message in irc that suggests the server admins are doing a 
hardware upgrade. Hopefully services are back in a few hours.

Philip

On 03/10/2010 07:30 AM, Raffaele Recalcati wrote:
> 2010/3/10 JOSEPH KORTJE<jkortje750@rogers.com>
>
>> I have been attempting to do a git pull since about 6 hours now.
>> When will the server be working again?
>>
>> Here is the error>
>>
>> ~/beagle-oe/openembedded$ git pull
>> git.openembedded.org[0: 140.211.169.165]: errno=Connection timed out
>> fatal: unable to connect a socket (Connection timed out)
>>
>
>
> Now I've done:
> git clone http://repo.or.cz/r/openembedded.git
> Initialized empty Git repository in /home/recalcati/openembedded/.git/
> Checking out files: 100% (22665/22665), done.
>
> du -sh openembedded/
> 598M    openembedded/
>
> http server works.
> The git one I can't test.
>
>
>
>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
>


