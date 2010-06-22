Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.alalousi@gmail.com>) id 1OR2S7-0005mg-2S
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Jun 2010 14:19:49 +0200
Received: by bwz14 with SMTP id 14so1595064bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jun 2010 05:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=BEtMmOOuhINa4h7vfW/0roXeyqQBkR9AGVFP/VXq5m4=;
	b=tFd9RBiZjqWvmiQJWCZrjGD9Vs4YmS5sAOGfY6qtYECANTRVPBA1EJqu+OdAFg3nkE
	31Yyl+OwPI0MYcdgRcvCf02/YiCSSxI04C+jFt2R2LL3OvPNxyx1hdNBtkfSqFPNeGqI
	9PnjLyofm6s7mhDebtYgEXgcpQO7IumVQo9C0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Dt3la9DUt7RfhEDDhyXsbLbJGqkXXOBd6KbjIrAXfJeoeLqsZ94XWrBKPxIs8HufN7
	AQrVUxBzxAPjJNK/QHq/bEuKAndgHyLPmMWQvKJq5ftVaC0Xx9/r2R8MmRu9kjjOgA6p
	o8bAR70iktO8XhwPpBu0qz40pWCpKPc6qQoZA=
MIME-Version: 1.0
Received: by 10.204.143.88 with SMTP id t24mr4162115bku.2.1277208909453; Tue, 
	22 Jun 2010 05:15:09 -0700 (PDT)
Received: by 10.204.58.134 with HTTP; Tue, 22 Jun 2010 05:15:09 -0700 (PDT)
In-Reply-To: <4C1F5474.6050907@eukrea.com>
References: <AANLkTilowvawMUeG_uqEzSyvsM2HwSFiKYxu5g5izYXt@mail.gmail.com>
	<4C1F5474.6050907@eukrea.com>
Date: Tue, 22 Jun 2010 13:15:09 +0100
Message-ID: <AANLkTilg_f1-6wpQQTCcWgiFdcIxEQApGhHBTx8NuF-1@mail.gmail.com>
From: "Dr. Ahmed Al-Alousi" <a.alalousi@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: a.alalousi@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Bitbaking for i.MX27
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
X-List-Received-Date: Tue, 22 Jun 2010 12:19:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Thanks for your response.

Strangely enough, I could not find niether tx27 nor mx27ads under my
conf/machine directory.

I did the usual git pull to get the OE; should I be doing something else ?


Regards,

Ahmed.

On 21 June 2010 13:00, Eric B=E9nard <eric@eukrea.com> wrote:

> Hi,
>
> Le 21/06/2010 13:17, Dr. Ahmed Al-Alousi a =E9crit :
>
>  I'm trying to get an image compiled for my Armadeus APF27 board, which i=
s
>> i.MX27-based.
>>
>> Can anyone give me any hints along the route ? Has anyone actually done
>> this
>> ?
>>
>>  you can start from machine tx27 or mx27ads which are also i.MX27 based
> and then create your own machine with these ones as an example.
>
> Eric
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

