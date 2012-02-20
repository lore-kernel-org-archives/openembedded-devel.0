Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1RzRPd-0002Ez-S2
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 12:28:09 +0100
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Mon, 20 Feb 2012
	12:19:51 +0100
X-TM-IMSS-Message-ID: <9d7009dc000eacac@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 9d7009dc000eacac ;
	Mon, 20 Feb 2012 12:19:56 +0100
Message-ID: <4F422C57.8080609@nedap.com>
Date: Mon, 20 Feb 2012 12:19:51 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.26) Gecko/20120131 Lightning/1.0b2 Thunderbird/3.1.18
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>	<20120219002734.GA9459@sakrah.homelinux.org>
	<20120219184455.GA26592@rhein.zuhause.netz>
In-Reply-To: <20120219184455.GA26592@rhein.zuhause.netz>
Subject: Re: [oe-classic][PATCH 00/12] openjdk
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
X-List-Received-Date: Mon, 20 Feb 2012 11:28:09 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

What would be the best approach to backport to 2010.12?
I volunteer to backport and do some testing...

On 02/19/2012 07:44 PM, Henning Heinold wrote:
> On Sat, Feb 18, 2012 at 04:27:34PM -0800, Khem Raj wrote:
>> On (18/02/12 22:20), Henning Heinold wrote:
>>> Hi,
>>>
>>> in good old tradition I send this patches for review against
>>> older openembedded.dev branch. It makes openjdk buildable
>>> again and updates it to version 1.11.1.
>>> Work was sponsored by Koan s.a.s. If nobody objects I will
>>> commit it on monday.
>> the patches look sane. Two things I would think will be nice is
>> 1. are these patches needed on 2011.03 branch ? if yes please submit
>> the pull request for the maintenance branch too
> When there is someone who needs them in 2011.03 he can test and make a pull request.
>
>> 2. Are any of these patches needed for meta-java or any other
>> layer then they should be forwarded ported to respective layer
>> as well
> As beeing the meta-java maintainer only the 1.11.1 recipe will be soon in meta-oe,
> when I find the time.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


