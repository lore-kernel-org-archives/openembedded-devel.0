Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Osx9Z-0005N9-9h
	for openembedded-devel@lists.openembedded.org;
	Tue, 07 Sep 2010 14:19:58 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 80D361660934; Tue,  7 Sep 2010 06:19:18 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id F19AE166092B;
	Tue,  7 Sep 2010 06:19:17 -0600 (MDT)
Message-ID: <4C862DC5.1020605@mlbassoc.com>
Date: Tue, 07 Sep 2010 06:19:17 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C862985.9050205@mlbassoc.com> <4C862B28.9090309@eukrea.com>
In-Reply-To: <4C862B28.9090309@eukrea.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: =?ISO-8859-1?Q?Eric_B=E9nard?= <eric@eukrea.com>
Subject: Re: opkg install without feed
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
X-List-Received-Date: Tue, 07 Sep 2010 12:19:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 09/07/2010 06:08 AM, Eric B=E9nard wrote:
> Le 07/09/2010 14:01, Gary Thomas a =E9crit :
>> Is there any way to install a .ipk file, without loading it
>> from one of the defined feeds? This would be akin to the
>> yum localinstall operation?
>>
>> Sometimes I have a locally created .ipk file and it's cumbersome
>> to get it into my feed setup. It would be nice to be able to
>> just install it directly.
>>
> I think you can run
> opkg install file.ipk

Cool, that worked :-)  n.b. I thought I had tried this and failed
in the past!

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


