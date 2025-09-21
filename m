Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1A22CAC5A7
	for <webhook@archiver.kernel.org>; Sun, 21 Sep 2025 02:34:27 +0000 (UTC)
Subject: Re: [meta-python][PATCH 2/4] python3-frozenlist: support reproducible
To: openembedded-devel@lists.openembedded.org
From: "hongxu" <hongxu.jia@eng.windriver.com>
X-Originating-Location: US (128.224.246.2)
X-Originating-Platform: Linux Chrome 140
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Sat, 20 Sep 2025 19:34:26 -0700
References: <CAMKF1spt3grZYZw3TmZTWQVWCip3kewWNCdxMhhHsY5yANkraA@mail.gmail.com>
In-Reply-To: <CAMKF1spt3grZYZw3TmZTWQVWCip3kewWNCdxMhhHsY5yANkraA@mail.gmail.com>
Message-ID: <19647.1758422066781943331@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="XSPjK1yHrPPcdkA5RxO1"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 21 Sep 2025 02:34:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119625

--XSPjK1yHrPPcdkA5RxO1
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 09:01 PM, Khem Raj wrote:

>=20
> seeing
>=20
> stdio: ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: QA Issue:
> File /usr/src/debug/python3-frozenlist/1.7.0/frozenlist/_frozenlist.cpp
> in package python3-frozenlist-src contains reference to TMPDIR
> [buildpaths]
> stdio: ERROR: python3-frozenlist-1.7.0-r0 do_package_qa: Fatal QA
> errors were found, failing task.
>=20
>=20
> See - https://autobuilder.yoctoproject.org/valkyrie/?#/builders/81/builds=
/935
> ( https://autobuilder.yoctoproject.org/valkyrie/#/builders/81/builds/935 =
)

As I mentioned in the commit message, it also requires oe-core commit [1] t=
o be merged, otherwise the issue you met

[1] https://lists.openembedded.org/g/openembedded-core/message/223604?p=3D%=
2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D=
3&d=3D3

//Hongxu

>=20
> On Thu, Sep 18, 2025 at 12:16=E2=80=AFAM hongxu via lists.openembedded.or=
g
> <hongxu.jia=3Deng.windriver.com@...> wrote:

--XSPjK1yHrPPcdkA5RxO1
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>On Thu, Sep 18, 2025 at 09:01 PM, Khem Raj wrote:</div>
<div>
<blockquote>seeing<br /><br />stdio: ERROR: python3-frozenlist-1.7.0-r0 do_=
package_qa: QA Issue:<br />File /usr/src/debug/python3-frozenlist/1.7.0/fro=
zenlist/_frozenlist.cpp<br />in package python3-frozenlist-src contains ref=
erence to TMPDIR<br />[buildpaths]<br />stdio: ERROR: python3-frozenlist-1.=
7.0-r0 do_package_qa: Fatal QA<br />errors were found, failing task.<br /><=
br /><br />See - <a href=3D"https://autobuilder.yoctoproject.org/valkyrie/#=
/builders/81/builds/935" target=3D"_blank" rel=3D"noopener">https://autobui=
lder.yoctoproject.org/valkyrie/?#/builders/81/builds/935</a></blockquote>
<span style=3D"color: #333333; font-family: system-ui, 'Segoe UI', Roboto, =
'Helvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple=
 Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; fon=
t-size: 16px; font-style: normal; font-variant-ligatures: normal; font-vari=
ant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; tex=
t-align: start; text-indent: 0px; text-transform: none; widows: 2; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; backgroun=
d-color: #ffffff; text-decoration-thickness: initial; text-decoration-style=
: initial; text-decoration-color: initial; display: inline !important; floa=
t: none;">As I mentioned in the commit message, it also requires oe-core co=
mmit [1] to be merged, otherwise the issue you met</span><br style=3D"box-s=
izing: border-box; overflow-wrap: break-word !important; color: #333333; fo=
nt-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'L=
iberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', =
'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: normal;=
 font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 40=
0; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0px;=
 text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-wi=
dth: 0px; white-space: pre-wrap; background-color: #ffffff; text-decoration=
-thickness: initial; text-decoration-style: initial; text-decoration-color:=
 initial;" /><br style=3D"box-sizing: border-box; overflow-wrap: break-word=
 !important; color: #333333; font-family: system-ui, 'Segoe UI', Roboto, 'H=
elvetica Neue', 'Noto Sans', 'Liberation Sans', Arial, sans-serif, 'Apple C=
olor Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol', 'Noto Color Emoji'; font-=
size: 16px; font-style: normal; font-variant-ligatures: normal; font-varian=
t-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-=
align: start; text-indent: 0px; text-transform: none; widows: 2; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; white-space: pre-wrap; background-=
color: #ffffff; text-decoration-thickness: initial; text-decoration-style: =
initial; text-decoration-color: initial;" /><span style=3D"color: #333333; =
font-family: system-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', =
'Liberation Sans', Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji'=
, 'Segoe UI Symbol', 'Noto Color Emoji'; font-size: 16px; font-style: norma=
l; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: =
400; letter-spacing: normal; orphans: 2; text-align: start; text-indent: 0p=
x; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; white-space: pre-wrap; background-color: #ffffff; text-decorati=
on-thickness: initial; text-decoration-style: initial; text-decoration-colo=
r: initial; display: inline !important; float: none;">[1] </span><a style=
=3D"box-sizing: border-box; background-color: #ffffff; color: #2f6fa7; text=
-decoration: none; overflow-wrap: break-word !important; font-family: syste=
m-ui, 'Segoe UI', Roboto, 'Helvetica Neue', 'Noto Sans', 'Liberation Sans',=
 Arial, sans-serif, 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol=
', 'Noto Color Emoji'; font-size: 16px; font-style: normal; font-variant-li=
gatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; orphans: 2; text-align: start; text-indent: 0px; text-transform:=
 none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-=
space: pre-wrap;" href=3D"https://lists.openembedded.org/g/openembedded-cor=
e/message/223604?p=3D%2C%2C%2C20%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C=
0%2C115291386%2Cd%253D3&amp;d=3D3" target=3D"_blank" rel=3D"noopener">https=
://lists.openembedded.org/g/openembedded-core/message/223604?p=3D%2C%2C%2C2=
0%2C0%2C0%2C0%3A%3ACreated%2C%2C%2C20%2C2%2C0%2C115291386%2Cd%253D3&amp;d=
=3D3</a></div>
<div>&nbsp;</div>
<div>//Hongxu<br />
<blockquote>On Thu, Sep 18, 2025 at 12:16=E2=80=AFAM hongxu via lists.opene=
mbedded.org<br />&lt;hongxu.jia=3Deng.windriver.com@...&gt; wrote:</blockqu=
ote>
</div>

--XSPjK1yHrPPcdkA5RxO1--

