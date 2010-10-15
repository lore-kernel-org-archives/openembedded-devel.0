Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P6ggf-0007ni-SA
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 Oct 2010 11:34:54 +0200
Received: by ywl5 with SMTP id 5so230009ywl.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Oct 2010 02:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=6zeiYh2BEYnEJhuEvngKyLjMpBELLIl2SPafKXFc/uk=;
	b=CHEbeFP4qxtrrhSUg/mqjpe1Y99UwACX3wKMze7d67VTqSmaMPxl7Gb/J9nDgRgoX+
	8IdwyrkuW8W+24H8OP1a5ti74902jP5DV1/NGL1OS6kgzFc/QuC06WMgEsXuVShCYk2d
	LamqD+hmcxnSqGspdVbmuHYeYfX8CfnEVmxT0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=l/d6D2wKXEL4utacDu4R20EHCgoHxjtZPIhRfqMeGBYbL4mbfHtqsaTcpABvfdGFpG
	o6iQLts6gXEA89cCfkXJhwQaUnvtrxPJTKNYAtpejRuqJUvka8CqpT2JT/+h4rXtoumx
	tlfik66dCyUUMsYzIgRx5LFtnvaia8AYpvjA8=
MIME-Version: 1.0
Received: by 10.42.5.144 with SMTP id 16mr347288icw.99.1287135259580; Fri, 15
	Oct 2010 02:34:19 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Fri, 15 Oct 2010 02:34:19 -0700 (PDT)
In-Reply-To: <4CB81CA3.9080601@xora.org.uk>
References: <201010151039.08619.marcin@juszkiewicz.com.pl>
	<4CB81CA3.9080601@xora.org.uk>
Date: Fri, 15 Oct 2010 11:34:19 +0200
Message-ID: <AANLkTim==BZdDSmcCssdG=Y25RyDLqe4WgLFMQHMDkQq@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: RFC: remove old kernels
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
X-List-Received-Date: Fri, 15 Oct 2010 09:34:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/15 Graeme Gregory <dp@xora.org.uk>:
> =A0On 15/10/2010 09:39, Marcin Juszkiewicz wrote:
>> Hi
>>
>> recipes/linux/ contains 235 recipes. I would like to propose cleaning:
>>
> This may be again time to discuss something I have proposed before at OED=
EM.
>
> Splitting machines out into seperate git trees, with Chris' awesome work
> on collections this is no longer hard to maintain. But will mean the
> main OE repo is free of unmaintained machines. Maintained ones will be
> obvious by the activity on their git (which doesnt even neccessarilly
> need to be hosted by OE)
>
> Graeme
>

Excellent plan!


