Received: from [195.65.72.27] (helo=bagnes.atmel.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1Li8HY-0006HA-0B
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 15:22:40 +0100
Received: from fribh01.corp.atmel.com (FRIBH01 [10.175.30.10])
	by bagnes.atmel.com (8.13.8+Sun/8.13.8) with ESMTP id n2DEH6qA001743
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 07:17:06 -0700 (PDT)
Received: from frimb01.corp.atmel.com ([10.175.30.12]) by
	fribh01.corp.atmel.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 13 Mar 2009 15:22:18 +0100
Received: from Glamdring ([172.24.48.94]) by frimb01.corp.atmel.com with
	Microsoft SMTPSVC(6.0.3790.3959); Fri, 13 Mar 2009 15:22:17 +0100
Message-ID: <013a01c9a3e7$1a432270$5e3018ac@Glamdring>
From: "Ulf Samuelsson" <ulf.samuelsson@atmel.com>
To: <openembedded-devel@lists.openembedded.org>
References: <1236900736.26901.8.camel@grond.atmel.com><200903131347.11719.marcin@juszkiewicz.com.pl><49BA58F3.6050701@balister.org>
	<69E6C70090A0A14498CC98FAE5E06B6E3CF730@hiob.intern.dresearch.de>
Date: Fri, 13 Mar 2009 15:19:17 +0100
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.3138
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.3350
X-OriginalArrivalTime: 13 Mar 2009 14:22:18.0577 (UTC)
	FILETIME=[1D93D410:01C9A3E7]
Subject: Re: PARALLEL_MAKE
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
X-List-Received-Date: Fri, 13 Mar 2009 14:22:40 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit


>> A while back you mentioned a program that displayed the per core CPU 
>> utilization. What was it again?
> 
> Try htop.

On OpenSuSE you just right click on the bottom bar, and add the 
CPU Frequency meter. I added it 8 times, and configured
for each Virtual CPU in the Core i7.

It does not give you utilization, only frequency.
When not used, it is humming along quietly at 1.6 GHz,
and when used, then it ups the frequency to 2.67 GHz,

Best Regards
Ulf Samuelsson 




