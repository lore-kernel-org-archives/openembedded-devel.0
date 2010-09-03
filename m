Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OrLYu-0001cs-Kd
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Sep 2010 03:59:36 +0200
Received: by eyb7 with SMTP id 7so805725eyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Sep 2010 18:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=FZVhn6+iuBzkRNAewF+t7OprZkijM5vQXh6GNztUE9U=;
	b=jOM/5KTDrE2eNgBhzDnxdQ2M2c+SChocbPKrHXNg1G6Mttsn/o4zlhYW+vjKp5G7Tv
	0mfcjMX6RK0jMA90ioV7FlDsEHY5nSzHjNiGfP6LVSjms8atUJiacrxkkfcXZvOPpyze
	lATQTru/6ue7oCDVeIpQLvzVI3K/A7wp+PO/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=MJUlj2ys2ae/DT0pGyNL5OD6I4kiQCOUZ521TxCbb8RannqcINIAT9kCUx8BE4NQdJ
	nuV12gTmbeXgDVme5PQubIsFCnCZXzHyAGiQOMC3Uyp0+nELLILh0T154P/X7ALj9TVJ
	wyZJEX+gXLf4Ht8f9lxUNs6omIwjcbHNg3kZ4=
MIME-Version: 1.0
Received: by 10.216.87.18 with SMTP id x18mr44673wee.31.1283479134820; Thu, 02
	Sep 2010 18:58:54 -0700 (PDT)
Received: by 10.216.179.76 with HTTP; Thu, 2 Sep 2010 18:58:54 -0700 (PDT)
In-Reply-To: <4C804878.4060204@taitradio.com>
References: <AANLkTimsOCL0xo1Y+KL6FdmXWRcXpNf=DN2PR14tmDz0@mail.gmail.com>
	<AANLkTikBBUuSKeXh=k+G1ejHNSdMdab_ngijDiQu7POJ@mail.gmail.com>
	<4C804878.4060204@taitradio.com>
Date: Thu, 2 Sep 2010 18:58:54 -0700
Message-ID: <AANLkTimSiMkabHG_VzXJBWfDxXZcgbzfTt46pbJ7ryWK@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
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
X-List-Received-Date: Fri, 03 Sep 2010 01:59:36 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Do you know if doing a standard method of upgrading would be ok or
should I start from a full clean install? Thanks



On Thu, Sep 2, 2010 at 5:59 PM, Douglas Royds
<douglas.royds@taitradio.com> wrote:
> On 03/09/10 05:19, J. L. wrote:
>>
>> I would be interested to know as well I am building on 9.10 and seem
>> to get more errors than those building on 10.04 or 10.10 with 64 bit
>>
>>
>>
>> On Thu, Sep 2, 2010 at 8:46 AM, AJ ONeal<coolaj86@gmail.com> =A0wrote:
>>
>>>
>>> It would be worth it to upgrade from Ubuntu 8.10 to 10.04 if it really
>>> makes
>>> a difference... but it would take time and disrupt workflow and otherwi=
se
>>> provide little advantage.
>>>
>
> As an aside, you should both be aware that neither 9.10 nor 8.10 are "LTS=
"
> (long-term support) Ubuntu releases. As such, Ubuntu are no longer
> back-porting security fixes.
>
> I recommend that you both upgrade to 10.04 LTS. Ubuntu will support 10.04
> for 3 years (ie. until April 2013).
>
> Douglas.
>
>
>
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> This email, including any attachments, is only for the intended
> addressee. =A0It is subject to copyright, is confidential and may be
> the subject of legal or other privilege, none of which is waived or
> lost by reason of this transmission.
> If the receiver is not the intended addressee, please accept our
> apologies, notify us by return, delete all copies and perform no
> other act on the email.
> Unfortunately, we cannot warrant that the email has not been
> altered or corrupted during transmission.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


