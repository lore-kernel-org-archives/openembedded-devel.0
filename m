Received: from [74.125.92.148] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <bjorn.forsman@gmail.com>) id 1MjC5k-0003Su-VH
	for openembedded-devel@lists.openembedded.org;
	Thu, 03 Sep 2009 15:11:13 +0200
Received: by qw-out-1920.google.com with SMTP id 4so513825qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Sep 2009 05:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=x6XMmUFhpGx478wu8nDtWJb1m0esfLPzAkIx+sUWK5w=;
	b=Wa6jr1PiQauyk+JXnxakcftfni7sBMhufaqesDNlliI+TEMKg2Bm9VeZxeP3W+zgI4
	Th4YMtROFWoCFo9qOeQT8OWowFXxH9BN9+jDCQs2nUFcC8IhxjjL2WGZzpwoVvRWFcB3
	T++/z1EFb709Co+O7z3syRVirl/SF+YPGF574=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=p10QUv1JYyWCOeJlWokVDgpA0jO3BU4LXr/yvOUfEpOj/O2HSEftI/B82IkTi4IZz5
	EE2Khcdft2vjmX9mbnmN6tuhxx9syqHLhpbskLZtSDENUiWKM9XVsfU7f3BXjG5zS4WV
	2i2mt1Z8nLqPQYLG3ztawAKeSskpbj+sMtD0Q=
MIME-Version: 1.0
Received: by 10.229.1.65 with SMTP id 1mr2757254qce.20.1251982338723; Thu, 03 
	Sep 2009 05:52:18 -0700 (PDT)
In-Reply-To: <h7o6gu$fii$1@ger.gmane.org>
References: <5f2b60908120549u70fe6e00yf1df3e0e8d9bc059@mail.gmail.com>
	<h5um2o$ioq$1@ger.gmane.org>
	<5f2b60909030316q43cc1b60ic8350e68bcdb2a5c@mail.gmail.com>
	<h7o6gu$fii$1@ger.gmane.org>
Date: Thu, 3 Sep 2009 14:52:18 +0200
Message-ID: <5f2b60909030552q10d3c75eq4430bf504a8578c9@mail.gmail.com>
From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: gstreamer-ti fails for target dm6446-evm (TI davinci)
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
X-List-Received-Date: Thu, 03 Sep 2009 13:12:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/9/3 Koen Kooi <k.kooi@student.utwente.nl>:
> On 03-09-09 12:16, Bj=C3=B8rn Forsman wrote:
>>
>> 2009/8/12 Koen Kooi<k.kooi@student.utwente.nl>
>>
>>> On 12-08-09 14:49, Bj=C3=B8rn Forsman wrote:
>>>
>>> =C2=A0Any suggestions for a fix?
>>>>
>>>
>>> I'm cleaning up the arago updates and plan to push them into OE this
>>> week:
>>> http://dominion.thruhere.net/git/cgit.cgi/openembedded/log/?h=3Dkoen/dv=
sdk
>>>
>>> When that's in it should give you something that at least builds for
>>> dm6446-evm.
>>
>>
>> What is the status of the dvsdk branch? Any new ETA on the OE push?
>
> 8 days ago :)
>
> http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=3Dbac5eef9c=
8a73672ee114926011addabb36610eb
>

Oh, silly me, forgetting to do proper research. Well, thanks!

Best regards,
Bj=C3=B8rn Forsman


