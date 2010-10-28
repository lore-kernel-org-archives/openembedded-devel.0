Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kevin.tian@intel.com>) id 1PBI5j-0004wA-Gs
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Oct 2010 04:19:54 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Oct 2010 19:17:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.58,248,1286175600"; d="scan'208";a="621019643"
Received: from pgsmsx602.gar.corp.intel.com ([10.221.43.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2010 19:17:36 -0700
Received: from pgsmsx509.gar.corp.intel.com (172.30.13.17) by
	pgsmsx602.gar.corp.intel.com (10.221.43.81) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Thu, 28 Oct 2010 10:16:35 +0800
Received: from shsmsx601.ccr.corp.intel.com (10.239.4.112) by
	PGSMSX509.gar.corp.intel.com (172.30.13.17) with Microsoft SMTP Server
	(TLS) id 8.2.254.0; Thu, 28 Oct 2010 10:16:35 +0800
Received: from shsmsx502.ccr.corp.intel.com ([10.239.4.96]) by
	shsmsx601.ccr.corp.intel.com ([10.239.4.112]) with mapi;
	Thu, 28 Oct 2010 10:16:35 +0800
From: "Tian, Kevin" <kevin.tian@intel.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 28 Oct 2010 10:16:31 +0800
Thread-Topic: [oe] Poky 4.0 and Yocto 0.9 released
Thread-Index: Act2Hb4DPrn961jMRrOkJfcImjG6nQAJ/odA
Message-ID: <625BA99ED14B2D499DC4E29D8138F1504D12778FCF@shsmsx502.ccr.corp.intel.com>
References: <1288179182.1285.2607.camel@rex>
	<AANLkTi=e7EBjHv21UOD2Hi2Ou_9ZS1YGXB6eOXUGgdt6@mail.gmail.com>
In-Reply-To: <AANLkTi=e7EBjHv21UOD2Hi2Ou_9ZS1YGXB6eOXUGgdt6@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: en-US
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 192.55.52.88
X-SA-Exim-Mail-From: kevin.tian@intel.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Poky 4.0 and Yocto 0.9 released
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
X-List-Received-Date: Thu, 28 Oct 2010 02:19:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>From: AJ ONeal
>Sent: Thursday, October 28, 2010 5:26 AM
>
From the website it sounds like Yocto is a cross between OpenEmbedded and
>Ubuntu?

there's nothing to do with Ubuntu, which is mentioned just as one supported=
 host
system to run Yocto.

>
>It's used to build distributions in the same way that OpenEmbedded is.
>Has 6-month release cycle, including binaries, like Ubuntu.
>
>Is that correct?
>
>
>What's the difference between Poky and Yocto then?

In a nutshell, Yocto Project is the umbrella project and Poky is the build =
system utilized by
the Yocto Project.

See the FAQ:
https://wiki.yoctoproject.org/wiki/FAQ

Q: Why not just call this project Poky? What has changed between Poky and t=
he Yocto Project?

A: The Yocto Project is an umbrella project, similar to freedesktop.org. Ac=
cordingly, it includes a number of projects and resources specifically inte=
nded for facilitating development with Linux on embedded devices, and it is=
 an appropriate place for larger organizations to collaborate on the develo=
pment of build infrastructure for embedded Linux. Poky is indeed the larges=
t part of the Yocto Project, and Poky will continue as an independent, open=
 source project developing the build system used by the Yocto Project, as w=
ell as by other open source projects.

Thanks
Kevin

>
>AJ ONeal
>
>
>On Wed, Oct 27, 2010 at 5:33 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
>
>> It gives me pleasure to announce a new Poky release, Poky 'Laverne' 4.0
>> and also Yocto 0.9, the first release of the Yocto Project. For more
>> information about these, please see the new website:
>>
>> http://www.yoctoproject.org/
>>
>> Cheers,
>>
>> Richard
>>
>>
>>
>>
>>
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>_______________________________________________
>Openembedded-devel mailing list
>Openembedded-devel@lists.openembedded.org
>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


