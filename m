Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web08.7355.1617803040170437277
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 07 Apr 2021 06:44:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rgl0TTbw;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id e14so27722795ejz.11
        for <openembedded-devel@lists.openembedded.org>; Wed, 07 Apr 2021 06:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rn1oM9l6m3W5GwfcuZvphlXaGjBj9BhR8Xf8vS++pDY=;
        b=rgl0TTbw60jNhCkAyJN2sRAx/311ttLAzXg3Wd3qfcpVMZHyWyhh5C93llSOD1p2Ot
         ShsOTnXL2zVtQ/JlP2eexJfRDuZA0kRcl4xTCZvykpy843wA+HtweH1i8DCYNox4mJHS
         B99qpSFNgPpk1rnNLCm5thEuFGfRE5aUg3QzzGxj1yzuPHx+pVrfW1xlmIzqZAQ2ajme
         RzURxq3HeLQsg1lyCgqriKb3Ptun98mE0Q/Mn5ea8QMP9pPii5xWcqLxRgkDpYRbQLEF
         LZSHQAtMzjKDM1iI0o9xLGrUJZTnnXj+M4s5Do8x0JLgBndpmSXySIHNsYvksPfpafkf
         WMIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rn1oM9l6m3W5GwfcuZvphlXaGjBj9BhR8Xf8vS++pDY=;
        b=bmvDqQ0s0zEEaqmQ9Oj36G8bCmlMovqt9E1ooVCUuzBc7HutZMTVmh+TmaMOLm9o96
         1+1XwIF8SbJvUrOB/5NsilQxc5v1f5ttMsZ73VGwJKYBRF1Xn5lFzQlwh0ynrZu+81E4
         rTmk1RuP+jfCXfpg3eb18IkiIbCrdHvoAcfhJYOaxP8zFE2vlZhWcJYi8pL+FOysTHgD
         ZJNZVFmcOzKN3gGsr0+hfHyr4DFSvQFV6fBHX7VEm3k6ayVQy6qleT0FItc3GRA8TZI9
         a4uqJUAbMe8wuED3Caxrx4lJKYVMbHA3nbzjI1yjxxaEHYjbs31aSXc5qMWJhO7I5YWU
         lvEA==
X-Gm-Message-State: AOAM530GboOZLYJ4PvEBATh+frpeZGsUQ5nX3vdgbZb3RzVB9bJs6i9I
	io5nG12LGFI76PoCQ62J6g3XeORsohNVBsp+4qo=
X-Google-Smtp-Source: ABdhPJz/sVk1dD+bwxh+4Qh+cG4RVMEol/2Yy/ytusuQL9HxhRzxkhA5PhZLTxnjM1VDLGFhVbyOkSM/RClbETYjSX4=
X-Received: by 2002:a17:906:ce4e:: with SMTP id se14mr3998529ejb.54.1617803038435;
 Wed, 07 Apr 2021 06:43:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210325161828.41393-1-dzagorui@cisco.com> <7f3a1c21-5425-c29b-ebc3-5c6363905b3c@gmail.com>
 <BY5PR11MB4024ED277A4D898134E1544DD9759@BY5PR11MB4024.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB4024ED277A4D898134E1544DD9759@BY5PR11MB4024.namprd11.prod.outlook.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Wed, 7 Apr 2021 15:43:47 +0200
Message-ID: <CA+chaQc=LHcQQ8wJuVN-2yn8SAW2nf_VXQpcz3AR0Du6QDkBqA@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
To: dzagorui@cisco.com
Cc: Khem Raj <raj.khem@gmail.com>, 
	"openembedded-devel@lists.openembedded.org" <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000006c35a005bf621f15"

--0000000000006c35a005bf621f15
Content-Type: text/plain; charset="UTF-8"

From: on your e-mails looks strange:

From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco) via
lists.openembedded.org" <dzagorui=cisco.com@lists.openembedded.org>

So I guess git or something else parsed it incorrectly unfortunately.

On Wed, Apr 7, 2021 at 3:32 PM Denys Zagorui -X (dzagorui - GLOBALLOGIC
INC@Cisco) via lists.openembedded.org <dzagorui=
cisco.com@lists.openembedded.org> wrote:

