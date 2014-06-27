Return-Path: <Daniel.MONDON@lpgsystems.com>
Received: from antispam.lpg.priv (mail.lpgsystems.com [46.18.228.1])
	by mail.openembedded.org (Postfix) with ESMTP id 233D760030
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 13:53:29 +0000 (UTC)
Received: from SEXCHANGE0100.lpg.priv (unknown [10.1.1.25])
	by antispam.lpg.priv (mail.lpgsystems.com) with ESMTP id 6DF4B3300BE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 27 Jun 2014 15:53:29 +0200 (CEST)
Received: from SEXCHANGE0100.lpg.priv ([::1]) by SEXCHANGE0100.lpg.priv
	([::1]) with mapi id 14.03.0181.006; Fri, 27 Jun 2014 15:53:29 +0200
From: MONDON Daniel <Daniel.MONDON@lpgsystems.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe]  Building Java 7
Thread-Index: AQHPkg8rcz0xMCt0GEuyqUMJw+bSjQ==
Date: Fri, 27 Jun 2014 13:53:27 +0000
Message-ID: <F48900D76F0D8349918584FEEFEB4BCA0612C63E@SEXCHANGE0100.lpg.priv>
References: <1403794582-16605-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
In-Reply-To: <F48900D76F0D8349918584FEEFEB4BCA0612C430@SEXCHANGE0100.lpg.priv>
Accept-Language: fr-FR, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.1.5.34]
MIME-Version: 1.0
X-DRWEB-SCAN: ok
X-VRSPAM-SCORE: 0
X-VRSPAM-STATE: legit
X-VRSPAM-CAUSE: gggruggvucftvghtrhhoucdtuddrfeejfedrtdeiucetufdoteggodetrfcurfhrohhfihhlvgemuceonhhonhgvqeenuceurghilhhouhhtmecufedttdenuc
Subject: Re: Building Java 7
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 27 Jun 2014 13:53:30 -0000
Content-Language: fr-FR
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

>Hi,
>
>I'm back building Java 7 for Arm. (what about Java 8?)
>
>
>I've got the error : :(
>WARNING: Failed to fetch URL https://github.com/downloads/mozilla/rhino/rh=
ino1_7R4.zip, attempting MIRRORS if available
>ERROR: Fetcher failure: Fetch command failed with exit code 4, output:
>OpenSSL: error:14077410:SSL routines:SSL23_GET_SERVER_HELLO:sslv3 alert ha=
ndshake failure Unable to establish SSL connection.
>
>ERROR: Function failed: Fetcher failure for URL: 'https://github.com/downl=
oads/mozilla/rhino/rhino1_7R4.zip'. Unable to fetch URL from any source.
>ERROR: Logfile of failure stored in: /home/me/poky/build/tmp/work/x86_64-l=
inux/rhino-native/1.7r4-r0/temp/log.do_fetch.24461
>ERROR: Task 1806 (virtual:native:/home/me/poky/meta-java/recipes-core/rhin=
o/rhino_1.7r4.bb, do_fetch) failed with exit code '1'
>NOTE: Tasks Summary: Attempted 1211 tasks of which 1183 didn't need to be =
rerun and 1 failed.
>
>With the log file joined.
>
>Thanks,
>Daniel.


Hi,

Is it a configuration error ? (...wget bug ?)

I am under a virtualized Ubuntu server 12.04.

Thanks
Daniel.



