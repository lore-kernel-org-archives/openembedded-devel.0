Received: from mail-pz0-f192.google.com ([209.85.222.192])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NNnfU-00033p-UD
	for openembedded-devel@lists.openembedded.org;
	Thu, 24 Dec 2009 14:23:56 +0100
Received: by pzk30 with SMTP id 30so5623991pzk.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Dec 2009 05:21:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:to:subject
	:references:date:mime-version:content-transfer-encoding:from
	:organization:message-id:in-reply-to:user-agent;
	bh=2z/XBeIPDN1X4YJdhysk/sg+8murWeq8DMFenTdB+uo=;
	b=lOMsZCFn8KeqDGeOOHcz67dNW395DhChwESktBPYA4A4VRDqSsavHFL0/2aSVTzD1b
	fMRK3hAnJbeUiAfWGibAPQ4x3S+kAMzaXLcnu8r6hAhxIHQk+gv2pFjUSGlZRiTKiEEe
	phMbDjGK5sWpOxNur141YZHP9bcRSr223BCXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:to:subject:references:date:mime-version
	:content-transfer-encoding:from:organization:message-id:in-reply-to
	:user-agent;
	b=daEp0XFxHPu8KcljSlAdYVYmBnsTRtLuULI8m3VWgSWzJnrAoeGbDL14hWslnfdAB3
	SuifJ09ckJhF9tfYL3hulyLzb8noM5JTFanYrCTNbCfuurSVPeUOhMF9vjmBehMnbfr1
	9r0DUf3kKV0oRw6nmPOA5tPChCf1AJdYFPL9k=
Received: by 10.141.89.11 with SMTP id r11mr8156397rvl.285.1261660918385;
	Thu, 24 Dec 2009 05:21:58 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.69.101])
	by mx.google.com with ESMTPS id 22sm7782993pzk.2.2009.12.24.05.21.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 24 Dec 2009 05:21:57 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
References: <op.u5fqn7fimn1qzu@guohr-laptop-ubuntu>
	<4B336493.9060706@balister.org>
Date: Thu, 24 Dec 2009 21:21:51 +0800
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u5f12pnlmn1qzu@guohr-laptop-ubuntu>
In-Reply-To: <4B336493.9060706@balister.org>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.222.192
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: auto report bug onto bugzilla when building failure
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
X-List-Received-Date: Thu, 24 Dec 2009 13:23:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: Quoted-Printable

Yes, I understand that

=E5=9C=A8 Thu, 24 Dec 2009 20:54:43 +0800=EF=BC=8CPhilip Balister <phili=
p@balister.org>  =

=E5=86=99=E9=81=93:

> On 12/24/2009 04:15 AM, Guo Hongruan wrote:
>> Hi guys?
>> I found seppuku.bbclass and have some question about it.
>>
>> 1. Is it used to report building bug onto bugzilla automatically?
>> 2. If so, anyone can give me some hint about how to use it?
>> 3. will the bugzilla it reports automatically be related with
>> http://tinderbox.openembedded.net/?
>
> We found that automatically reporting things into bugzilla was not suc=
h  =

> a good idea. You end up with a lot of "bugs" that are user configurati=
on  =

> issues that end up being hard to close without being arbitrary.
>
> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel=



-- =

Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