> I've noticed that this patch
>
> https://git.openembedded.org/meta-openembedded/commit/?h=hardknott&id=2179569945f07a8ad54b9015dc5fad4300cdbde9
> and another patch
> bpftool: improve reproducibility
> https://git.openembedded.org/meta-openembedded/commit/?id=120de5e02ae4d48bb75e910caa2b7f4ae4b3d025
> have strange author field
> author  INC@Cisco) <INC@Cisco)>
> I'm wondered how is that happened.
>
> ________________________________________
> From: Khem Raj <raj.khem@gmail.com>
> Sent: 25 March 2021 20:12
> To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco);
> openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklist
>
>
>
> On 3/25/21 9:18 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)
> via lists.openembedded.org wrote:
> > Have not seen build issues for 5.4 and 5.10
> > x86-64 kernels so allow to build it
> >
> > Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> > ---
> >   meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 4 ++--
> >   meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
> >   2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > index c717d45e5..6f7e6fc74 100644
> > --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> > @@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel ="\
> >       trace-cmd \
> >   "
> >   RDEPENDS_packagegroup-meta-oe-kernel_append_x86 = " intel-speed-select
> ipmiutil pm-graph turbostat"
> > -RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = "
> intel-speed-select ipmiutil kpatch pm-graph turbostat"
> > +RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 = "
> intel-speed-select ipmiutil kpatch pm-graph turbostat bpftool"
> >   RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 = " libpfm4"
> >
> >   # Kernel-selftest does not build with 5.8 and its exluded from build
> too so until its fixed remove it
> >   RDEPENDS_packagegroup-meta-oe-kernel_remove = "kernel-selftest"
> > -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "crash
> intel-speed-select kernel-selftest minicoredumper turbostat"
> > +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl = "bpftool crash
> intel-speed-select kernel-selftest minicoredumper turbostat"
> >
> >   RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch = "makedumpfile"
> >   RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 = "crash"
> > diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > index 1758430bc..e58bdd493 100644
> > --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > @@ -32,4 +32,3 @@ python do_package_prepend() {
> >   }
> >
> >   B = "${WORKDIR}/${BPN}-${PV}"
> > -PNBLACKLIST[bpftool] ?= "Needs forward porting to kernel 5.2+"
> >
>
> you need to set proper COMPATIBLE_HOST here too.
>
> >
> >
> >
> >
>
> 
>
>

--0000000000006c35a005bf621f15
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">From: on your e-mails looks strange:<div><br></div><div>Fr=
om: &quot;Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco) via <a href=
=3D"http://lists.openembedded.org">lists.openembedded.org</a>&quot; &lt;dz=
agorui=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@list=
s.openembedded.org</a>&gt;<br></div><div><br></div><div>So I guess git or s=
omething else parsed it incorrectly unfortunately.</div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 7, 2021=
 at 3:32 PM Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco) via <a href=
=
=3D"http://lists.openembedded.org">lists.openembedded.org</a> &lt;dzagorui=
=
=3D<a href=3D"mailto:cisco.com@lists.openembedded.org">cisco.com@lists.ope=
nembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">I&#39;ve noticed that this patch<br>
<a href=3D"https://git.openembedded.org/meta-openembedded/commit/?h=3Dhard=
knott&amp;id=3D2179569945f07a8ad54b9015dc5fad4300cdbde9" rel=3D"noreferrer"=
 target=3D"_blank">https://git.openembedded.org/meta-openembedded/commit/?h=
