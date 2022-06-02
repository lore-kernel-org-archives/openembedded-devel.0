Return-Path: <ranjitsinhrathod1991@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3400C433EF
	for <webhook@archiver.kernel.org>; Thu,  2 Jun 2022 06:30:58 +0000 (UTC)
Subject: Re: [meta-python][dunfell][PATCH 1/9] python3-pillow: Upgrade 6.2.1
 -> 7.2.0
To: openembedded-devel@lists.openembedded.org
From: "Ranjitsinh Rathod" <ranjitsinhrathod1991@gmail.com>
X-Originating-Location: Pune, Maharashtra, IN (165.225.120.241)
X-Originating-Platform: Linux Chrome 102
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 01 Jun 2022 23:30:43 -0700
References: <6bdffec7-eb98-b2ba-a89a-a13cf4ac5a85@gmail.com>
In-Reply-To: <6bdffec7-eb98-b2ba-a89a-a13cf4ac5a85@gmail.com>
Message-ID: <29102.1654151443160260957@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="NL5oovxyscBRZlfIComM"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 02 Jun 2022 06:30:58 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97380

--NL5oovxyscBRZlfIComM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,

I understand that we are not upgrading versions on the LTS branch, but this=
 series of upgrades fixing the below CVEs.
CVE-2019 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2019 ) -19911 CVE-20=
20 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2020 ) -10177 CVE-2020 ( h=
ttps://asc.bmwgroup.net/mgujira/browse/CVE-2020 ) -10378 CVE-2020 ( https:/=
/asc.bmwgroup.net/mgujira/browse/CVE-2020 ) -10379 CVE-2020 ( https://asc.b=
mwgroup.net/mgujira/browse/CVE-2020 ) -10994 CVE-2020 ( https://asc.bmwgrou=
p.net/mgujira/browse/CVE-2020 ) -11538 CVE-2020 ( https://asc.bmwgroup.net/=
mgujira/browse/CVE-2020 ) -35653 CVE-2020 ( https://asc.bmwgroup.net/mgujir=
a/browse/CVE-2020 ) -35654 CVE-2020 ( https://asc.bmwgroup.net/mgujira/brow=
se/CVE-2020 ) -35655 CVE-2020 ( https://asc.bmwgroup.net/mgujira/browse/CVE=
-2020 ) -5310 CVE-2020 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2020 )=
 -5311 CVE-2020 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2020 ) -5312 =
CVE-2020 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2020 ) -5313 CVE-202=
1 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -23437 CVE-2021 ( ht=
tps://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -25287 CVE-2021 ( https://=
asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -25288 CVE-2021 ( https://asc.bm=
wgroup.net/mgujira/browse/CVE-2021 ) -25289 CVE-2021 ( https://asc.bmwgroup=
.net/mgujira/browse/CVE-2021 ) -25290 CVE-2021 ( https://asc.bmwgroup.net/m=
gujira/browse/CVE-2021 ) -25291 CVE-2021 ( https://asc.bmwgroup.net/mgujira=
/browse/CVE-2021 ) -25292 CVE-2021 ( https://asc.bmwgroup.net/mgujira/brows=
e/CVE-2021 ) -25293 CVE-2021 ( https://asc.bmwgroup.net/mgujira/browse/CVE-=
2021 ) -27921 CVE-2021 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2021 )=
 -27922 CVE-2021 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -2792=
3 CVE-2021 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -28675 CVE-=
2021 ( https://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -28676 CVE-2021 (=
 https://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -28677 CVE-2021 ( https=
://asc.bmwgroup.net/mgujira/browse/CVE-2021 ) -28678 CVE-2021 ( https://asc=
.bmwgroup.net/mgujira/browse/CVE-2021 ) -34552 CVE-2022 ( https://asc.bmwgr=
oup.net/mgujira/browse/CVE-2022 ) -22815 CVE-2022 ( https://asc.bmwgroup.ne=
t/mgujira/browse/CVE-2022 ) -22816 CVE-2022 ( https://asc.bmwgroup.net/mguj=
ira/browse/CVE-2022 ) -22817 CVE-2022 ( https://asc.bmwgroup.net/mgujira/br=
owse/CVE-2022 ) -24303

To solve these many CVEs by applying a patch would be really tough and main=
taining patches too. What is your opinion here?

Thanks,
Ranjitsinh Rathod

--NL5oovxyscBRZlfIComM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi Armin,<br /><br />I understand that we are not upgrading versions on the=
 LTS branch, but this series of upgrades fixing the below CVEs.<br /><a sty=
