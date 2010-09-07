Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Tom_Rini@mentor.com>) id 1Ot035-0007Ma-8m
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 17:25:30 +0200
Received: from svr-orw-exc-08.mgc.mentorg.com ([147.34.98.97])
	by relay1.mentorg.com with esmtp 
	id 1Ot02P-0001bW-Pm from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 08:24:45 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-08.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.1830); Tue, 7 Sep 2010 08:24:45 -0700
Received: from [172.30.80.172] ([172.30.80.172]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 7 Sep 2010 09:24:44 -0600
Message-ID: <4C86593A.7000006@mentor.com>
Date: Tue, 07 Sep 2010 08:24:42 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Thunderbird 2.0.0.24 (X11/20100411)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTinU39HjKWb9=VMiSa=R2YA_9BxPDctiW1ire48C@mail.gmail.com>	<AANLkTikk1sce-dOHW_uVOO3m+XPx1ZjapvcNAAHiXwnS@mail.gmail.com>	<AANLkTikkJod_2MTGN4B+8Q4wS74v9Z=nEBqrucUrcYjv@mail.gmail.com>	<AANLkTikZuBMiU2H8m3M97xFwcQE2GCdQ_2Q=TSM4b23-@mail.gmail.com>
	<AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>
In-Reply-To: <AANLkTi=eX15FWkO+Fux8UpNv9tXkTVtkYrd=t3c_==2k@mail.gmail.com>
X-OriginalArrivalTime: 07 Sep 2010 15:24:44.0861 (UTC)
	FILETIME=[CCD7A6D0:01CB4EA0]
X-SA-Exim-Connect-IP: 192.94.38.131
X-SA-Exim-Mail-From: Tom_Rini@mentor.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Tue, 07 Sep 2010 15:25:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Graham Gower wrote:
> On 3 September 2010 09:13, J. L. <vwyodapink@gmail.com> wrote:
[snip]
> 
>> and the other is honestly above me at the moment as I do not grasp
>> using devshell yet and how to work with in there, let alone properly
>> lay out a program recipe and then patch it to work properly. Once I
>> grasp things more I hope to be a help and not such a hindrance, I
>> welcome any tips links or anything to point to how to fix either and I
>> will try more on more with those pointers and if successful post the
>> results and maybe a patch or post the failure.
> 
> Read the OE manual. Read the Bitbake manual. Read .bb files. Read
> .conf files. Read .bbclass files. Read Bitbake sources. Send patches.
> Add time. Repeat. == expert!

I'd just like to add in that while it's great (really, I mean it), 
you're reporting problems, if you can reproduce them in vanilla OE with 
something like MACHINE=qemuarm and DISTRO=angstrom-2008.1 (or 
DISTRO=minimal) or similar, that will help rule out a lot of concern on 
our part and give a testcase we can all easily try out.

-- 
Tom Rini
Mentor Graphics Corporation


