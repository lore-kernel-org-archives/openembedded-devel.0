Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <eren@hambedded.org>) id 1TfDrd-0004Ij-3D
	for openembedded-devel@lists.openembedded.org;
	Sun, 02 Dec 2012 19:02:08 +0100
Received: by mail-ee0-f47.google.com with SMTP id e51so1151225eek.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 02 Dec 2012 09:47:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent:x-gm-message-state;
	bh=eUHtCQpBrv5cAnulmKYpcEw4vHouabQu3HEvGWr6qg8=;
	b=Sy5esf3LD4QyQ5QVZJKoFHwML0Z+j4lbZdWilIYXZLioTwerirtY60j6TuoP8TB2Lf
	sF7ChigdxcAnX/vCs2C5pw4CGp7wteoksrAVGVydp+4WxQdxnrR8Est5c18kQhHsxjnb
	yAtzcHJamNSTG7yw0HatRu5oaJ42iqkyaQSp4t3r7Cscqew4r4dWl7jJixC5rih+AYhn
	4Ze/wAGO71HFDuAkpsU3gMEm6uMcObhvoLFPyWlhIjR20T2vARhF4a9yUl5yoOvRMZer
	/MdYqXny7BGYxEQrIprQQW3DCec1iLR9rWEKuOn0/FZTwBBuf0tVHxoWqj/HdNW0d7Dz
	r23w==
Received: by 10.14.0.71 with SMTP id 47mr27213257eea.19.1354470459823;
	Sun, 02 Dec 2012 09:47:39 -0800 (PST)
Received: from gmail.com ([46.196.117.99])
	by mx.google.com with ESMTPS id e1sm25925875eem.3.2012.12.02.09.47.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 02 Dec 2012 09:47:38 -0800 (PST)
Date: Sun, 2 Dec 2012 19:47:23 +0200
From: Eren =?iso-8859-1?Q?T=FCrkay?= <eren@hambedded.org>
To: Yocto Discussion List <yocto@yoctoproject.org>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20121202174723.GA91088@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Gm-Message-State: ALoCoQnjAiSqyHu9lSQ7VdulzI7j7qowXekPxQ9yiWpivKh738l4vKwi0OP38fWpWbWdBxwnT4SF
Subject: [Draft] From Bitbake Hello World To an Image
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
X-List-Received-Date: Sun, 02 Dec 2012 18:02:08 -0000
X-Groupsio-MsgNum: 41856
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FCuugMFkClbJLl1L"
Content-Disposition: inline

--FCuugMFkClbJLl1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I have completed a document that tries to explain how image is created
using openembedded starting from bitbake fundementals. The document
reflects my own understanding and includes the information that I wished
to have when I first involved in understanding openembedded.

This is aimed for people who want get the big picture with some details
under the hood (What's the sequence of creating an image, how is source
fetched, patched, configured, and installed? How is ipk, rpm, and deb
created? How is image produced?)

People who know bitbake can skip to "Understanding OpenEmbedded" part.
However, I suggest them to play with plain bitbake and read the first
chapter as bitbake is the hearth of OpenEmbedded.

There are additional information required which are marked with "FIXME"
keywords. Suggestions and contributions are welcomed.

I don't know how it can be integrated to current documentation but I
would like to help if that's the case. The licence of the work is CC
BY-SA. Use it, change it, adapt it, distribute it, as long as you
attribute the original work and the author :)

Document:
http://hambedded.org/blog/2012/11/24/from-bitbake-hello-world-to-an-image/

Markdown source:
https://github.com/hambedded-linux/hambedded-linux.github.com/tree/source/s=
ource/_posts

Regards,
Eren

--=20
    . 73! DE TA1AET
      http://erenturkay.com/

--FCuugMFkClbJLl1L
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (Darwin)

iQIcBAEBAgAGBQJQu5QrAAoJEOM7bMm6HhcTnCwP/0behWpEyH9FvYYLqbF6JUKr
GfPAaKHpXpGDJZEpo2jPCdkkykMVoy9gQmzrgiwXIagZUhbdeR68R6ZnpWN33n/U
WMj19pDXa0Dq+UIC+YUkKBj3RTaDfR/r1bjI+PADaH7EKPTwxhgd0gSLzp6kXo+F
Zx+HpNTFRtDfHfekL4X+6yvq7N07DaoF6G3HK0FbZCdqsLgivuKkMMEkEg9z43lf
ckDXecrmxgvrHtJxs1tKtwIDNuil9a9LBSsp5bATMkTCdazfuVczMa47h9HgNJiw
FE3DWA3JKQt7uYrJogwzLokPsk3EZ9sqkp7cy+wZEALzKIyoT5WK19itjdy9V1NS
zJLQHlBiRi9quTHjWh9o7/l/Zz+yRKaap6rBc2mtmDRTQZm/SofuyzGddKM5xUaP
VjYQFdygocUuFy1yAzltrJw+5B2Xhwrx9zdV4+Y+rYlEVE1bYDkvEln7MNIx8z1I
UxIqmEa8wZOKcfRMPJkdFdL6N0GMnBDEhXa5//Oljzw/QJjAexrLykioNA7OE15N
xtnv0H4CF9AkrIiPSgorEPjTGPWdEMdzaLANEJnyvtIcJGIe4NXdVMiCgf4FSCY1
T0SSSGBiDrqKTceHDRWx+PmtdYTVjBUicYD/ZZH36+hfpjspCHMxZTTa2l/Uyj3b
5JVXgVooU/Y8BScF0xr5
=PPZh
-----END PGP SIGNATURE-----

--FCuugMFkClbJLl1L--
