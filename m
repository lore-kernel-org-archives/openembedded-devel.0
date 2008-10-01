Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kl6FH-0003BX-RG
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 20:16:19 +0200
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1Kl6BG-0007gI-Fk
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 13:12:10 -0500
Message-ID: <48E3BD38.2080708@dls.net>
Date: Wed, 01 Oct 2008 13:11:04 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>	<gc017m$gq4$1@ger.gmane.org>	<48E39BC1.6080200@dls.net>
	<gc0bc5$o9o$2@ger.gmane.org>
In-Reply-To: <gc0bc5$o9o$2@ger.gmane.org>
Subject: Re: git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 18:16:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 01-10-2008 17:48, Mike (mwester) wrote:
>> Koen Kooi wrote:
>>> On 01-10-2008 15:34, Nicola Mfb wrote:
>>>> 2008/10/1 Kalev Lember<kalev@smartlink.ee>
>>>> [...]
>>>>
>>>>> Well yes, but if you just do:
>>>>> git clone git://git.openembedded.net/org.openembedded.dev
>>>>>
>>>>> you'll end up on master branch, which is not updating.
>>>>
>>>> Yes, the same here, i opened one of those bugs.
>>>> I'm using a semiautomated makefile environment for fso/openmoko,
>>>> this use
>>>> git and not monotone, so this problem affects a lot of peoples, please
>>>> fix!
>>> That's what you get for using makefiles....
>>
>> How does a makefile affect the branches not being updated?
> 
> All org.openembedded.* branches are still being updated.
>

Yes?  And how does a wrapper of any sort, makefile or shell script,
affect that?  Are you saying the bitbake and OE have code to detect if
"make" is a parent process, and it behaves differently?  Or are you
saying that "make" is broken?  Or are their unknown bugs in bitbake or
OE recipes that seem to behave badly when bitbake is invoked by "make"?

Of course it's none of the above  -- it's that you despise the makefile
--  but a lot of other people might actually think you are making some
technically-sound point, and wrongly determine that OE and make are
incompatible in some way.

So why not just say that the wrong branch is being pulled instead of
making snide comments about the tools others use?

Mike (mwester)