=
=3Dhardknott&amp;id=3D2179569945f07a8ad54b9015dc5fad4300cdbde9</a><br>
and another patch<br>
bpftool: improve reproducibility <a href=3D"https://git.openembedded.org/m=
eta-openembedded/commit/?id=3D120de5e02ae4d48bb75e910caa2b7f4ae4b3d025" rel=
=
=3D"noreferrer" target=3D"_blank">https://git.openembedded.org/meta-openem=
bedded/commit/?id=3D120de5e02ae4d48bb75e910caa2b7f4ae4b3d025</a><br>
have strange author field<br>
author=C2=A0 INC@Cisco) &lt;INC@Cisco)&gt;<br>
I&#39;m wondered how is that happened.<br>
<br>
________________________________________<br>
From: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank"=
>raj.khem@gmail.com</a>&gt;<br>
Sent: 25 March 2021 20:12<br>
To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco); <a href=3D"mai=
lto:openembedded-devel@lists.openembedded.org" target=3D"_blank">openembedd=
ed-devel@lists.openembedded.org</a><br>
Subject: Re: [oe] [meta-oe][PATCH v2] bpftool: remove recipe from blacklis=
t<br>
<br>
<br>
<br>
On 3/25/21 9:18 AM, Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)<br=
>
via <a href=3D"http://lists.openembedded.org" rel=3D"noreferrer" target=3D=
"_blank">lists.openembedded.org</a> wrote:<br>
&gt; Have not seen build issues for 5.4 and 5.10<br>
&gt; x86-64 kernels so allow to build it<br>
&gt;<br>
&gt; Signed-off-by: Denys Zagorui &lt;<a href=3D"mailto:dzagorui@cisco.com=
" target=3D"_blank">dzagorui@cisco.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-core/packagegroups/<a href=3D"http://pack=
agegroup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta=
-oe.bb</a> | 4 ++--<br>
&gt;=C2=A0 =C2=A0meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.=
bb" rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a>=C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 1 -<br>
&gt;=C2=A0 =C2=A02 files changed, 2 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/meta-oe/recipes-core/packagegroups/<a href=3D"http://pac=
kagegroup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-met=
a-oe.bb</a> b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packageg=
roup-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.=
bb</a><br>
&gt; index c717d45e5..6f7e6fc74 100644<br>
&gt; --- a/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb=
</a><br>
&gt; +++ b/meta-oe/recipes-core/packagegroups/<a href=3D"http://packagegro=
up-meta-oe.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-meta-oe.bb=
</a><br>
&gt; @@ -608,12 +608,12 @@ RDEPENDS_packagegroup-meta-oe-kernel =3D&quot;\=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0trace-cmd \<br>
&gt;=C2=A0 =C2=A0&quot;<br>
&gt;=C2=A0 =C2=A0RDEPENDS_packagegroup-meta-oe-kernel_append_x86 =3D &quot=
; intel-speed-select ipmiutil pm-graph turbostat&quot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 =3D &quot; intel-=
speed-select ipmiutil kpatch pm-graph turbostat&quot;<br>
&gt; +RDEPENDS_packagegroup-meta-oe-kernel_append_x86-64 =3D &quot; intel-=
speed-select ipmiutil kpatch pm-graph turbostat bpftool&quot;<br>
&gt;=C2=A0 =C2=A0RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64 =3D =
&quot; libpfm4&quot;<br>
&gt;<br>
&gt;=C2=A0 =C2=A0# Kernel-selftest does not build with 5.8 and its exluded=
 from build too so until its fixed remove it<br>
&gt;=C2=A0 =C2=A0RDEPENDS_packagegroup-meta-oe-kernel_remove =3D &quot;ker=
nel-selftest&quot;<br>
&gt; -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D &quot;cras=
h intel-speed-select kernel-selftest minicoredumper turbostat&quot;<br>
&gt; +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D &quot;bpft=
ool crash intel-speed-select kernel-selftest minicoredumper turbostat&quot;=
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch =3D =
&quot;makedumpfile&quot;<br>
&gt;=C2=A0 =C2=A0RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 =3D &q=
uot;crash&quot;<br>
&gt; diff --git a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool=
.bb" rel=3D"noreferrer" target=3D"_blank">bpftool.bb</a> b/meta-oe/recipes-=
kernel/bpftool/<a href=3D"http://bpftool.bb" rel=3D"noreferrer" target=3D"_=
blank">bpftool.bb</a><br>
&gt; index 1758430bc..e58bdd493 100644<br>
&gt; --- a/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" re=
l=3D"noreferrer" target=3D"_blank">bpftool.bb</a><br>
&gt; +++ b/meta-oe/recipes-kernel/bpftool/<a href=3D"http://bpftool.bb" re=
l=3D"noreferrer" target=3D"_blank">bpftool.bb</a><br>
&gt; @@ -32,4 +32,3 @@ python do_package_prepend() {<br>
&gt;=C2=A0 =C2=A0}<br>
&gt;<br>
&gt;=C2=A0 =C2=A0B =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
&gt; -PNBLACKLIST[bpftool] ?=3D &quot;Needs forward porting to kernel 5.2+=
&quot;<br>
&gt;<br>
<br>
you need to set proper COMPATIBLE_HOST here too.<br>
<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
<br>
<br>
<br>
</blockquote></div>

--0000000000006c35a005bf621f15--
