Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sylvain.pare@gmail.com>) id 1PLwjt-0005FL-Ev
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Nov 2010 12:45:18 +0100
Received: by qwg5 with SMTP id 5so620394qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Nov 2010 03:44:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=+vlUmdwtxAV6vDO6+mAJOArDTxYK0xr2oUowTpXZ9xQ=;
	b=S2HrcCsCJwy2QwiG1TT41JJTRecenZF8YCbfppd5FtylBxPuQTu+8SCBJqbb5koBMz
	TJ1E9iZEYsdt1jdqgGHWc4nK1CyFjHL+tLrADcCZChyxiBh3mPhc92FGUxB8nh9nAhp4
	qQOXLsODzwIHKv2eja1g2Exx/YIwdjonzo+M0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=TaBJRkSkdt/WuqiJJJrIS6IWAmpJmKveVMY8jdHgypj3EeqqM5kG4uz44Dz2K3Mn8h
	o/EsGj7Qq9MsLqGNYeG0T2hsNA1RH+JAwksMtK9S5WbI43McelmGHarZWx1UvAa3D3Np
	H4mOcicPDbBDGk6Abiy5dtbUd7m1snHFufoAg=
Received: by 10.229.110.8 with SMTP id l8mr1683170qcp.144.1290771840765; Fri,
	26 Nov 2010 03:44:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.185.81 with HTTP; Fri, 26 Nov 2010 03:43:40 -0800 (PST)
In-Reply-To: <AANLkTimC8-wg+27EC520J5kSgineOueVBS9iJR1-AqB-@mail.gmail.com>
References: <AANLkTimpVmdKm5PcXijkpVm7uDUoNrFOupzddth1gRsM@mail.gmail.com>
	<4CEE336E.9070306@eukrea.com>
	<AANLkTiktUcmsYsQh-VFJtWTgpyzbQVmLgg7WuxEJkipW@mail.gmail.com>
	<4CEE37DC.5040503@eukrea.com>
	<AANLkTinr=RQ068ABqe8XVsrPpn+iyV9ecFT4n1VuiQTm@mail.gmail.com>
	<4CEE4AB9.8050505@eukrea.com> <20101125123845.GO3274@jama>
	<AANLkTi=tM7VYvnfq7+1RHy0mMtvgvxE+Ksc37t4D5vuJ@mail.gmail.com>
	<4CEE8B9A.8040603@eukrea.com>
	<AANLkTimC8-wg+27EC520J5kSgineOueVBS9iJR1-AqB-@mail.gmail.com>
From: =?ISO-8859-1?Q?Sylvain_Par=E9?= <sylvain.pare@gmail.com>
Date: Fri, 26 Nov 2010 12:43:40 +0100
Message-ID: <AANLkTik1NfSmyoXgvf1Pqb94Wt-W1edBYjAfNAwbjLyp@mail.gmail.com>
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
X-List-Received-Date: Fri, 26 Nov 2010 11:45:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Thx Eric

2010/11/25 Sylvain Par=E9 <sylvain.pare@gmail.com>

> yes I did thoses changes
> http://pastebin.com/5x9Gaxm7
> and it has build successfully .
>
> 2010/11/25 Eric B=E9nard <eric@eukrea.com>
>
>> Hi Sylvain,
>>
>>
>> On 25/11/2010 16:40, Sylvain Par=E9 wrote:
>>
>>> I don't have acces to OE.
>>> Eric can you do that please ?
>>>
>>>  can you please test the patch and say if that solves your problem ?
>>
>> Thanks
>> Eric
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
>

