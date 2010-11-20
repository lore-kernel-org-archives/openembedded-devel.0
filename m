Received: from mail.infrascan.de ([188.40.84.136] helo=infrascan.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <schwarzkopf@sensortherm.de>) id 1PJnWp-0004EG-Nq
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Nov 2010 14:30:56 +0100
Received: from [192.168.178.20] (77-22-235-200-dynip.superkabel.de
	[77.22.235.200])
	by email.infrascan.de (Postfix) with ESMTPSA id 4D4591B40D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 14:31:02 +0100 (CET)
Message-ID: <4CE7CD4B.2030804@sensortherm.de>
Date: Sat, 20 Nov 2010 14:29:47 +0100
From: Klaus Schwarzkopf <schwarzkopf@sensortherm.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101027 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4CE64779.3020802@sensortherm.de> <ic5k25$ksc$2@dough.gmane.org>
In-Reply-To: <ic5k25$ksc$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 188.40.84.136
X-SA-Exim-Mail-From: schwarzkopf@sensortherm.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: buildserver
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
X-List-Received-Date: Sat, 20 Nov 2010 13:30:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

i think, ti and oe make a great job and i love the framework!!!

But the ti-codecs-dm355_3.10.00.00.bb don't work on my machine.
Could it be, that the autobuilder doesn't clean the download and temp 
directory?

I can also have a misconfiguration!

Greetings

Klaus



Am 19.11.2010 11:37, schrieb Koen Kooi:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 19-11-10 10:46, Klaus Schwarzkopf wrote:
>> Hi,
>>
>> i have some problems with the ti recipes, see my emails on the list.
>>
>> The two problems are:
>> * the recipes are out of date and don't work.
>
> Why do you say that? They are currently tracking the state of the
> unreleased upcoming SDK, so from a TI POV they are from the future!
> Furthermore, they all build and work. An autobuilder builds them for all
> TI boards multiple times per day and tinderbox is all green.
> And on the boards we test, the resulting packages work.
>
>> * the recipes can't download the source files.
>
> Read the recipes, not all sources can be downloaded with wget, some
> require certification.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFM5lOFMkyGM64RGpERAqWbAJ0a8vPcNVIo8WI/V3Yf/MdEGofS3ACeLbQJ
> vimYfl63vA/AAWPLik6M7OM=
> =wlhc
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



