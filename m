Received: from mail-qa0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <vwyodapink@gmail.com>) id 1SNow9-00048v-G3
	for openembedded-devel@lists.openembedded.org;
	Fri, 27 Apr 2012 19:26:29 +0200
Received: by qabg1 with SMTP id g1so554181qab.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Apr 2012 10:16:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=+HTxQgUzjIEpr5JrBy30c3xuPdsXPZ9OM5Cp5M1tcmw=;
	b=X0+xYsLGJB+//QE6GaV/r5uusQp5Lt3a3hrNeHFqV/GdTgxYm2RHsBhnmIMXJ71Hml
	mcriA22rXiLwi2JMRlSF+QRj6YIssDXmP1wRW7WWohLvL6gPKLgx2otZ06XpwEQqsJPY
	Rkq6KN5zwF2Ixar71fQuVphsI+WUhqNu/LT8cD4DRQIYGiDmahkueI1r4brBKVlkCSVd
	IyDELIS/JRaYy7VwCzxKA2I0H2UH1Ed2ZBYMaA12TfksNPuLVuSh3XBfHlymHY5ZmdBj
	eTz3EP+WPJBE1R1zu771/XHkm0iyZJ/buY2qXNskqWjBpwjP1SWaSqr298cCJKWwvVGf
	T3Kg==
Received: by 10.229.135.146 with SMTP id n18mr2986292qct.44.1335547010652;
	Fri, 27 Apr 2012 10:16:50 -0700 (PDT)
Received: from [192.168.1.14] (dpc674485156.direcpc.com. [67.44.85.156])
	by mx.google.com with ESMTPS id dv1sm11285123qab.22.2012.04.27.10.16.46
	(version=SSLv3 cipher=OTHER); Fri, 27 Apr 2012 10:16:49 -0700 (PDT)
Message-ID: <4F9AD478.9010500@gmail.com>
Date: Fri, 27 Apr 2012 10:16:40 -0700
From: j <vwyodapink@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:12.0) Gecko/20120425 Thunderbird/12.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4F88ACCE.1030202@gmail.com> <4F8C9E68.9050106@gmail.com>
	<4F8CCAAA.6050406@gmail.com>
	<CAHJAAqeFgtzf1x934XB-2AP2bomie29g7Ns4Ztt51MLLaOA+hw@mail.gmail.com>
	<4F8D9245.3080908@mlbassoc.com>
	<CAHJAAqcf7O8i9tOegb=GeP9Da8z4Vgw5ohd1JgHLeQg8LTK3ig@mail.gmail.com>
	<4F8DBFF3.2060508@gmail.com> <4F8DC5B5.600@windriver.com>
	<4F8DC939.90208@gmail.com> <4F8DCFC4.9010508@gmail.com>
	<4F8DDDB7.5010605@gmail.com> <4F8E0CDF.6040401@gmail.com>
	<CAMKF1sqys83Vu1pv-_3r-RpUe894vQrwpJ1K7NCsyfHXb8vBYA@mail.gmail.com>
	<4F8E53DD.6060404@gmail.com>
	<CAMKF1spO2U+Va9pUnr9pABL9rw_Bc1GBZvrpggXNNfcUg7XrGA@mail.gmail.com>
	<4F8F8749.8000803@gmail.com>
	<CAMKF1spNs63FypJRj332WJzwL9M_eoMFqbiVYzM7BLCim6-9MQ@mail.gmail.com>
	<4F90B056.5020209@gmail.com> <4F9144BE.1070508@mlbassoc.com>
	<4F91A4E4.2090608@gmail.com> <4F932ADB.7040003@gmail.com>
	<4F970F9C.7030508@gmail.com>
	<1335300289.3133.136.camel@x121e.pbcl.net>
	<4F9713C4.2020908@gmail.com>
	<1335301431.3133.144.camel@x121e.pbcl.net>
	<4F9717ED.9020503@gmail.com>
In-Reply-To: <4F9717ED.9020503@gmail.com>
Subject: Re: [oe-core] 3 build machines all failing in the same manner - was:ld segfault cant figure it out
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
X-List-Received-Date: Fri, 27 Apr 2012 17:26:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/24/2012 02:15 PM, j wrote:
> <snip>
>
> Thank you

After updating all build machines again last night to the most recent OE 
and letting each download new source files. none segfaulted in the 
resulting build, qa.log has a few similar entries and some new ones, but 
all appears to be good. Testing first image now, first quick run through 
shows even the SDK installed properly this time.

Thanks for whatever the fix was and for putting up with and helping me 
with suggestions and information.


