Received: from [82.204.219.123] (helo=web23.pochta.ru)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <linuxrulez@land.ru>) id 1Kl5cW-0001t8-8R
	for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 19:36:16 +0200
Received: from [127.0.0.1] (helo=localhost)
	by web23.pochta.ru ( sendmail 8.13.3/8.13.1) with esmtp id
	1Kl5YU-0000Iu-5L for openembedded-devel@lists.openembedded.org;
	Wed, 01 Oct 2008 21:32:06 +0400
Message-ID: <20081001213206.1aume264o4gko4so@www.pochta.ru>
X-Priority: 3
Date: Wed, 01 Oct 2008 21:32:06 +0400
From: linuxrulez@land.ru
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Mailer: Free mail service Pochta.ru; WebMail Client; Account:
	linuxrulez@land.ru
X-Proxy-IP: [80.92.96.29]
X-Originating-IP: [80.92.96.29]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: I want to help with magician platform
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
X-List-Received-Date: Wed, 01 Oct 2008 17:36:16 -0000
Content-Type: text/plain;
	charset=KOI8-R;
	format="flowed"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Content-Description: Plaintext Version of Message

Hi everyone!  
I want to help with supporting magician platform in oe/angstrom and
do what I can to help for building/testing/patching.  
  Anyone who supports magician now, contact with me
From mwester@dls.net Wed Oct 01 20:08:25 2008
Received: from [216.145.245.200] (helo=mx04.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1Kl67d-0002mh-9h
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 20:08:25 +0200
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx04.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1Kl63c-00011F-IC
	for openembedded-devel@openembedded.org; Wed, 01 Oct 2008 13:04:16 -0500
Message-ID: <48E3BB5D.1000908@dls.net>
Date: Wed, 01 Oct 2008 13:03:09 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.17) Gecko/20080914 Thunderbird/2.0.0.17 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <48E36C18.4090504@smartlink.ee>	<873ajglc0d.fsf@neumann.lab.ossystems.com.br>	<48E3762E.6000203@smartlink.ee>	<359c5480810010634m377ab993rd030d8c0c917b8b3@mail.gmail.com>	<gc017m$gq4$1@ger.gmane.org>	<48E39BC1.6080200@dls.net>
	<48E3AFB5.5000600@balister.org>
In-Reply-To: <48E3AFB5.5000600@balister.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Subject: Re: [oe] git master not updating
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
X-List-Received-Date: Wed, 01 Oct 2008 18:08:25 -0000

Philip Balister wrote:
> Mike (mwester) wrote:
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
> The problem is that if someone has a problem and shows up in #oe asking
> why there are not any updates. If they can't explain the actual command
> to do the updates, most of the people in #oe cannot help.
> 
> Please have people using makefiles ask for help in the project specific
> channels first.
> 
> Philip

Yeah, yeah, ok.  But if you read the original email, the author has
clearly identified the problem down to git, and the mention of the
makefile is totally ancillary to the situation.

I completely understand why it is difficult to support an end-user who
pops in with a problem and has no idea of the underlying commands being
run by the automated script or makefile.  But that's not the case here,
clearly -- this reaction is just unwarranted prejudice against the
makefile wrapper.

Please read the emails and respond to the *issue* being presented,
without automatic negative responses to the keyword "makefile".

Wrappers are not evil.  Bad attitudes are.

Mike (mwester)


