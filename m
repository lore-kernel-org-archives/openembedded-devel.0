Received: from na3sys009aog106.obsmtp.com ([74.125.149.77])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <douglas.royds@taitradio.com>) id 1OrKzB-0002zd-LA
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 03:23:03 +0200
Received: from source ([209.85.212.44]) by na3sys009aob106.postini.com
	([74.125.148.12]) with SMTP
	ID DSNKTIBNsRlg9snY/V42mWHRkcRv82RtPqCX@postini.com;
	Thu, 02 Sep 2010 18:22:00 PDT
Received: by mail-vw0-f44.google.com with SMTP id 10so930714vws.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 18:21:53 -0700 (PDT)
Received: by 10.220.123.160 with SMTP id p32mr88400vcr.80.1283475520017;
	Thu, 02 Sep 2010 17:58:40 -0700 (PDT)
Received: from [172.25.116.150] ([202.37.96.126])
	by mx.google.com with ESMTPS id m30sm735343vbr.9.2010.09.02.17.58.37
	(version=SSLv3 cipher=RC4-MD5); Thu, 02 Sep 2010 17:58:38 -0700 (PDT)
Message-ID: <4C804878.4060204@taitradio.com>
Date: Fri, 03 Sep 2010 12:59:36 +1200
From: Douglas Royds <douglas.royds@taitradio.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
	<AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
In-Reply-To: <AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
X-SA-Exim-Connect-IP: 74.125.149.77
X-SA-Exim-Mail-From: douglas.royds@taitradio.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_MED,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Does the OS make a difference?
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
X-List-Received-Date: Fri, 03 Sep 2010 01:23:03 -0000
X-List-Received-Date: Fri, 03 Sep 2010 01:23:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/09/10 05:19, J. L. wrote:
> I would be interested to know as well I am building on 9.10 and seem
> to get more errors than those building on 10.04 or 10.10 with 64 bit
>
>
>
> On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal<coolaj86@gmail.com>  wrote:
>    
>> It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it really makes
>> a difference... but it would take time and disrupt workflow and otherwise
>> provide little advantage.
>>      

As an aside, you should both be aware that neither 9.10 nor 8.10 are 
"LTS" (long-term support) Ubuntu releases. As such, Ubuntu are no longer 
back-porting security fixes.

I recommend that you both upgrade to 10.04 LTS. Ubuntu will support 
10.04 for 3 years (ie. until April 2013).

Douglas.




=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
altered or corrupted during transmission.
=======================================================================



