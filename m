Return-Path: <gudnimar@noxmedical.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B17C4345F
	for <webhook@archiver.kernel.org>; Wed,  1 May 2024 16:14:05 +0000 (UTC)
Subject: Re: [meta-python][PATCH] python3-twisted: remove obsolete python3-twisted-flow
To: openembedded-devel@lists.openembedded.org
From: =?UTF-8?B?R3XDsG5pIE3DoXIgR2lsYmVydA==?= <gudnimar@noxmedical.com>
X-Originating-Location: Kopavogur, Capital Region, IS (81.15.100.92)
X-Originating-Platform: Windows Chrome 124
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 01 May 2024 09:13:59 -0700
References: <26415.1714579203790695160@lists.openembedded.org>
In-Reply-To: <26415.1714579203790695160@lists.openembedded.org>
Message-ID: <26415.1714580039628908522@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="uBGpXdKETV4CZsw9ltSW"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 01 May 2024 16:14:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/110207

--uBGpXdKETV4CZsw9ltSW
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To add to the previous message, when I run the same check on other common p=
ackages like python3, I also get a few hits. But I get similar noise for db=
g, src, doc, dev packages as in python3-twisted. Maybe those can be filtere=
d out or ignored.

WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-tests contains './usr/lib/python3.12/*/test' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-tests contains './usr/lib/python3.12/*/tests' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/bin/python3.12.real' but was not found.=C2=A0=
[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/UserDict.py' but was not found=
.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/UserList.py' but was not found=
.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/UserString.py' but was not fou=
nd.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/_abcoll.py' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/_bootlocale.py' but was not fo=
und. [files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/imp.py' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/__pycache__/_struc=
t.*.so' but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/__pycache__/binasc=
ii.*.so' but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/__pycache__/time.*=
.so' but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/__pycache__/xreadl=
ines.*.so' but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/_typing.*.so' but =
was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/parser.*.so' but w=
as not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/time.*.so' but was=
 not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/lib-dynload/xreadlines.*.so' b=
ut was not found. [files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/new.py' but was not found.=C2=
=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/sitecustomize.py' but was not =
found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/symbol.py' but was not found.=
=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/__pycache__/_bootlocale.*.pyc'=
 but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/__pycache__/imp.*.pyc' but was=
 not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/__pycache__/re.*.pyc' but was =
not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/__pycache__/symbol.*.pyc' but =
was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-core contains './usr/lib/python3.12/__pycache__/traceback.*.pyc' b=
ut was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-tkinter contains './usr/lib/python3.12/lib-dynload/_tkinter.*.so' =
but was not found.=C2=A0[files-not-found]
WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package=
 python3-venv contains './usr/bin/pyvenv*' but was not found.

I haven't verified all of these, but can confirm that the imp.py module was=
 removed in Python 3.12 so there is at least some truth to this. I wonder w=
hat else can be found.

--uBGpXdKETV4CZsw9ltSW
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

To add to the previous message, when I run the same check on other common p=
ackages like python3, I also get a few hits. But I get similar noise for db=
g, src, doc, dev packages as in python3-twisted. Maybe those can be filtere=
d out or ignored.<br /><br />WARNING: python3-3.12.3-r0 do_package: QA Issu=
e: FILES variable for package python3-tests contains './usr/lib/python3.12/=
*/test' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.1=
2.3-r0 do_package: QA Issue: FILES variable for package python3-tests conta=
ins './usr/lib/python3.12/*/tests' but was not found.&nbsp;[files-not-found=
]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for =
package python3-core contains './usr/bin/python3.12.real' but was not found=
.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Iss=
ue: FILES variable for package python3-core contains './usr/lib/python3.12/=
UserDict.py' but was not found.&nbsp;[files-not-found]<br />WARNING: python=
3-3.12.3-r0 do_package: QA Issue: FILES variable for package python3-core c=
ontains './usr/lib/python3.12/UserList.py' but was not found.&nbsp;[files-n=
ot-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES varia=
ble for package python3-core contains './usr/lib/python3.12/UserString.py' =
but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-r0 d=
o_package: QA Issue: FILES variable for package python3-core contains './us=
r/lib/python3.12/_abcoll.py' but was not found.&nbsp;[files-not-found]<br /=
>WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for packag=
e python3-core contains './usr/lib/python3.12/_bootlocale.py' but was not f=
ound. [files-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issu=
e: FILES variable for package python3-core contains './usr/lib/python3.12/i=
mp.py' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12=
.3-r0 do_package: QA Issue: FILES variable for package python3-core contain=
s './usr/lib/python3.12/lib-dynload/__pycache__/_struct.*.so' but was not f=
ound.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA=
 Issue: FILES variable for package python3-core contains './usr/lib/python3=
.12/lib-dynload/__pycache__/binascii.*.so' but was not found.&nbsp;[files-n=
ot-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES varia=
ble for package python3-core contains './usr/lib/python3.12/lib-dynload/__p=
ycache__/time.*.so' but was not found.&nbsp;[files-not-found]<br />WARNING:=
 python3-3.12.3-r0 do_package: QA Issue: FILES variable for package python3=
-core contains './usr/lib/python3.12/lib-dynload/__pycache__/xreadlines.*.s=
o' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-r=
0 do_package: QA Issue: FILES variable for package python3-core contains '.=
/usr/lib/python3.12/lib-dynload/_typing.*.so' but was not found.&nbsp;[file=
s-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES va=
riable for package python3-core contains './usr/lib/python3.12/lib-dynload/=
parser.*.so' but was not found.&nbsp;[files-not-found]<br />WARNING: python=
3-3.12.3-r0 do_package: QA Issue: FILES variable for package python3-core c=
ontains './usr/lib/python3.12/lib-dynload/time.*.so' but was not found.&nbs=
p;[files-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: F=
ILES variable for package python3-core contains './usr/lib/python3.12/lib-d=
ynload/xreadlines.*.so' but was not found. [files-not-found]<br />WARNING: =
python3-3.12.3-r0 do_package: QA Issue: FILES variable for package python3-=
core contains './usr/lib/python3.12/new.py' but was not found.&nbsp;[files-=
not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES vari=
able for package python3-core contains './usr/lib/python3.12/sitecustomize.=
py' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-=
r0 do_package: QA Issue: FILES variable for package python3-core contains '=
./usr/lib/python3.12/symbol.py' but was not found.&nbsp;[files-not-found]<b=
r />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES variable for pac=
kage python3-core contains './usr/lib/python3.12/__pycache__/_bootlocale.*.=
pyc' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3=
-r0 do_package: QA Issue: FILES variable for package python3-core contains =
'./usr/lib/python3.12/__pycache__/imp.*.pyc' but was not found.&nbsp;[files=
-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FILES var=
iable for package python3-core contains './usr/lib/python3.12/__pycache__/r=
e.*.pyc' but was not found.&nbsp;[files-not-found]<br />WARNING: python3-3.=
12.3-r0 do_package: QA Issue: FILES variable for package python3-core conta=
ins './usr/lib/python3.12/__pycache__/symbol.*.pyc' but was not found.&nbsp=
;[files-not-found]<br />WARNING: python3-3.12.3-r0 do_package: QA Issue: FI=
LES variable for package python3-core contains './usr/lib/python3.12/__pyca=
che__/traceback.*.pyc' but was not found.&nbsp;[files-not-found]<br />WARNI=
NG: python3-3.12.3-r0 do_package: QA Issue: FILES variable for package pyth=
on3-tkinter contains './usr/lib/python3.12/lib-dynload/_tkinter.*.so' but w=
as not found.&nbsp;[files-not-found]<br />WARNING: python3-3.12.3-r0 do_pac=
kage: QA Issue: FILES variable for package python3-venv contains './usr/bin=
/pyvenv*' but was not found.<br /><br />I haven't verified all of these, bu=
t can confirm that the imp.py module was removed in Python 3.12 so there is=
 at least some truth to this. I wonder what else can be found.

--uBGpXdKETV4CZsw9ltSW--