le=3D"color: #0654ac; font-family: monospace; font-size: small; white-space=
: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira=
/browse/CVE-2019">CVE-2019</a><span style=3D"color: #353535; font-family: m=
onospace; font-size: small; white-space: pre;">-19911 </span><a style=3D"co=
lor: #0654ac; font-family: monospace; font-size: small; white-space: pre; b=
ackground-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/=
CVE-2020">CVE-2020</a><span style=3D"color: #353535; font-family: monospace=
; font-size: small; white-space: pre;">-10177 </span><a style=3D"color: #06=
54ac; font-family: monospace; font-size: small; white-space: pre; backgroun=
d-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020=
">CVE-2020</a><span style=3D"color: #353535; font-family: monospace; font-s=
ize: small; white-space: pre;">-10378 </span><a style=3D"color: #0654ac; fo=
nt-family: monospace; font-size: small; white-space: pre; background-color:=
 #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020">CVE-20=
20</a><span style=3D"color: #353535; font-family: monospace; font-size: sma=
ll; white-space: pre;">-10379 </span><a style=3D"color: #0654ac; font-famil=
y: monospace; font-size: small; white-space: pre; background-color: #ffffff=
;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020">CVE-2020</a><s=
pan style=3D"color: #353535; font-family: monospace; font-size: small; whit=
e-space: pre;">-10994 </span><a style=3D"color: #0654ac; font-family: monos=
pace; font-size: small; white-space: pre; background-color: #ffffff;" href=
=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020">CVE-2020</a><span sty=
le=3D"color: #353535; font-family: monospace; font-size: small; white-space=
: pre;">-11538 </span><a style=3D"color: #0654ac; font-family: monospace; f=
ont-size: small; white-space: pre; background-color: #ffffff;" href=3D"http=
s://asc.bmwgroup.net/mgujira/browse/CVE-2020">CVE-2020</a><span style=3D"co=
lor: #353535; font-family: monospace; font-size: small; white-space: pre;">=
-35653 </span><a style=3D"color: #0654ac; font-family: monospace; font-size=
: small; white-space: pre; background-color: #ffffff;" href=3D"https://asc.=
bmwgroup.net/mgujira/browse/CVE-2020">CVE-2020</a><span style=3D"color: #35=
3535; font-family: monospace; font-size: small; white-space: pre;">-35654 <=
/span><a style=3D"color: #0654ac; font-family: monospace; font-size: small;=
 white-space: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup=
.net/mgujira/browse/CVE-2020">CVE-2020</a><span style=3D"color: #353535; fo=
nt-family: monospace; font-size: small; white-space: pre;">-35655 </span><a=
 style=3D"color: #0654ac; font-family: monospace; font-size: small; white-s=
pace: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgu=
jira/browse/CVE-2020">CVE-2020</a><span style=3D"color: #353535; font-famil=
y: monospace; font-size: small; white-space: pre;">-5310 </span><a style=3D=
"color: #0654ac; font-family: monospace; font-size: small; white-space: pre=
; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/brow=
se/CVE-2020">CVE-2020</a><span style=3D"color: #353535; font-family: monosp=
ace; font-size: small; white-space: pre;">-5311 </span><a style=3D"color: #=
0654ac; font-family: monospace; font-size: small; white-space: pre; backgro=
und-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-20=
20">CVE-2020</a><span style=3D"color: #353535; font-family: monospace; font=
-size: small; white-space: pre;">-5312 </span><a style=3D"color: #0654ac; f=
ont-family: monospace; font-size: small; white-space: pre; background-color=
: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2020">CVE-2=
020</a><span style=3D"color: #353535; font-family: monospace; font-size: sm=
all; white-space: pre;">-5313 </span><a style=3D"color: #0654ac; font-famil=
y: monospace; font-size: small; white-space: pre; background-color: #ffffff=
;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><s=
pan style=3D"color: #353535; font-family: monospace; font-size: small; whit=
e-space: pre;">-23437 </span><a style=3D"color: #0654ac; font-family: monos=
pace; font-size: small; white-space: pre; background-color: #ffffff;" href=
=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span sty=
le=3D"color: #353535; font-family: monospace; font-size: small; white-space=
: pre;">-25287 </span><a style=3D"color: #0654ac; font-family: monospace; f=
ont-size: small; white-space: pre; background-color: #ffffff;" href=3D"http=
s://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"co=
lor: #353535; font-family: monospace; font-size: small; white-space: pre;">=
-25288 </span><a style=3D"color: #0654ac; font-family: monospace; font-size=
: small; white-space: pre; background-color: #ffffff;" href=3D"https://asc.=
bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"color: #35=
3535; font-family: monospace; font-size: small; white-space: pre;">-25289 <=
/span><a style=3D"color: #0654ac; font-family: monospace; font-size: small;=
 white-space: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup=
