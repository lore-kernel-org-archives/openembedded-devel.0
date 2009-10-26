Received: from [74.125.78.148] (helo=ey-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <eballetbo@gmail.com>) id 1N2P04-0008Pr-So
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 13:48:43 +0100
Received: by ey-out-1920.google.com with SMTP id 26so671279eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 05:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=gtWTvkR1sL+Hrh7zAFeRYrBWVnmxg5ItNRdYyrEtPeY=;
	b=YRm4TiXERBFZw1LOxx0hxKwkZWklmYVmDbljA/n1RW+W/eEchmRXANmCDpiNG0ClH8
	jXGyLGHgua4dVjTiqIrvUU92xS82gLnktOJUzcgnTsgqN62KTYGyVH60j61LbSgc2Ir1
	fw9jM/cc5Aa8GMIZoXEuGJlQkxO9EYqB+W+rg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=V0y7rnG/Vv3brY/a1qUASLbyUyUOSkxJ5M5hI4dMAA3j2QZQl2eUjrWjwoUFqms/UL
	35rppto/NLwUjGY72XHhBhw/+a0BFvtuuUwOPZHx1O2syeFE86r/2WMK8ecOwRu5hknd
	L0vTk/XY0N5/8vINBdfut0dZ9OEeHuPJdIb8Y=
MIME-Version: 1.0
Received: by 10.216.89.135 with SMTP id c7mr175596wef.62.1256561257263; Mon, 
	26 Oct 2009 05:47:37 -0700 (PDT)
Date: Mon, 26 Oct 2009 13:47:37 +0100
Message-ID: <70c9a9110910260547q7c513336rc28555960bd4e5bd@mail.gmail.com>
From: =?UTF-8?Q?Enric_Balletb=C3=B2_i_Serra?= <eballetbo@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.78.148
X-SA-Exim-Mail-From: eballetbo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Connman and rootfs over NFS
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
X-List-Received-Date: Mon, 26 Oct 2009 12:48:44 -0000
Content-Type: text/plain; charset=UTF-8

Hi all,

Running my Angstrom image and mounting the rootfs over NFS seems that
the connman package reconfigures the network interface (nfs: server
192.168.2.6 not responding, still trying). There are any way to
prevent this ?

Thanks in advance,

    Enric


