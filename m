Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OpeRh-0001Lf-41
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 11:45:01 +0200
Received: by wyg36 with SMTP id 36so5069184wyg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 02:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=huuIQT1FOgaO0vFO1VoUbant3iFdt0fZu7h30GPirMA=;
	b=pHx3ovWHQOhOW8+gkJpRdXwSK3JKFgApXXP2dRG3SwJqgzBiGhYwurRxYDZHnzTdad
	x8VM8qZml/mTbekmOG137NQERspsfV44AbUeVotMGNh2xiz+yecR3iqXzW1jJAWlChEf
	IQYoWfWfgWrV2HJ7I9R4dzgNiHwLTrs2x27bA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=bEWgFNj2Rgdu2kiTCIjpvBJOp6d29XUv8DZEE6DDfdDkCHI5X3ANC0l+Jb53rYtkUQ
	jNUvL79NG35QukoCzkvehk4KHvDY2eGlJEJYZblll5yFcsSWvNhdAL7ou4M37GC/P2PY
	A16eetTz3OytCO87oq/o9/tv0rtb0VRNwxoTc=
MIME-Version: 1.0
Received: by 10.227.135.16 with SMTP id l16mr3258973wbt.158.1283075070354;
	Sun, 29 Aug 2010 02:44:30 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Sun, 29 Aug 2010 02:44:30 -0700 (PDT)
In-Reply-To: <AANLkTi=BJeoO6OUp4cShDvHbd8Mx=iJxzDGfGjciUEob@mail.gmail.com>
References: <AANLkTi=7Ys9reqVWjN5Byrpt+kagk6EBO-9xLr9ptPFa@mail.gmail.com>
	<AANLkTikkqKU+_z56TRPJKruaK9H4gKyH3wH4F1Y05fVi@mail.gmail.com>
	<AANLkTins7NgooRSA18jB=KsZ8tV9CCVwnUJdYbM510eF@mail.gmail.com>
	<AANLkTi=BJeoO6OUp4cShDvHbd8Mx=iJxzDGfGjciUEob@mail.gmail.com>
Date: Sun, 29 Aug 2010 02:44:30 -0700
Message-ID: <AANLkTinzN+6ys_DG481a7LiAh9+idyCxtSJ-RJZj-jYx@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: apr-util_1.3.4 does not build
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
X-List-Received-Date: Sun, 29 Aug 2010 09:45:01 -0000
Content-Type: text/plain; charset=ISO-8859-1

if you tell me things to do or try I would be happy to help you figure
it out. I really wouldnt like to have to switch up yet at least. I am
honestly not great with OE at all yet so I would need dumb mans tips
to help you out.


On Sun, Aug 29, 2010 at 2:28 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Sun, Aug 29, 2010 at 2:23 AM, J. L. <vwyodapink@gmail.com> wrote:
>> That is the only OS I have setup with a build environment. Should I
>> just finally upgrade to the 10.04 release? Would clean install be the
>> best to do or can I just upgrade and not cause issues with the build
>> environment? I think its an issue for my build OS only as on the
>> gumstix board steve said it worked for him using the same OS as you
>> are.
>
> You can try and upgrade. if that does not work and reinstall. Your system
> your choice. Though it would be interesting to find why this error
> happens on 9.10
>
>>
>> On Sun, Aug 29, 2010 at 2:16 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On Sat, Aug 28, 2010 at 8:11 PM, J. L. <vwyodapink@gmail.com> wrote:
>>>> I am running ubuntu 9.10 with and up to date overo branch of OE and
>>>> apr- util will not build gives the following error:
>>>
>>> I cant reproduce it on ubuntu 10.04. If possible can you retry to
>>> reproduce it on some
>>> other build OS than 9.10
>>>
>>>>
>>>> NOTE: Running task 819 of 832 (ID: 9,
>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>>>> do_qa_configure)
>>>> ERROR: This autoconf log indicates errors, it looked at host includes.
>>>> Rerun configure task after fixing this. The path was
>>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/apr-util-1.3.4-r5/apr-util-1.3.4'
>>>> ERROR: Error in executing:
>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>>>> ERROR: Exception:<type 'exceptions.SystemExit'> Message:1
>>>> ERROR: Printing the environment of the function
>>>> ERROR: Build of
>>>> /home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb
>>>> do_qa_configure failed
>>>> ERROR: Task 9 (/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb,
>>>> do_qa_configure) failed
>>>> NOTE: Tasks Summary: Attempted 818 tasks of which 818 didn't need to
>>>> be rerun and 1 failed.
>>>> ERROR: '/home/vdubhack/overo-oe/org.openembedded.dev/recipes/apr/apr-util_1.3.4.bb'
>>>> failed
>>>>
>>>>
>>>> I have tried cleaning the recipe and rebuilding with no luck as well
>>>> as trying to build from a fresh tmp directory. Though I think I
>>>> understand the error I do not know how to go about fixing it with a
>>>> proper patch. I would appreciate any help with this.
>>>>
>>>> _______________________________________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.openembedded.org
>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


