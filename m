Received: from ausc60pc101.us.dell.com ([143.166.85.206])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <Sean_Hudson@Dell.com>) id 1OZ6in-0002h7-TK
	for openembedded-devel@lists.openembedded.org;
	Wed, 14 Jul 2010 20:30:30 +0200
X-Loopcount0: from 10.166.62.177
From: <Sean_Hudson@Dell.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Wed, 14 Jul 2010 13:29:53 -0500
Thread-Topic: [oe] [PATCH] Correcting APACHE mirror location for APR recipes.
Thread-Index: AcsjIFGzuLeGSbRVSeGVx4aaS4aunwAYigRA
Message-ID: <113134CF306E8E4CACC27BE5937261B20931C514D9@AUSX7MCPS303.AMER.DELL.COM>
References: <113134CF306E8E4CACC27BE5937261B20931BF148F@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTilYsPNfPjreXVd31_k4mzUDHLiyY4XlPNmJh6x-@mail.gmail.com>
	<113134CF306E8E4CACC27BE5937261B20931BF1B28@AUSX7MCPS303.AMER.DELL.COM>
	<AANLkTildsmw9qsK89yM-ta6Lj0BBJj3clWCyD8z6p1V3@mail.gmail.com>
In-Reply-To: <AANLkTildsmw9qsK89yM-ta6Lj0BBJj3clWCyD8z6p1V3@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-puzzleid: {BAB75B46-010C-46EF-8E41-9D0117453C54}
x-cr-hashedpuzzle: AW6E A7db BIou EJ72 FkYD GVDc Gdev HWZg Hrpt H6a2 IlPG
	IlUz Iwln JQkV JvZB KBkR; 1;
	bwBwAGUAbgBlAG0AYgBlAGQAZABlAGQALQBkAGUAdgBlAGwAQABsAGkAcwB0AHMALgBvAHAAZQBuAGUAbQBiAGUAZABkAGUAZAAuAG8AcgBnAA==;
	Sosha1_v1; 7; {BAB75B46-010C-46EF-8E41-9D0117453C54};
	cwBlAGEAbgBfAGgAdQBkAHMAbwBuAEAAZABlAGwAbAAuAGMAbwBtAA==; Wed,
	14 Jul 2010 18:29:53 GMT;
	UgBFADoAIABbAG8AZQBdACAAWwBQAEEAVABDAEgAXQAgAEMAbwByAHIAZQBjAHQAaQBuAGcAIABBAFAAQQBDAEgARQAgAG0AaQByAHIAbwByACAAbABvAGMAYQB0AGkAbwBuACAAZgBvAHIAIABBAFAAUgAgAHIAZQBjAGkAcABlAHMALgA=
acceptlanguage: en-US
MIME-Version: 1.0
X-OriginalArrivalTime: 14 Jul 2010 18:29:56.0138 (UTC)
	FILETIME=[8EF5B8A0:01CB2382]
X-SA-Exim-Connect-IP: 143.166.85.206
X-SA-Exim-Mail-From: Sean_Hudson@Dell.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Correcting APACHE mirror location for APR recipes.
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
X-List-Received-Date: Wed, 14 Jul 2010 18:31:10 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have not had to update checksums.  Simply updated the server location and=
 the fetches started working again.

-----Original Message-----
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
Sent: Wednesday, July 14, 2010 1:44 AM
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] Correcting APACHE mirror location for APR recipes=
.

On Tue, Jul 13, 2010 at 8:08 AM,  <Sean_Hudson@dell.com> wrote:
> It appears as though the only versions visible at the current URL are the=
 latest version. =A0To get access to the latest version, the archive URL ap=
pears to be necessary. =A0It is worth noting that the archive seems to cont=
ain the latest version too.

OK. Does this require any updates to checksums ?


>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Tuesday, July 13, 2010 1:06 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [PATCH] Correcting APACHE mirror location for APR recip=
es.
>
> On Mon, Jul 12, 2010 at 3:31 PM, =A0<Sean_Hudson@dell.com> wrote:
>> Hi all,
>>
>> =A0We recently noticed that apr and apr-util recipes were not fetching c=
orrectly.
>> =A0It appears as though the APACHE_MIRROR variable in the bitbake.conf f=
ile.
>>
>> =A0Below is a trivial patch to update the variable.
>
> I am able to see the files in existing URL. What problem did you have
>
>>
>> Regards,
>> Sean
>>
>>
>> diff --git a/conf/bitbake.conf b/conf/bitbake.conf
>> index 12a5522..71c7273 100644
>> --- a/conf/bitbake.conf
>> +++ b/conf/bitbake.conf
>> @@ -533,7 +533,7 @@ export palmqtdir =3D "${palmtopdir}"
>> =A0OE_STRICT_CHECKSUMS ?=3D "1"
>>
>> =A0ADOBE_MIRROR =3D "http://fpdownload.macromedia.com/get/flashplayer/cu=
rrent/"
>> -APACHE_MIRROR =3D "http://www.apache.org/dist"
>> +APACHE_MIRROR =3D "http://archive.apache.org/dist"
>> =A0DEBIAN_MIRROR =3D "ftp://ftp.debian.org/debian/pool"
>> =A0E_CVS =3D "cvs://anonymous@anoncvs.enlightenment.org/var/cvs/e"
>> =A0E_URI =3D "http://enlightenment.freedesktop.org/files"
>>
>>
>>
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
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


