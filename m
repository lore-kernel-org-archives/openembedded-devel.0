Received: from mail-pb0-f52.google.com ([209.85.160.52])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UFY93-00053o-Ut
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 Mar 2013 23:58:11 +0100
Received: by mail-pb0-f52.google.com with SMTP id ma3so345648pbc.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 12 Mar 2013 15:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=v7e6odxnueum13r+zATCBeVEkrtsUfElvQlvOz1Pzw8=;
	b=LUfybzbYHD9QOmmQuIFqAh1xx3ltoFRu7Xyyr0EbEJrqCSUpJoeBSMZOrym7VvdeoS
	/+dPBrkTKLWUG3J2fc6Sxueq5hfC01gZ9AVogMDCe2FBUM4EOOQTI52GV8jMzj+pOakN
	8TKBgfF/Guj4VX6Ddpp+x3sNdBUFeyCfxUoWePiaoUS1ClMUbnphwr6muSskztqiUbHR
	CeaOaw4AjvieWAYuM8SZaoCxyzGGxSOa++eix3ebv/LWFlAdfTSGqQlPFpc5wlm9CqAj
	0Jgf7CrsnQqs9luSscW3mUfEYTFtIu1qUGTh2RJxR11vaX7OHPMT1GXYDN6s+waPRzm3
	50Ow==
X-Received: by 10.68.189.199 with SMTP id gk7mr33506846pbc.164.1363128089129; 
	Tue, 12 Mar 2013 15:41:29 -0700 (PDT)
Received: from [172.23.7.5] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id pn9sm26776581pbb.22.2013.03.12.15.41.27
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 12 Mar 2013 15:41:28 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.2 \(1499\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130312211938.GA11498@windriver.com>
Date: Tue, 12 Mar 2013 15:41:29 -0700
Message-Id: <4C920E00-4E5F-47FF-9DB5-FCE7AE02E08B@gmail.com>
References: <20130312211938.GA11498@windriver.com>
To: openembedded-devel@lists.openembedded.org
X-Mailer: Apple Mail (2.1499)
Subject: Re: question on App bitsize - need the same as the kernel (multilib situation)
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
X-List-Received-Date: Tue, 12 Mar 2013 22:58:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Mar 12, 2013, at 2:19 PM, Amy Fong <amy.fong@windriver.com> wrote:

> I need to build an application that has the same bitsize as the =
kernel. But in
> my multilib configuration, the default usersapce bitsize is not the =
same as=20
> the kernel's bitsize. How do you do this?

which arch is this ?
since generally we have one in multilib combo that matches kernel bit =
size
but you might have left it out.=20

>=20
> Thanks!
> Amy
>=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



