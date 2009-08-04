Received: from [58.185.154.238] (helo=cassis-intl.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <galvez.andy@cassis-intl.com>) id 1MYF7r-0007YK-Vx
	for openembedded-devel@openembedded.org; Tue, 04 Aug 2009 10:12:04 +0200
Received: (qmail 616 invoked by uid 509); 4 Aug 2009 15:50:31 +0800
Received: from 10.65.9.1 by postman.cassis-intl.com (envelope-from
	<galvez.andy@cassis-intl.com>,
	uid 501) with qmail-scanner-1.25-st-qms 
	(clamdscan: 0.83/1213. spamassassin: 3.0.4. perlscan: 1.25-st-qms.  
	Clear:RC:1(10.65.9.1):. 
	Processed in 0.028914 secs); 04 Aug 2009 07:50:31 -0000
X-Antivirus-MYDOMAIN-Mail-From: galvez.andy@cassis-intl.com via
	postman.cassis-intl.com
X-Antivirus-MYDOMAIN: 1.25-st-qms (Clear:RC:1(10.65.9.1):. Processed in
	0.028914 secs Process 607)
Received: from unknown (HELO galvezljxpdt1) (10.65.9.1)
	by cassis-intl.com with SMTP; 4 Aug 2009 15:50:31 +0800
Message-ID: <692E39F5C0F84D57B815E444BA48113E@sg01.cassis>
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
References: <BE93AD82B8E74B89970AC1E6DFDE5F41@sg01.cassis>
	<90E363457108403A8D1661019AF822FA@sg01.cassis>
Date: Tue, 4 Aug 2009 16:05:04 +0800
MIME-Version: 1.0
X-Priority: 3
X-MSMail-Priority: Normal
X-Mailer: Microsoft Outlook Express 6.00.2900.5512
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.5579
Subject: Re: Cannot find package angstrom-version.
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
X-List-Received-Date: Tue, 04 Aug 2009 08:12:05 -0000
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=response
Content-Transfer-Encoding: 7bit

Hi,

    Anybody can help me through this issue?

Thanks and best regards,
Andy

----- Original Message ----- 
From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
To: <openembedded-devel@lists.openembedded.org>
Sent: Tuesday, August 04, 2009 1:23 PM
Subject: Re: [oe] Cannot find package angstrom-version.


> Also, I am getting a lot of "opkg: Cannot create directory 
> `/var/lib/opkg': Permission denied" in my opkg-cl commands based on the 
> log.do_rootfs logfile.
>
> ----- Original Message ----- 
> From: "Leandro Q. Galvez" <galvez.andy@cassis-intl.com>
> To: <openembedded-devel@lists.openembedded.org>
> Sent: Tuesday, August 04, 2009 1:10 PM
> Subject: [oe] Cannot find package angstrom-version.
>
>
>> Hi,
>>
>>    I am trying to build opie-image using openembedded. while doing the 
>> do_rootfs stage, my build encountered the error below.  Anybody knows how 
>> I can get around with it? I even manually issued bitbake angstrom-version 
>> to get around it thinking that the dependency is somehow broken, it built 
>> it and it finished the build for the angstrom-version but when I re 
>> issued the bitbake opie-image, again it failed with the same error as 
>> shown below. Anybody can help?
>>
>> log_check: There were error messages in the logfile
>> log_check: Matched keyword: [Cannot find package]
>>  *  angstrom-version *
>> * Cannot find package angstrom-version.
>> + export D=/media/OpieDrive/oebase/dragon/tmp/rootfs/opie-image
>>
>> log_check: There were error messages in the logfile
>> log_check: Matched keyword: [Cannot satisfy the following dependencies]
>> Collected errors:
>> * ERROR: Cannot satisfy the following dependencies for 
>> task-base-extended:
>>  *  angstrom-version
>>
>> Thanks and best regards,
>> Andy
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



