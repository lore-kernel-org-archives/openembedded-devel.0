Return-Path: <marek.belisko@gmail.com>
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
	[209.85.221.44])
	by mail.openembedded.org (Postfix) with ESMTP id 10EC57DF85
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 10:11:28 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id c2so4348974wrm.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 May 2019 03:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=1Mw4xyIoLpAukC5C6zfvPTwD1Wo/ebbBsJLVTlW0fzQ=;
	b=jI98KaI5ygeWFXLMhLWkb/Vg0HDR+f+e/n+LW6F+8W5opTgrSDSY3LRmQ+28qbHOVh
	6HVK+/PpaW3HPElxw3bVYQh87I7FdrJB/2vj4roDRZVSSCwgP2/PUIKEzeNaJHUOrJkC
	ANigtdwkUiM+9QIeg4wNA5bzKVLwO9olTurnpzeSSD0OExptwWosfkDNKrhhMW29ioDp
	PcuQDMYhSLF+Y36SLrOvu1nu9SwiHkjwa+6xKWsVjyBIuuh9PETg9InXeTdoc2DkltYE
	+iW7Un14CS0BaoiKGi/aUe6x/ltheQk6PEACgYBvES2XbrI/BlJ+fQFRnBKBaKEY4lW0
	5ebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=1Mw4xyIoLpAukC5C6zfvPTwD1Wo/ebbBsJLVTlW0fzQ=;
	b=ZnpXjSZXcOljIK4QUgBtpxQIQBdIn+cOfPV1Zhn81i6TFvFDogaFubeQEEELY9XgM+
	BsaG/X91R2L1CZuu2Wmdxt0PHUCdWnbmbLhd4Mah0wIEZQg5TH+v+nNEo5JCjHC5eiSY
	vEiETI1v+a4yLmF0MGmvfK1ZIQGg97nYc3+LQOQaC3LtasZIW/6wmOgB8sJ01l9BRIBn
	pDNvB66JW2vomOfwOjfurtR6DJw7Oo+FtcmFx+myQSTlTyx4qmeVJD0eo3LL6g2x58Cu
	muqPGVnGNCD+RCleVt+hiWVM88pSmXp092u3h3dPxBg7GwSONoUGtHod9f4mkGT7Eo9j
	Bsng==
X-Gm-Message-State: APjAAAVP5mBfVD6g1q5QLSo2ADKpi+0Y2FKiZOc59hcnVIyQdt85Q9B9
	KXauxhK7H+038dmBeo7kKffA8pq0sf1RXQeVPTE=
X-Google-Smtp-Source: APXvYqzvWxVrOyhwIaVV9ZwBJVbreH/q6cslduleVqEGAfDcIXI8Cg28IxTttS39a2TOZqb2rhwLVcD0ObxEzFe2PV8=
X-Received: by 2002:adf:e309:: with SMTP id b9mr75507195wrj.135.1559038289514; 
	Tue, 28 May 2019 03:11:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAAfyv34HAOaAaO1cyiQbR8P6mQPp8p3gCT2jM=UyQDGfvV-fYw@mail.gmail.com>
	<CA+2YH7ud9TX=ohQSk8XY=GzpewzFsXo6Z2eBJ=bXacyAsojV9A@mail.gmail.com>
	<CAAfyv34jJ362tu3x_8J1+FuV3zFpchkB8Ft9w-WERrxCNPxbvg@mail.gmail.com>
	<CACKFPN1bgM_DPDRRDxkjekqZ9gQwV9S+1MkHF42z6MvczD81Jg@mail.gmail.com>
	<CAAfyv36-ykHu2Gfet1CeuR8tjNgernF4m01AjnQaOzcFb-BZaw@mail.gmail.com>
	<CACKFPN1q13OJfCcRCP6aLxGOC+cM+2zjwoTLNbkAn5dAS+J_DA@mail.gmail.com>
In-Reply-To: <CACKFPN1q13OJfCcRCP6aLxGOC+cM+2zjwoTLNbkAn5dAS+J_DA@mail.gmail.com>
From: Belisko Marek <marek.belisko@gmail.com>
Date: Tue, 28 May 2019 12:11:18 +0200
Message-ID: <CAAfyv36hNk8CXYEfYASZJ-tOPEUwZ23i1zyDdLbVWk6r9ONkDA@mail.gmail.com>
To: Dimitris Tassopoulos <dimtass@gmail.com>
Cc: Yocto discussion list <yocto@yoctoproject.org>,
	Sergey Lapin <slapin@ossfans.org>, Enrico <ebutera@users.sourceforge.net>,
	Nicolas Aguirre <aguirre.nicolas@gmail.com>,
	OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] meta-sunxi maintained?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 May 2019 10:11:29 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dimitris,

