Received: from [213.4.149.66] (helo=ctsmtpout1.frontal.correo)
	by linuxtogo.org with esmtp (Exim 4.61)
	(envelope-from <joaquinduran@adtelecom.es>) id 1GSBL6-0003r8-Ez
	for openembedded-devel@openembedded.org; Tue, 26 Sep 2006 13:43:04 +0200
Received: from [194.179.62.31] (217.126.70.245) by ctsmtpout1.frontal.correo
	(7.2.056.6) (authenticated as joaquinduran$adtelecom.es)
	id 4517ACDD0003212A for openembedded-devel@openembedded.org;
	Tue, 26 Sep 2006 13:41:46 +0200
Message-ID: <45191EDE.8060208@adtelecom.es>
Date: Tue, 26 Sep 2006 13:36:46 +0100
From: Joaquim Duran <joaquinduran@adtelecom.es>
User-Agent: Mozilla Thunderbird 1.5.0.7 (X11/20060926)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <45190D58.2020807@adtelecom.es>
	<200609261258.59063.christopher.lang@plus.cablesurf.de>
In-Reply-To: <200609261258.59063.christopher.lang@plus.cablesurf.de>
Subject: Re: List of dependent packages
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.8
Precedence: list
Reply-To: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel@lists.openembedded.org>
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 26 Sep 2006 11:43:04 -0000
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello Chris,

This helps but it's not my idea. The main difference between the two 
procedures is the time needed to generate the image ;-) .

Anyway, thanks for your help.

Thanks and Best Regards,
Joaquim Duran


En/na Christopher Lang ha escrit:
> Joaquim,
> 
> I find "ipkg list" on the running target device very helpful. It lists all 
> packages an image consists of.
> 
> Also "ipkg info" on the target device produces some output. Here you can see 
> all packages and their dependencies.
> 
> This only works if you have an image already running on the target device.
> 
> I hope this helps.
> 
> Chris
>   
> 
> 
> Am Dienstag, 26. September 2006 13:22 schrieb Joaquim Duran:
>> Dear all,
>>
>> Is there any way to know the set of packages to be included in an
>> image? Or more generally, how can I list the set of packages (with
>> recursion) that are needed for one specified package?
>>
>> This should be done once processed the config file and updated the cache
>> and before the compilation of packages.
>>
>> Thanks and Best Regards,
>> Joaquim Duran
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 



