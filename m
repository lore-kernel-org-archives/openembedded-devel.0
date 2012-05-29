Received: from smtp2.nedap.com ([213.160.213.92] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1SZGKE-0002ko-RP
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 08:54:39 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.83.0; Tue, 29 May 2012
	08:44:21 +0200
X-TM-IMSS-Message-ID: <9a4779be00254d93@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 9a4779be00254d93 ;
	Tue, 29 May 2012 08:44:24 +0200
Message-ID: <4FC47044.8030702@nedap.com>
Date: Tue, 29 May 2012 08:44:20 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
References: <4FBF7447.50801@nedap.com> <20120525141306.GA26768@mi.fu-berlin.de>
In-Reply-To: <20120525141306.GA26768@mi.fu-berlin.de>
Subject: Re: openjdk-7
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
X-List-Received-Date: Tue, 29 May 2012 06:54:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/25/2012 04:13 PM, Henning Heinold wrote:
> On Fri, May 25, 2012 at 02:00:07PM +0200, Jaap de Jong wrote:
>> Hi all,
>>
>> I've seen openjdk-7 in oe-core meta-java.
>> ANy plans to backport it to 2011.03-maintanance?
>>
>> Thanks!
>> Jaap
> Not for free in my spare time.
>
> Bye Henning

I can try to do it myself first.
If you are willing to give some advice for free :-)
What would be the best approach?
I made a start on it by copying some of the files out of meta-java 
(openjdk-7 branch) and put them into the 2011.03 (oe-classic) branch.
Translation stops at some point though.


