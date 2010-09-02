Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrJRr-0004Dj-VW
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 01:44:09 +0200
Received: by wye20 with SMTP id 20so817217wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 16:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=XgioGc0MSbAjTDTHXhJkhWAd6hCMr2+/5A3ew0tvfjY=;
	b=rdqGtjxUVUMqsPZtkbjSXtXRXp5cNOXbOmiCPDesHkL1PLEn8Z9YL/raqHOqND55QP
	1sux9fAPsH6ELn3c70HIHfhooohu3pTNytlITDcDv15JAKdXUOCX4ZRLBu9JSu08tKZa
	POUNU0uLsbXIE2ZQzhSyMg9Dz+WhYm+8kKfeE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=I/eT807oFQuvqGdVU/7ViT+HynsrR2j2FixjF9Pr76imoebVn+tT/jREuBIgazt7ww
	MwasdXhLCNSP/rVRWqgDbT96kH49hmH7cEb6UqX8hxJsuFZdkNZ1ufa3K8pXOlhE3r/w
	FBGiJgDUYftb59KVqG/eu9zMDoluuq5rqcPTY=
MIME-Version: 1.0
Received: by 10.216.10.77 with SMTP id 55mr10090007weu.17.1283471006617; Thu,
	02 Sep 2010 16:43:26 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 16:43:26 -0700 (PDT)
In-Reply-To: <AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>
	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>
	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>
Date: Thu, 2 Sep 2010 16:43:26 -0700
Message-ID: <AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org, 
	"General mailing list for gumstix users."
	<gumstix-users@lists.sourceforge.net>
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Perl modules I can not get to build, libdbd-sqlite-perl libversion-perl
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
X-List-Received-Date: Thu, 02 Sep 2010 23:44:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

Also if it would help I can post the image recipe I have made that I
am trying to build.

In case this explains anymore about the overo branch for you this was
posted by steve sakoman who I believe is the maintainer of the branch
about the difference which to me reads as its just the configuration
files. If I am wrong please correct me.
http://old.nabble.com/Re%3A-Is-Overo-OE-branch-a-fork--p25065128.html

The main reason I posted these recipes was due to the fact that I have
tried everything that has been mentioned to me before about how to
read the errors and from what the errors read I do not understand why
installing the files on the build machine does not help with the one,
and the other is honestly above me at the moment as I do not grasp
using devshell yet and how to work with in there, let alone properly
lay out a program recipe and then patch it to work properly. Once I
grasp things more I hope to be a help and not such a hindrance, I
welcome any tips links or anything to point to how to fix either and I
will try more on more with those pointers and if successful post the
results and maybe a patch or post the failure.

Thanks for all of your time


On Thu, Sep 2, 2010 at 4:22 PM, J. L. <vwyodapink@gmail.com> wrote:
> According to gumstix their branch recipes are all recipes identical to
> the dev branch except for a very small few, and when I ask for help on
> non gumstix related recipes they kept referring me to here so I
> started posting here. Most of my fixes so far have just been from my
> miss understandings of things, and you guys pointing them out to me
> which is has been a tremendous help already. I did verify its the same
> recipe that you have in the main dev branch. So what should I do from
> here? Not post these issues on the OE board and see where I get or ?
>
> On Thu, Sep 2, 2010 at 1:02 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
>> 2010/9/2 J. L. <vwyodapink@gmail.com>:
>>> I have cleaned and rebuilt these a few times now while trying to do
>>> what its saying or assuming it should be saying in the errors, the
>>> commands i have run are bitbake -c package then I run bitbake package
>>> again after I try a fix. Build machine is ubuntu9.10, and I am on the
>>> overo branch. I know I really need to learn to grasp the recipes and
>>> patching more but I am slowly working on that while working through
>>> the errors as it sticks better for me this way. I broke up each
>>> failing recipe down so easier to see info for each package.
>>
>> You might want to check if the recipe is the same as the OE one.
>> Typically the people on this list are working on the main branch of
>> the openembedded repository.
>> If you are reporting a problem on another repo or branch chances are
>> small that people can help you.
>>
>> Also I see you are reporting quite some problems, but your posts also
>> seem to indicate that you make some progress.
>> If an item you reported on is resolved it is nice to report back (so
>> if someone looks into it, he knows that it is not needed any more)
>> And if there is a fix, a patch is always appreciated :-)
>>
>> But the most important thing is;
>> Have fun!
>> Frans
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


