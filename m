Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PIngA-00019Y-DA
	for openembedded-devel@lists.openembedded.org;
	Wed, 17 Nov 2010 20:28:29 +0100
Received: by gwaa11 with SMTP id a11so1404522gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Nov 2010 11:27:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=OtGkKA5emwlope+F60ZiNbfwLPXP66UCqKyf28GiMns=;
	b=fhdRyboeQQcAxdfjOANTslnX9LgtGwzUn7n1eKcVJIqvcHYQ9b4t0qvsI7hw6Fcbmr
	ykwndI6koJ1ZDpMJisCoxgpbmQUHLt8KRnB/N69w5+1Zr2mMDt5IrDRwxTFuIrm/rBoJ
	goE5sVtQ6cvVNZShwqeeV5DsY9wSODc/U2qlY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=P23VggMbJAGsTACIwnqq5ghIm10jKfNj7sftpm9HEXNGxOrE3pWRZmA4fponBErYZa
	LWEst1DMVohI+Olb9wLa+4U3paLwaR193XZr8WaOfhVVt8YXziB5kfMZKOc3ab0VoIHv
	xYlKhqrdn90lJmWD2ZZVCymMNC5fJ6GiXvTEA=
Received: by 10.91.47.38 with SMTP id z38mr12064565agj.129.1290022035611; Wed,
	17 Nov 2010 11:27:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Wed, 17 Nov 2010 11:26:55 -0800 (PST)
In-Reply-To: <4CE411AF.1060804@cbnco.com>
References: <1289482655-20086-1-git-send-email-msmith@cbnco.com>
	<AANLkTimdHUNPec=AKNXJCbwbM9UeJ0yP+d5ZNDMwVmRC@mail.gmail.com>
	<4CE411AF.1060804@cbnco.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 17 Nov 2010 11:26:55 -0800
Message-ID: <AANLkTikaG8=waSwD+Qgq6jB=KO2wY0bpGXi6SJBzO3XG@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] usbutils 0.70 & 0.73: don't set DEFAULT_PREFERENCE = "1"
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
X-List-Received-Date: Wed, 17 Nov 2010 19:28:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 17, 2010 at 9:32 AM, Michael Smith <msmith@cbnco.com> wrote:
> Khem Raj wrote:
>>
>> On Thu, Nov 11, 2010 at 5:37 AM, Michael Smith <msmith@cbnco.com> wrote:
>>>
>>> I think it may be leftover from earlier. =C2=A0Let 0.86 build by defaul=
t.
>>> Most distros already prefer it.
>>>
>>
>> does it work well with udev 141 ?
>> some uclibc based distros still use older udev
>
> I use udev 141, but not uclibc; it seems to work here.
>
ok

> Mike
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


