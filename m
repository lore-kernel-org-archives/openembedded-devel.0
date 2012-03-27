Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SCUY4-0003hI-6M
	for openembedded-devel@lists.openembedded.org;
	Tue, 27 Mar 2012 13:26:48 +0200
Received: by vbbfr13 with SMTP id fr13so3614920vbb.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Mar 2012 04:17:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DPEZ3njRguV+m6xqBn1Xi+Wtv1huAJFTdvdKNdeHq3A=;
	b=x/koCpGPM6/fjeUFFKeaaqT+6RKmPVGpPyWjdspSP80phRnyVV4SFwZB34RWFysWlp
	MBsU2ZNiki4Uqu+Xqhgx8QoBD6Yy7VVb8DbSNRsNxpn0qFWsrUzK29Y9hs+x5mgJwbHK
	pDvgrHeHPEEEZ3wIh0Tp/kAcrS3vnSssYzAmG5R+0kx7twStl8y4kQ4C2w+6BCMD4auN
	Bnquwgoh1YrupjGoP94rPVzrpb62HcXKtV9j55+xksKlw6yPo+xPaVFyCJZ1OIcU3lo/
	rbDOGHkJGTXpznWko6ju+cNIfSbciduhmvJ+yDYvQpqwFNGPKKflYJVmaONO47DexYRR
	WFsA==
MIME-Version: 1.0
Received: by 10.220.58.197 with SMTP id i5mr5354760vch.38.1332847066950; Tue,
	27 Mar 2012 04:17:46 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.7.208 with HTTP; Tue, 27 Mar 2012 04:17:46 -0700 (PDT)
In-Reply-To: <CALbNGRReWAk12G3z9u1rkP=G=N5B2oQyX-joZsbYAsviSRfvQg@mail.gmail.com>
References: <1332263919-19283-1-git-send-email-koen@dominion.thruhere.net>
	<1332263919-19283-3-git-send-email-koen@dominion.thruhere.net>
	<CALbNGRQpfgBgu-nSax+5r9ucXLKsQYZr+QJOGx2JLjZR3zTUpg@mail.gmail.com>
	<CALbNGRRq6C-mO_LG6YRpu_8VPHKv2gZrYsEkgVRM04TjO=+Egw@mail.gmail.com>
	<CALbNGRSB1YTihC36UL1d3M92gz+GyOjXY=D3nHZxfvFVD37nfw@mail.gmail.com>
	<CAP9ODKrnm4QuLpSgg_19iVFB7sPTtq2QG_jd63+omDRZD6fPPg@mail.gmail.com>
	<CALbNGRReWAk12G3z9u1rkP=G=N5B2oQyX-joZsbYAsviSRfvQg@mail.gmail.com>
Date: Tue, 27 Mar 2012 08:17:46 -0300
X-Google-Sender-Auth: FoNGO5LJqH2aXZlOMNAPdLFzjhE
Message-ID: <CAP9ODKrDTsgtKPu0wwb-dkE05Pb=X92qWbjW2CeLW=eAgGHGVw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe 3/4] udev: remove 173
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
X-List-Received-Date: Tue, 27 Mar 2012 11:26:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 27, 2012 at 03:20, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, Mar 27, 2012 at 4:20 AM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> NACK! 175+ breaks libertas ... or has it been fixed?
> 177+ breaks we have 175 left

So, fine by me.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


