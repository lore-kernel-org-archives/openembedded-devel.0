Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PLZln-0006uN-Cs
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 12:13:44 +0100
Received: by qwi4 with SMTP id 4so268657qwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 03:12:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=KQp8tu/txhdeF6k2mKK6txs3LC1BbQ6Azxo+OypG/3g=;
	b=lR2qo7MCETbayZiLsrpu26PHKln6vSqcPKWBqTmVMKpcfO1Jx26SvprX263+EUiWFt
	1MzeJlw18UNd7fn3usoTiBpKcL09TpGqzmEuKZ1uP3XouBtyn39f8WdBZeo/OILawJrw
	NnWb9WVxPQFrXdFIttl1vnhpSlDrTbdNUGSas=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=X9Fg47VJG3bA+ZIO/Bhsk1FCB6dB/YUqQcMKy6ujXLsj4EpkgxpW8qMsCal7hfJaP7
	idIDt7z+nTY9y9uVDgQ+XtYhYzUhWud4ZYggnIjDXvdMob3jcVTJP/CLpCayvZtppIC9
	IH/TVAgT/f1uLcuevH3IBX6lN+GPVYUIKshwU=
Received: by 10.229.217.133 with SMTP id hm5mr551370qcb.258.1290683547793;
	Thu, 25 Nov 2010 03:12:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Thu, 25 Nov 2010 03:12:07 -0800 (PST)
In-Reply-To: <4CEE37DC.5040503@eukrea.com>
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
	<4CEE336E.9070306@eukrea.com>
	<AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>
	<4CEE37DC.5040503@eukrea.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Thu, 25 Nov 2010 12:12:07 +0100
Message-ID: <AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: sylvain.pare@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: qwt 5.2.1 failed to build here (om-gta02 , SHR, X11)
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
X-List-Received-Date: Thu, 25 Nov 2010 11:13:44 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I can't find any obj/ directory in
SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.=
2.1/
but I have an
SHR-Build/shr-unstable/tmp/work/armv4t-oe-linux-gnueabi/qwt-5.2.1-r0/qwt-5.=
2.1/src/obj${QT_LIBINFIX}/


2010/11/25 Eric B=E9nard <eric@eukrea.com>

> On 25/11/2010 11:10, Sylvain Par=E9 wrote:
>
>> ok thanks. does some one has a clue ?
>> extracted for the log :
>>
>> Fatal error: can't create obj/qwt_abstract_scale_draw.o: No such file
>> or directory
>>
>>  does the obj directory exist ?
>
> Eric
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

