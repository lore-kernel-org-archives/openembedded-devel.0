Received: from smtp.cbnco.com ([207.164.182.72])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1NWeBD-0004LV-5D
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 00:05:14 +0100
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 9B88D623ABD
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 18:02:58 -0500 (EST)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25876-06 for <openembedded-devel@lists.openembedded.org>; 
	Sun, 17 Jan 2010 18:02:58 -0500 (EST)
Received: from juice.ott.cti.com (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id 7020D622D93
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Jan 2010 18:02:58 -0500 (EST)
Date: Sun, 17 Jan 2010 18:02:58 -0500 (EST)
From: Michael Smith <msmith@cbnco.com>
X-X-Sender: michael@juice.ott.cti.com
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <201001172228.26477.sgh@sgh.dk>
Message-ID: <Pine.LNX.4.64.1001171801430.12229@juice.ott.cti.com>
References: <201001172228.26477.sgh@sgh.dk>
MIME-Version: 1.0
X-Virus-Scanned: amavisd-new at cbnco.com
X-SA-Exim-Connect-IP: 207.164.182.72
X-SA-Exim-Mail-From: msmith@cbnco.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Mesa packages and TLS
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
X-List-Received-Date: Sun, 17 Jan 2010 23:05:14 -0000
Content-Type: MULTIPART/MIXED; BOUNDARY="346837782-756854603-1263769378=:12229"

--346837782-756854603-1263769378=:12229
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Sun, 17 Jan 2010, S=C3=B8ren Holm wrote:

> Apparently the TLS support which is currently disables on uclibc targets=
=20
> is also broken on glibc.
>=20
> /usr/lib/dri/swrast_dri.so: undefined symbol: _glapi_tls_Context)
>=20
> Removing the line "inherit glx-use-tls" in mesa-common.inc makes software=
-rendering work=20
> again.

Hi S=C3=B8ren,

What MACHINE and DISTRO are you using? Which glibc version?

Mike

--346837782-756854603-1263769378=:12229--
