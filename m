Received: from [216.168.135.169] (helo=starfish.geekisp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philip@balister.org>) id 1N9IEs-0005TU-Cg
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Nov 2009 14:00:29 +0100
Received: (qmail 8940 invoked by uid 1003); 14 Nov 2009 12:59:05 -0000
Received: from localhost (HELO ?192.168.1.167?) (philip@opensdr.com@127.0.0.1)
	by mail.geekisp.com with SMTP; 14 Nov 2009 12:59:05 -0000
Message-ID: <4AFEA998.7090904@balister.org>
Date: Sat, 14 Nov 2009 07:59:04 -0500
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.4pre) Gecko/20091014 Fedora/3.0-2.8.b4.fc11
	Thunderbird/3.0b4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <alpine.LFD.2.00.0911130443520.1157@localhost>	<4AFD4DD6.70509@balister.org>	<alpine.LFD.2.00.0911130732220.17745@localhost>	<4AFD5440.6080202@balister.org>	<1258129007.5799.73.camel@dax.rpnet.com>	<alpine.LFD.2.00.0911131129020.5980@localhost>	<1258130362.5799.80.camel@dax.rpnet.com>	<1258152092.13901.11.camel@andromeda>	<4AFEA793.5020504@balister.org>
	<alpine.LFD.2.00.0911140751320.12790@localhost>
In-Reply-To: <alpine.LFD.2.00.0911140751320.12790@localhost>
X-SA-Exim-Connect-IP: 216.168.135.169
X-SA-Exim-Mail-From: philip@balister.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: build breakage: python-native-2.6.1
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
X-List-Received-Date: Sat, 14 Nov 2009 13:00:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/14/2009 07:52 AM, Robert P. J. Day wrote:
> On Sat, 14 Nov 2009, Philip Balister wrote:
>
>>
>>
>> On 11/13/2009 05:41 PM, Michael 'Mickey' Lauer wrote:
>>> Hi folks,
>>>
>>>> That readline tweak is a hack and there is a bigger problem here. I'd
>>>> like to solve it completely so yes, I'd like to confirm that was the
>>>> problem please. Once someone has done that I also have a proposed fix:
>>>>
>>>> http://tim.rpsys.net/python-hostfix.patch
>>>
>>> Acked-by: Michael 'Mickey' Lauer<mickey@vanille-media.de>
>>
>> Tested-by: Philip Balister<philip@balister.org>
>>
>> Fixed on F11.
>>
>> Philip
>>
>> PS: Yes, I know RP just pushed the patch.
>
>    so there's only one package between me and a build of the
> beagleboard demo image -- guile-native -- and adrian alonso(?)
> allegedly posted a usable fix for that yesterday.  looking good.

I just started a beagleboard-demo-image build. Too bad it is a nice day 
here :)

Philip


>
> rday
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>              Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