.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"color: #353535; fo=
nt-family: monospace; font-size: small; white-space: pre;">-25290 </span><a=
 style=3D"color: #0654ac; font-family: monospace; font-size: small; white-s=
pace: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgu=
jira/browse/CVE-2021">CVE-2021</a><span style=3D"color: #353535; font-famil=
y: monospace; font-size: small; white-space: pre;">-25291 </span><a style=
=3D"color: #0654ac; font-family: monospace; font-size: small; white-space: =
pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/b=
rowse/CVE-2021">CVE-2021</a><span style=3D"color: #353535; font-family: mon=
ospace; font-size: small; white-space: pre;">-25292 </span><a style=3D"colo=
r: #0654ac; font-family: monospace; font-size: small; white-space: pre; bac=
kground-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CV=
E-2021">CVE-2021</a><span style=3D"color: #353535; font-family: monospace; =
font-size: small; white-space: pre;">-25293 </span><a style=3D"color: #0654=
ac; font-family: monospace; font-size: small; white-space: pre; background-=
color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">=
CVE-2021</a><span style=3D"color: #353535; font-family: monospace; font-siz=
e: small; white-space: pre;">-27921 </span><a style=3D"color: #0654ac; font=
-family: monospace; font-size: small; white-space: pre; background-color: #=
ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021=
</a><span style=3D"color: #353535; font-family: monospace; font-size: small=
; white-space: pre;">-27922 </span><a style=3D"color: #0654ac; font-family:=
 monospace; font-size: small; white-space: pre; background-color: #ffffff;"=
 href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><spa=
n style=3D"color: #353535; font-family: monospace; font-size: small; white-=
space: pre;">-27923 </span><a style=3D"color: #0654ac; font-family: monospa=
ce; font-size: small; white-space: pre; background-color: #ffffff;" href=3D=
"https://asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=
=3D"color: #353535; font-family: monospace; font-size: small; white-space: =
pre;">-28675 </span><a style=3D"color: #0654ac; font-family: monospace; fon=
t-size: small; white-space: pre; background-color: #ffffff;" href=3D"https:=
//asc.bmwgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"colo=
r: #353535; font-family: monospace; font-size: small; white-space: pre;">-2=
8676 </span><a style=3D"color: #0654ac; font-family: monospace; font-size: =
small; white-space: pre; background-color: #ffffff;" href=3D"https://asc.bm=
wgroup.net/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"color: #3535=
35; font-family: monospace; font-size: small; white-space: pre;">-28677 </s=
pan><a style=3D"color: #0654ac; font-family: monospace; font-size: small; w=
hite-space: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.n=
et/mgujira/browse/CVE-2021">CVE-2021</a><span style=3D"color: #353535; font=
-family: monospace; font-size: small; white-space: pre;">-28678 </span><a s=
tyle=3D"color: #0654ac; font-family: monospace; font-size: small; white-spa=
ce: pre; background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mguji=
ra/browse/CVE-2021">CVE-2021</a><span style=3D"color: #353535; font-family:=
 monospace; font-size: small; white-space: pre;">-34552 </span><a style=3D"=
color: #0654ac; font-family: monospace; font-size: small; white-space: pre;=
 background-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/brows=
e/CVE-2022">CVE-2022</a><span style=3D"color: #353535; font-family: monospa=
ce; font-size: small; white-space: pre;">-22815 </span><a style=3D"color: #=
0654ac; font-family: monospace; font-size: small; white-space: pre; backgro=
und-color: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-20=
22">CVE-2022</a><span style=3D"color: #353535; font-family: monospace; font=
-size: small; white-space: pre;">-22816 </span><a style=3D"color: #0654ac; =
font-family: monospace; font-size: small; white-space: pre; background-colo=
r: #ffffff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022">CVE-=
2022</a><span style=3D"color: #353535; font-family: monospace; font-size: s=
mall; white-space: pre;">-22817 </span><a style=3D"color: #0654ac; font-fam=
ily: monospace; font-size: small; white-space: pre; background-color: #ffff=
ff;" href=3D"https://asc.bmwgroup.net/mgujira/browse/CVE-2022">CVE-2022</a>=
<span style=3D"color: #353535; font-family: monospace; font-size: small; wh=
ite-space: pre;">-24303<br /><br />To solve these many CVEs by applying a p=
atch would be really tough and maintaining patches too. What is your opinio=
n here? </span>
<div><span style=3D"color: #353535; font-family: monospace; font-size: smal=
l; white-space: pre;"><br />Thanks,<br />Ranjitsinh Rathod</span></div>

--NL5oovxyscBRZlfIComM--

