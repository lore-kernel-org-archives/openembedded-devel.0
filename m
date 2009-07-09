Received: from [209.85.220.207] (helo=mail-fx0-f207.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ihar.hrachyshka@gmail.com>) id 1MOuNC-0006Gp-W0
	for openembedded-devel@lists.openembedded.org;
	Thu, 09 Jul 2009 16:13:22 +0200
Received: by fxm3 with SMTP id 3so169260fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jul 2009 07:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=2ilThVo25lxZXNq4CqWQet8YSAwGBsmoQ+7j+cXNas0=;
	b=r7So7+S/2MZYbJAJg6UmUynLgLKWNgnQzS16tCyW7AY8PpXSzn1rgUobuWbNggbvkm
	Img9ofOa703N4KRPC49LBDRWHHLLxaZr2DnOMSc5FaciCQNIih/WdWY/6TOWvHBud0uo
	Vo+mlsqVZB/2Ao2v9SOA4/fXSLfow2+OoayM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=hs/ryfJeoU9UfIMVX3MxMtmCrlLlbvt9IsmT70Mh0N4e4uYfPIwB1nW9bTVmD2gdaQ
	1fUMz4ffj2o6XZUplcgxODq+zpTRYuL8CwR5zQKGGtLmdg4HxmDBwHHEXPgcVVVdFlRd
	FMdWcfTNO36HkoqyAQ2gLmgJD1A/j5K9+x+cc=
MIME-Version: 1.0
Received: by 10.103.179.1 with SMTP id g1mr457945mup.57.1247148031053; Thu, 09 
	Jul 2009 07:00:31 -0700 (PDT)
In-Reply-To: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
References: <be7a9f3d0907090612k3babae30h64d0424a4fe8dcc0@mail.gmail.com>
Date: Thu, 9 Jul 2009 17:00:31 +0300
Message-ID: <fce2a370907090700x29f926a7u6d1fe8d996846c93@mail.gmail.com>
From: Ihar Hrachyshka <ihar.hrachyshka@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [RFH] Stable qemu-native BROKEN
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
X-List-Received-Date: Thu, 09 Jul 2009 14:13:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 9, 2009 at 4:12 PM, Otavio Salvador<otavio@ossystems.com.br> wr=
ote:
> Hello,
>
> Last changes on stable has broken qemu and it doesn't compile anymore for=
 me.
>
> It would be nice i f someone could take a look at it =C2=A0since it is
> quite critical for stable.
>
> Attached the log.

No log.

>
> --
> Otavio Salvador =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0O.S. Systems
> E-mail: otavio@ossystems.com.br =C2=A0http://www.ossystems.com.br
> Mobile: +55 53 9981-7854 =C2=A0 =C2=A0 =C2=A0 =C2=A0 http://projetos.ossy=
stems.com.br
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


