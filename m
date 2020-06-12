Subject: Re: [meta-python][PATCH] python3-fastapi and python3-uvicorn: add packages and dependencies
To: openembedded-devel@lists.openembedded.org
From: "Fagundes, Paulo" <paulohefagundes@gmail.com>
X-Originating-Location: Herriman, Utah, US (24.11.33.45)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Fri, 12 Jun 2020 13:01:24 -0700
References: <20200612195425.36226-1-paulohefagundes@gmail.com>
In-Reply-To: <20200612195425.36226-1-paulohefagundes@gmail.com>
Message-ID: <7695.1591992084920889109@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="Hm2D63wAD1iAHtpfivKp"

--Hm2D63wAD1iAHtpfivKp
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

this is only my second upstream patch to this project, so I'm still learnin=
g about email patches and about the standards. I'm not sure if it's ok to a=
dd multiple recipes to a single commit, but I added these because I added f=
astapi and uvicorn to our project and all of these dependencies were needed=
.

another thing to note is that some of my peers were having trouble buildin=
g uvloop.
I was able to build uvloop just fine on my Arch Linux system, but my peers=
 on Ubuntu 18.04 LTS got errors in the compile stage when uvloop tried to c=
all ./configure

So if anyone can check that it works for them that would be great

Let me know if this patch is ok and if we need to separate it into differe=
nt patches for each recipe let me know. Thanks

--Hm2D63wAD1iAHtpfivKp
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

this is only my second upstream patch to this project, so I'm still learnin=
g about email patches and about the standards. I'm not sure if it's ok to a=
dd multiple recipes to a single commit, but I added these because I added f=
astapi and uvicorn to our project and all of these dependencies were needed=
.<br /><br />another thing to note is that some of my peers were having tro=
uble building uvloop.<br />I was able to build uvloop just fine on my Arch =
Linux system, but my peers on Ubuntu 18.04 LTS got errors in the compile st=
age when uvloop tried to call ./configure<br /><br />So if anyone can check=
 that it works for them that would be great<br /><br />Let me know if this =
patch is ok and if we need to separate it into different patches for each r=
ecipe let me know. Thanks

--Hm2D63wAD1iAHtpfivKp--
