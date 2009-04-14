Received: from [209.85.198.246] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ticktock35@gmail.com>) id 1LtfRM-00046f-To
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Apr 2009 12:00:56 +0200
Received: by rv-out-0708.google.com with SMTP id k29so2200798rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Apr 2009 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=VArDr77oJY6/s8Vqumt9UwToKaYFencg8JeFxfy78cI=;
	b=pU6mDXSxcHLB8LebzooLsfbt27QoI9myhyfL2WhlAIGCmsOi3qZBfkPUWiTl33EoND
	qtEQ6fLRNEcWUYsHPipy2OU9sq7qvoA++1Nt/OQSON1lFKpBSrSj8riipWhp1cfS/dwH
	Zu2MxGlcu/M5/FpvuYhiCFp/4qHxrRtnpXxj8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=sZaVorF48e86aoTiyl1uPpke/F0rp+jRtpG6sVYqbOy4EhCT5/mUPRkyEN/uBnUhto
	uvFGQ5KnwobPaCdV4UCIAF8CrgAjJVOyHtkwozIA6Q1kwHhPOkhG0mWf+71NFDK/dWfZ
	qRD/feKPiJ5XeJFKxbSW8+fjDFyasij5uiL2Y=
MIME-Version: 1.0
Received: by 10.141.63.16 with SMTP id q16mr458252rvk.278.1239703008624; Tue, 
	14 Apr 2009 02:56:48 -0700 (PDT)
In-Reply-To: <565965130904122050y1ae4c29bje7a68297629367ef@mail.gmail.com>
References: <565965130904120524l46b9e4e7x4e8762ad9cbb1f6d@mail.gmail.com>
	<565965130904120819v5fde7a0fq8bf08a6fc6db08d5@mail.gmail.com>
	<grtddg$83m$2@ger.gmane.org>
	<565965130904122050y1ae4c29bje7a68297629367ef@mail.gmail.com>
Date: Tue, 14 Apr 2009 17:56:48 +0800
Message-ID: <565965130904140256s12897446ufcd9214c6236a802@mail.gmail.com>
From: Tick <ticktock35@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.198.246
X-SA-Exim-Mail-From: ticktock35@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=5.0 tests=AWL,BAYES_00,RDNS_NONE
	autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:14:11 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: bb file of madbutterfly
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
X-List-Received-Date: Tue, 14 Apr 2009 10:01:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
  I had push the madbutterfly bb file.

Cheers,
Tick

On Mon, Apr 13, 2009 at 11:50 AM, Tick <ticktock35@gmail.com> wrote:
> Hi Koen,
> =C2=A0Thanks a lot.
> Cheers,
> Tick
>
> On Mon, Apr 13, 2009 at 2:54 AM, Koen Kooi <k.kooi@student.utwente.nl> wr=
ote:
>> On 12-04-09 17:19, Tick wrote:
>>>
>>> +++ b/recipes/madbufferfly/madbutterfly_git.bb
>>
>>> +PE =3D "0"
>>> +PR =3D "r0.3"
>>
>> Remove those and add PV.
>>
>> regards,
>>
>> Koen
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>


