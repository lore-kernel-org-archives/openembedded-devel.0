Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kevin.tian@intel.com>) id 1PEzex-0001mg-5k
	for openembedded-devel@lists.openembedded.org;
	Sun, 07 Nov 2010 08:27:28 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 07 Nov 2010 00:26:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.58,309,1286175600"; d="scan'208";a="854912059"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga001.fm.intel.com with ESMTP; 07 Nov 2010 00:26:30 -0700
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Sun, 7 Nov 2010 15:26:29 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi; Sun, 7 Nov 2010
	15:26:29 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Sun, 7 Nov 2010 15:26:27 +0800
Thread-Topic: [oe] OpenEmbedded and the Yocto Project
Thread-Index: Act99ft/cmizEmHfR7OhZzerTeNdvgAVsxmg
Message-ID: <625BA99ED14B2D499DC4E29D8138F1504D190FD7BE@shsmsx502.ccr.corp.intel.com>
References: <1288973274.28481.15978.camel@rex>
	<AANLkTi=9baSJYxwULah-FNS50gaK9bhF=aBG-4-ChrrP@mail.gmail.com>
	<4CD5C21F.2000006@balister.org>
In-Reply-To: <4CD5C21F.2000006@balister.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.55.52.93
X-SA-Exim-Mail-From: kevin.tian@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OpenEmbedded and the Yocto Project
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
X-List-Received-Date: Sun, 07 Nov 2010 07:27:28 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>From: Philip Balister
>Sent: Sunday, November 07, 2010 5:01 AM
>
>On 11/06/2010 01:26 PM, Cliff Brake wrote:
>> On Fri, Nov 5, 2010 at 12:07 PM, Richard Purdie<rpurdie@rpsys.net>  wrot=
e:
>>
>>> So what do I mean by hard? First there are the conversations with your
>>> legal department where some questions arise:
>>>
>>> * How do you ensure license compliance?
>>> * When someone makes a change, how do you know the license is still
>>>   correct?
>>> * You've mixing GPLv2 and v3? How are you ensuring no contamination?
>>> <cue a long discussion which I'd bet most companies have>
>>
>> Is GPLv3 the issue here with patent, DMC, and Tivoization issues?  Is
>> the solution to simply not have GPLv3 software in a device?
>>
>> Are there other license issues that companies are worried about?
>
>Cliff, I think each company has it's own licensing issues. The important
>thing for OE is to make sure our license fields are accurate.
>

Accurate and controllable so that you can easily come up a build which does=
n't
contain sensitive licenses your customer are concerned and instead picks an
alternative serving same functionality if possible. :-)

Thanks
Kevin


