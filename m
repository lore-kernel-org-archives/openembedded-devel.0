Received: from [209.85.217.21] (helo=mail-gx0-f21.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1LPGQG-000384-V2
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jan 2009 14:13:59 +0100
Received: by gxk14 with SMTP id 14so2790237gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jan 2009 05:06:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=55G4cKOx066o4+z7PToc20tC6pSfz+9oU8YBjgSQSqQ=;
	b=cKZa1pmrfWiDVxFslEbPAnh4LvTSGe6o7x8Bcc45DlBP+kCVK4zz1lkITOSFrnKLGg
	PkwrRdC883msoT23yyboVp2Lf858CR3htSbzn5GFPLTkraKwJoADhjxVFjaUgkhm2uVR
	KStK0pZIdIjXCvnnATzN/fjPe2SySjA6FvvtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=tTRibAjl48NnUzuoRPGGuBSEn6iQq1S7VcikLZcPYu+4c3PJGLuoruYVC9lubLCeTi
	shEocHXW+bDq7kLYYHvIUdLlDrkmDkPRj7YmI5o3JqaMEnZW2vscnvECNPcmzW26rsge
	ULqZ5fCNfpJPLx1RDSKa7sPYIK7RmrfD4iQIY=
Received: by 10.150.151.20 with SMTP id y20mr829349ybd.30.1232456797419;
	Tue, 20 Jan 2009 05:06:37 -0800 (PST)
Received: by 10.151.72.5 with HTTP; Tue, 20 Jan 2009 05:06:37 -0800 (PST)
Message-ID: <74d0deb30901200506n7c7b5383jd42b9981bbeb6376@mail.gmail.com>
Date: Tue, 20 Jan 2009 14:06:37 +0100
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4975BF20.3030600@gmail.com>
MIME-Version: 1.0
References: <496CFA6B.5060108@gmail.com> <4975A314.4000006@kernelconcepts.de>
	<4975BF20.3030600@gmail.com>
Subject: Re: Ipaq 31x ...
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
X-List-Received-Date: Tue, 20 Jan 2009 13:14:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Tue, Jan 20, 2009 at 1:10 PM, Jdatalog converter
<jdatalog.converter@gmail.com> wrote:
>
> Florian
>
> I need informations to evaluate effort needed to port linux on this devic=
e.

Are detailed data sheets / developer manuals available for the
SIRFtitan SoC? Otherwise I suspect it's going to be *very* difficult,
unless you are extremely comfortable reverse engineering interrupt
controller / mmu / cache handling etc. from the wince binaries.

regards
Philipp

>
> Thanks,
>
>  Christophe
>
>
> Florian Boor a =E9crit :
>>
>> Hello,
>>
>> Jdatalog converter schrieb:
>>
>>>
>>> I'm interested to run Linux on my Ipaq 314 based on following platform =
:
>>> http://www.sirf.com/products/SiRFtitanProductInsert.pdf
>>>
>>> I don't know how to create a new file in platform subdir.
>>>
>>
>> well the most important question is: Is there a Linux port to these
>> devices already?
>>
>> Greetings
>>
>> Florian
>>
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


