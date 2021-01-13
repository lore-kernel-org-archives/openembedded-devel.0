Subject: Re: Yocto recipe for scikit-learn
To: openembedded-devel@lists.openembedded.org
From: kodali13451@gmail.com
X-Originating-Location: Frisco, Texas, US (107.204.20.30)
X-Originating-Platform: Mac Chrome 87
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 13 Jan 2021 08:19:53 -0800
References: <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
In-Reply-To: <5cd73e00-fc8f-0bb2-8985-824ae53e2083@embed.me.uk>
Message-ID: <21945.1610554793767268949@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Qt9yj5fO2Uje67rabZHX"

--Qt9yj5fO2Uje67rabZHX
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried to build "scipy" first using your repo, I have encountered the belo=
w two errors:

1.=C2=A0ERROR: Nothing PROVIDES 'python3-pybind11-native' -=C2=A0python3-s=
cipy_1.5.2.bb DEPENDS on or otherwise requires it - Is this required to add=
 this dependency?
2. ERROR: python3-scipy-1.5.2-r0 do_prepare_recipe_sysroot: The file /usr/=
lib/libblas.so.3 is installed by both openblas and lapack, aborting

--Qt9yj5fO2Uje67rabZHX
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

I tried to build "scipy" first using your repo, I have encountered the belo=
w two errors:<br /><br />1.&nbsp;ERROR: Nothing PROVIDES 'python3-pybind11-=
native' -&nbsp;python3-scipy_1.5.2.bb DEPENDS on or otherwise requires it -=
 Is this required to add this dependency?<br />2. ERROR: python3-scipy-1.5.=
2-r0 do_prepare_recipe_sysroot: The file /usr/lib/libblas.so.3 is installed=
 by both openblas and lapack, aborting

--Qt9yj5fO2Uje67rabZHX--