On Tue, May 28, 2019 at 12:06 PM Dimitris Tassopoulos <dimtass@gmail.com> w=
rote:
>
> Hi Belisko,
>
> I was thinking about this also, too. The only reason is that in meta-sunx=
i they do a great job and they keep their layer clean, which is great I thi=
nk. The other layers are just based on the armbian distro, which is a lot d=
ifferent, but for me it was much easier to integrate their patches, patchin=
g scripts and bootloader scripts to a Yocto layer. That way the only thing =
I do is that from time to time I just integrate their new patches and that'=
s it. There's no development in the layer is just re-use of the armbian wor=
k and a wrapper around it. Therefore, it's hard, even no doable to put thos=
e different architectures together. But definitely that decision also bothe=
red me a lot before I create the layer and I also don't like time to be spe=
nd on the same thing from different people. Nevertheless, from my point of =
view I couldn't find a way to put those things together. I've tried but I c=
ouldn't do it.
>
> Therefore, it was easier for me to do it the way I've done it. And after =
all, although it doesn't seem right, at the same time this is the beauty of=
 the open source. I think the layers are just incompatible in the way that =
they are do things. Also it's not bad to have alternatives.
>
> Sunxi is a great community and I believe many of the armbian patches are =
coming from there. Others not. Of course, having them all together would be=
 nice. But I don't think that it's possible because of the different approa=
ch.
>
> I hope this explains your question and even more that explains that was n=
ot a decision to divide things or create more hassle for the same chips.
Yes certainly. Thanks for great explanation and sorry if I wrote it in
not polite way I didn't mean to offence ;). Thanks.
>
> Regards,
> Dimitris
>
> Belisko Marek <marek.belisko@gmail.com> schrieb am Di., 28. Mai 2019, 11:=
49:
>>
>> Hi Dimitris,
>>
>> On Tue, May 28, 2019 at 11:01 AM Dimitris Tassopoulos <dimtass@gmail.com=
> wrote:
>> >
>> > Hi Belisko,
>> >
>> > you can also have a look in to this layer: http://layers.openembedded.=
org/layerindex/branch/master/layer/meta-allwinner-hx/
>> > It's for allwinner H2,H3 and H5 boards that already have support on Ar=
mbian.
>> > Pretty much is just a Yocto layer with all the patches and BSP support=
 from Armbian.
>> > It supports 4.14 and 4.19 mainline kernels only and also the PREEMPT-R=
T patches.
>> > Warrior support was added recently, too.
>> OK thanks. I think I'll stick with meta-sunxi ;). What about join
>> forces and maintains one layer properly instead having it separated?
>> >
>> > A similar one is also this: http://layers.openembedded.org/layerindex/=
branch/master/layer/meta-nanopi-neo4/
>> >
>> > Dimitris
>> >
>> > On Mon, May 27, 2019 at 7:33 PM Belisko Marek <marek.belisko@gmail.com=
> wrote:
>> >>
>> >> Hi Enrico,
>> >>
>> >> On Mon, May 27, 2019 at 5:44 PM Enrico <ebutera@users.sourceforge.net=
> wrote:
>> >> >
>> >> > Hi,
>> >> >
>> >> > i try to keep it maintained, but now i just have a lime2 for testin=
g
>> >> > on real hardware, and i don't have the resources to do test builds =
for
>> >> > all the supported boards.
>> >> > Your help would be welcome, i can't check right now if i have the
>> >> > rights to add you as co-maintainer, anyway i will add you.
>> >> Thanks I have few sunxi based boards so can do tests also on my setup=
.
>> >> Pls ping me when you will add me. Thanks.
>> >> >
>> >> > Thanks for the help!
>> >> >
>> >> > Enrico
>> >>
>> >> Marek
>> >> >
>> >> > On Mon, May 27, 2019 at 4:50 PM Belisko Marek <marek.belisko@gmail.=
com> wrote:
>> >> > >
>> >> > > Hello,
>> >> > >
>> >> > > I'm just curious if meta-sunxi is still maintained? I was contrib=
uted
>> >> > > to layer back while and when look now thud branch is un-compilabl=
e
>> >> > > (dri2proto not replaced) and warrior branch not created yet. Ther=
e is
>> >> > > 14 issues + 6 pending pull requests. Added maintainers also in CC=
. I
>> >> > > think it would be good to have sunxi properly maintained as board=
s
>> >> > > with sunxi processors are popular. I can give a hand as co-mainta=
iner
>> >> > > if necessary. Thanks a lot.
>> >> > >
>> >> > > BR,
>> >> > >
>> >> > > marek
>> >> > >
>> >> > > --
>> >> > > as simple and primitive as possible
>> >> > > -------------------------------------------------
>> >> > > Marek Belisko - OPEN-NANDRA
>> >> > > Freelance Developer
>> >> > >
>> >> > > Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
>> >> > > Tel: +421 915 052 184
>> >> > > skype: marekwhite
>> >> > > twitter: #opennandra
>> >> > > web: http://open-nandra.com
>> >> --
>> >> _______________________________________________
>> >> yocto mailing list
>> >> yocto@yoctoproject.org
>> >> https://lists.yoctoproject.org/listinfo/yocto
>>
>>
>>
>> marek

BR,

marek

