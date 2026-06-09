Return-Path: <ashishkumar.mishra@bmwtechworks.in>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30D39CD8CAD
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 08:27:13 +0000 (UTC)
Subject: [wrynose]: Input if android-tools change from master can be back-ported 
To: openembedded-devel@lists.openembedded.org
From: "AshishKumar Mishra" <ashishkumar.mishra@bmwtechworks.in>
X-Originating-Location: Bengaluru, Karnataka, IN (103.117.236.194)
X-Originating-Platform: Linux Chrome 139
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Tue, 09 Jun 2026 01:27:03 -0700
Message-ID: <R6zi.1780993623156690725.G7et@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="oMTXMT37mIrjvSZe36bO"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 09 Jun 2026 08:27:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/127437

--oMTXMT37mIrjvSZe36bO
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi=C2=A0 Khem / Team ,

I have change to move android-tools from dynamic-layers/selinux to meta-oe =
merged in master branch

2026-05-24 android-tools: fix deprecated header warning from clang ( https:=
//git.openembedded.org/meta-openembedded/commit/?id=3D71da24f0895fdfea53748=
bd275c6f639eb771cf0 ) AshishKumar Mishra 2026-05-24 android-tools: removes =
selinux dependency from android-tools_29.0.6.r14.bb ( https://git.openembed=
ded.org/meta-openembedded/commit/?id=3D72dfc0df7682e898cac19aa9163ba8bea8ae=
5397 ) AshishKumar Mishra 2026-05-24 android-tools: move android-tools v29.=
x from dynamic-layers/selinux to meta-oe ( https://git.openembedded.org/met=
a-openembedded/commit/?id=3D66f56dda5ec7afe2b059da3c50f0edf3d536964d ) Ashi=
shKumar Mishra 2026-05-24 android-tools: remove android-tools 5.x from meta=
-oe/recipes-devtools ( https://git.openembedded.org/meta-openembedded/commi=
t/?id=3D33c1e33d2303d20e916783fb91e78781bab7cc2b ) AshishKumar Mishra

Looking at the usage , wanted to check if team can allow this change in wry=
nose as it will be the LTS till 2030
My understanding is that in released LTS major version bump will not be acc=
epeted
Such that major or minor version bumps for recipes are not allowed unless t=
hey are bug-fix / cve fix

Accordingly i can start to backport them to wrynose if its acceptible as th=
is can helpful to lots of user considering we are at the start of Wrynose

Thanks ,
Ashish

--oMTXMT37mIrjvSZe36bO
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi&nbsp; Khem / Team ,&nbsp;</div>
<div><br />I have change to move android-tools from dynamic-layers/selinux =
to meta-oe merged in master branch&nbsp;</div>
<div><br />
<table class=3D"list nowrap" style=3D"border-collapse: collapse; width: 242=
5.33px; border: none; color: #333333; font-family: sans-serif; font-size: 1=
3.3333px; font-style: normal; font-variant-ligatures: normal; font-variant-=
caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-al=
ign: start; text-transform: none; widows: 2; word-spacing: 0px; -webkit-tex=
t-stroke-width: 0px; white-space: normal; background-color: #ffffff; text-d=
ecoration-thickness: initial; text-decoration-style: initial; text-decorati=
on-color: initial;">
<tbody>
<tr style=3D"background: #f7f7f7;">
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n title=3D"2026-05-24 08:25:07 -0700">2026-05-24</span></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><a s=
tyle=3D"color: black; text-decoration: none;" href=3D"https://git.openembed=
ded.org/meta-openembedded/commit/?id=3D71da24f0895fdfea53748bd275c6f639eb77=
1cf0">android-tools: fix deprecated header warning from clang</a></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n class=3D"libravatar"><img class=3D"inline" style=3D"border: none; border-=
radius: 3px; width: 13px; height: 13px; margin-right: 0.2em; opacity: 0.4;"=
 src=3D"https://seccdn.libravatar.org/avatar/88c225d4ed41984458e8c4cf61d7bc=
32?s=3D13&amp;d=3Dretro" /></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background: white;">
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n title=3D"2026-05-24 08:25:07 -0700">2026-05-24</span></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><a s=
tyle=3D"color: black; text-decoration: none;" href=3D"https://git.openembed=
ded.org/meta-openembedded/commit/?id=3D72dfc0df7682e898cac19aa9163ba8bea8ae=
5397">android-tools: removes selinux dependency from android-tools_29.0.6.r=
14.bb</a></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n class=3D"libravatar"><img class=3D"inline" style=3D"border: none; border-=
radius: 3px; width: 13px; height: 13px; margin-right: 0.2em; opacity: 0.4;"=
 src=3D"https://seccdn.libravatar.org/avatar/88c225d4ed41984458e8c4cf61d7bc=
32?s=3D13&amp;d=3Dretro" /></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background: #eeeeee;">
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n title=3D"2026-05-24 08:25:06 -0700">2026-05-24</span></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><a s=
tyle=3D"color: #0000ff; text-decoration: underline;" href=3D"https://git.op=
enembedded.org/meta-openembedded/commit/?id=3D66f56dda5ec7afe2b059da3c50f0e=
df3d536964d">android-tools: move android-tools v29.x from dynamic-layers/se=
linux to meta-oe</a></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n class=3D"libravatar"><img class=3D"inline" style=3D"border: none; border-=
radius: 3px; width: 13px; height: 13px; margin-right: 0.2em; opacity: 0.4;"=
 src=3D"https://seccdn.libravatar.org/avatar/88c225d4ed41984458e8c4cf61d7bc=
32?s=3D13&amp;d=3Dretro" /></span>AshishKumar Mishra</td>
</tr>
<tr style=3D"background: white;">
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n title=3D"2026-05-24 08:25:06 -0700">2026-05-24</span></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><a s=
tyle=3D"color: black; text-decoration: none;" href=3D"https://git.openembed=
ded.org/meta-openembedded/commit/?id=3D33c1e33d2303d20e916783fb91e78781bab7=
cc2b">android-tools: remove android-tools 5.x from meta-oe/recipes-devtools=
</a></td>
<td style=3D"border: none; padding: 0.1em 0.5em; white-space: nowrap;"><spa=
n class=3D"libravatar"><img class=3D"inline" style=3D"border: none; border-=
radius: 3px; width: 13px; height: 13px; margin-right: 0.2em; opacity: 0.4;"=
 src=3D"https://seccdn.libravatar.org/avatar/88c225d4ed41984458e8c4cf61d7bc=
32?s=3D13&amp;d=3Dretro" /></span>AshishKumar Mishra</td>
</tr>
</tbody>
</table>
<div>
<div>&nbsp;</div>
<div>Looking at the usage , wanted to check if team can allow this change i=
n wrynose as it will be the LTS till 2030&nbsp;</div>
<div>
<div>My understanding is that in released LTS major version bump will not b=
e accepeted&nbsp;</div>
<div>Such that major or minor version bumps for recipes are not allowed unl=
ess they are bug-fix / cve fix&nbsp;</div>
<div>&nbsp;</div>
Accordingly i can start to backport them to wrynose if its acceptible as th=
is can helpful to lots of user considering we are at the start of Wrynose&n=
bsp;<br /><br />
<div>&nbsp;</div>
</div>
Thanks ,</div>
<div>Ashish&nbsp;</div>
</div>

--oMTXMT37mIrjvSZe36bO--

