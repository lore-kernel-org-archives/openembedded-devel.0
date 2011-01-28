Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PivUq-0007FD-9r
	for openembedded-devel@lists.openembedded.org;
	Fri, 28 Jan 2011 22:04:45 +0100
Received: by iyj18 with SMTP id 18so3111059iyj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 28 Jan 2011 13:03:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=l0vMwyCVB3Fjrtqw/baouOvOo9nL2kT0pxvi3ibStcA=;
	b=ptMsrxB1mLqfSUHS/Jthl2qqRH7iik0mLMCO+GwiBpEN4bfYZXMXa49b2mxedcAEiu
	vYQx68RWXu9/s8cO4PLA1VkxC+P6Xq3ZX/0xjVkLNXH4SwJOMQgspOu7iQhs9pVl0VOL
	gw4bBWNhfP4RE1wMAI4LQ9VZbUppmEhJr2ANQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rSQawakzfa/PF0KK3jL5V8/zaWvVC2mJxAsK+g7cr8N29TVinX3hnX+x5a1f7a4kHI
	gXZC51uJ8TE+e5o8Q9X6E56JEaoErTr/D7wIRrAAAvPwbq23A+iujpj1HFORoRi6LX9h
	yvcaHJzrqbnnGKmBEf0iY1t6KrQpr3cA+6QSE=
MIME-Version: 1.0
Received: by 10.231.37.12 with SMTP id v12mr3268925ibd.83.1296248631868; Fri,
	28 Jan 2011 13:03:51 -0800 (PST)
Received: by 10.231.36.68 with HTTP; Fri, 28 Jan 2011 13:03:51 -0800 (PST)
In-Reply-To: <1296240753-10120-2-git-send-email-tom_rini@mentor.com>
References: <1296240753-10120-1-git-send-email-tom_rini@mentor.com>
	<1296240753-10120-2-git-send-email-tom_rini@mentor.com>
Date: Fri, 28 Jan 2011 22:03:51 +0100
Message-ID: <AANLkTim1spOHb12WMez1q5mC1wKSmyZ4g2+-UA27Ltu0@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/5] perl: Drop 5.8.8, bump PR in all perl recipes
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
X-List-Received-Date: Fri, 28 Jan 2011 21:04:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/28 Tom Rini <tom_rini@mentor.com>:
> Signed-off-by: Tom Rini <tom_rini@mentor.com>
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

I've been using this for a few months without problem

> ---
> =A0recipes/perl/libalgorithm-diff-perl_1.1902.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libarchive-tar-perl_1.30.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libarchive-zip-perl_1.30.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libauthen-pam-perl_0.16.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libcache-cache-perl_1.06.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libclass-container-perl_0.12.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0.../perl/libclass-data-inheritable-perl_0.08.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libclass-factory-util-perl_1.7.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libclass-inspector-perl_1.24.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libclass-methodmaker-perl_2.15.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libclass-singleton-perl_1.4.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libcompress-raw-zlib-perl_2.023.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libcompress-zlib-perl_1.42.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libcompress-zlib-perl_2.015.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libconfig-general-perl_2.44.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libconvert-binhex-perl_1.119.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb =A0| =A0 =A01 +
> =A0recipes/perl/libcrypt-openssl-random-perl_0.04.bb =A0| =A0 =A01 +
> =A0recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/perl/libcrypt-rijndael-perl_1.08.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libcrypt-unixcrypt-perl_1.0.bb =A0 =A0 =A0 =A0| =A0 =A01 =
+
> =A0recipes/perl/libcurses-perl_1.28.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/perl/libcurses-ui-perl_0.9607.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libdata-optlist-perl_0.101.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libdate-manip-perl_5.54.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0.../perl/libdatetime-format-builder-perl_0.80.bb =A0 | =A0 =A02 +-
> =A0.../perl/libdatetime-format-iso8601-perl_0.07.bb =A0 | =A0 =A02 +-
> =A0.../libdatetime-format-strptime-perl_1.1000.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libdatetime-locale-perl_0.45.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libdatetime-perl_0.61.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libdatetime-timezone-perl_1.21.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libdb-file-perl_1.820.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libdbd-mysql-perl-native_4.010.bb =A0 =A0 | =A0 =A01 +
> =A0recipes/perl/libdbd-mysql-perl.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0recipes/perl/libdbd-mysql-perl_4.010.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 +
> =A0recipes/perl/libdbd-sqlite-perl_1.31.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libdbi-perl_1.607.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/libdbix-simple-perl_1.32.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libdevel-stacktrace-perl_1.13.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libdevice-serialport-perl_1.04.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libdigest-hmac-perl_1.02.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libdigest-sha1-perl_2.11.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libdigest-sha_5.47.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =
=A0 =A02 +-
> =A0recipes/perl/libemail-date-format-perl_1.002.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libencode-detect-perl_1.01.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/liberror-perl_0.17004.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/liberror-perl_0.17016.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libexception-class-perl_1.23.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libexpect-perl_1.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/perl/libextutils-cbuilder-perl_0.18.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libextutils-depends-perl_0.205.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libextutils-parsexs-perl_2.16.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libextutils-pkgconfig-perl_1.07.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libfile-slurp-perl_9999.13.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libfilesys-df-perl_0.92.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libhtml-mason-perl_1.35.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libhtml-parser-perl_3.60.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libhtml-parser-perl_3.64.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libhtml-tagset-perl_3.20.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libhtml-treebuilder-perl_3.23.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libhttp-cache-transparent-perl_1.0.bb | =A0 =A02 +-
> =A0recipes/perl/libimage-size-perl_3.230.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libintl-perl_1.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/libintl-perl_1.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/libio-compress-base-perl_2.015.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libio-compress-zlib-perl_2.015.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libio-pty-perl_1.07.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/perl/libio-socket-inet6-perl_2.61.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libio-socket-ssl-perl_1.32.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libio-stringy-perl_2.110.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libio-stty-perl_0.02.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libio-zlib-perl_1.04.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libio-zlib-perl_1.10.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libip-country-perl_2.27.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libipc-sharelite-perl_0.09.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/liblingua-en-numbers-ordinate_1.02.bb | =A0 =A02 +-
> =A0recipes/perl/liblinux-dvb-perl_1.0.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/liblist-moreutils-perl_0.22.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/liblocale-gettext-perl_1.05.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/liblog-dispatch-perl_2.13.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0recipes/perl/liblog-log4perl-perl_1.06.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0recipes/perl/libmail-dkim-perl_0.37.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libmail-sendmail-perl_0.79.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libmail-spf-perl_2.007.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libmailtools-perl_2.06.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libmath-bigint-gmp-perl_1.18.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libmime-lite-perl_3.024.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libmime-tools-perl_5.427.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libmodule-build-perl-native_0.2805.bb | =A0 =A08 -
> =A0recipes/perl/libmodule-build-perl_0.2805.bb =A0 =A0 =A0 =A0| =A0 18 -
> =A0recipes/perl/libmodule-load-perl_0.16.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libnet-cidr-perl_0.13.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libnet-dbus-perl_0.33.5.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libnet-dbus-perl_0.33.6.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libnet-dns-perl_0.66.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0.../libnet-dns-resolver-programmable-perl_0.003.bb | =A0 =A02 +-
> =A0recipes/perl/libnet-ident-perl_1.20.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libnet-ip-perl_1.25.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A02 +-
> =A0recipes/perl/libnet-pcap-perl_0.16.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libnet-rawip-perl_0.25.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libnet-ssleay-perl_1.36.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libnetaddr-ip-perl_4.027.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libnetpacket-perl_0.41.1.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libnetserver-generic-perl_1.03.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libole-storage-lite-perl_0.19.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libparams-util-perl_0.20.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libparams-validate-perl_0.95.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libperl6-junction-perl_1.10.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libphp-serialization-perl_0.30.bb =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libpoe-perl_1.007.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/libsnmp-session-perl_1.12.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0recipes/perl/libsoap-lite-perl_0.712.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libsocket6-perl_0.23.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libsub-exporter-perl_0.970.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libsub-install-perl_0.922.bb =A0 =A0 =A0 =A0 =A0| =A0 =A0=
2 +-
> =A0recipes/perl/libsub-uplevel-perl_0.13.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libsys-hostname-long-perl_1.4.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libsys-mmap-perl_0.13.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libtask-weaken-perl_1.03.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libterm-progressbar-perl_2.09.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libtermreadkey-perl_2.30.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libtest-builder-tester-perl_1.01.bb =A0 | =A0 =A02 +-
> =A0recipes/perl/libtest-differences-perl_0.47.bb =A0 =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/libtest-exception-perl_0.22.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libtest-mockmodule-perl_0.05.bb =A0 =A0 =A0 | =A0 =A02 +-
> =A0recipes/perl/libtest-output-perl_0.10.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libtest-pod-perl_1.42.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libtext-diff-perl_0.35.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libtimedate-perl_1.20.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libtree-dag-node-perl_1.06.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libtree-simple-perl_1.18.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libunicode-string-perl_2.09.bb =A0 =A0 =A0 =A0| =A0 =A02 =
+-
> =A0recipes/perl/libunicode-utf8simple-perl_1.06.bb =A0 =A0| =A0 =A02 +-
> =A0recipes/perl/liburi-perl_1.55.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/perl/libversion-perl_0.6701.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libversion-perl_0.82.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libwww-mechanize-perl_1.60.bb =A0 =A0 =A0 =A0 | =A0 =A02 =
+-
> =A0recipes/perl/libwww-perl_5.834.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/libx10-perl_0.03.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 |=
 =A0 =A02 +-
> =A0recipes/perl/libxml-dom-perl_1.44.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libxml-generator-perl_1.03.bb =A0 =A0 =A0 =A0 | =A0 =A01 =
+
> =A0recipes/perl/libxml-libxml-perl_1.70.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libxml-namespacesupport-perl_1.11.bb =A0| =A0 =A02 +-
> =A0recipes/perl/libxml-parser-perl_2.36.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libxml-regexp-perl_0.03.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libxml-sax-perl_0.96.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 =A02 +-
> =A0recipes/perl/libxml-simple-perl_2.18.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A02 +-
> =A0recipes/perl/libxml-twig-perl_3.35.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 =A02 +-
> =A0recipes/perl/libxml-writer-perl_0.606.bb =A0 =A0 =A0 =A0 =A0 | =A0 =A0=
2 +-
> =A0recipes/perl/libxml-xpath-perl_1.13.bb =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
> =A0recipes/perl/libyaml-perl_0.62.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A02 +-
> =A0recipes/perl/perl-5.8.8/09_fix_installperl.patch =A0 | =A0 32 -
> =A0.../perl/perl-5.8.8/52_debian_extutils_hacks.patch | =A0234 -----
> =A0recipes/perl/perl-5.8.8/53_debian_mod_paths.patch =A0| =A0107 --
> =A0recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch =A0| =A0 16 -
> =A0.../perl-5.8.8/58_debian_cpan_config_path.patch =A0 =A0| =A0 14 -
> =A0.../perl-5.8.8/60_debian_libnet_config_path.patch =A0| =A0 16 -
> =A0.../perl-5.8.8/62_debian_cpan_definstalldirs.patch | =A0 16 -
> =A0recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch | =A0 28 -
> =A0recipes/perl/perl-5.8.8/Makefile.SH.patch =A0 =A0 =A0 =A0 =A0| =A0253 =
-----
> =A0recipes/perl/perl-5.8.8/Makefile.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 6=
1 --
> =A0recipes/perl/perl-5.8.8/asm-pageh-fix.patch =A0 =A0 =A0 =A0| =A0 19 -
> =A0recipes/perl/perl-5.8.8/config.sh =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 1021 --------------------
> =A0recipes/perl/perl-5.8.8/config.sh-32 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 58 --
> =A0recipes/perl/perl-5.8.8/config.sh-32-be =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A0recipes/perl/perl-5.8.8/config.sh-32-le =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A0recipes/perl/perl-5.8.8/config.sh-64 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0=
 58 --
> =A0recipes/perl/perl-5.8.8/config.sh-64-be =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A0recipes/perl/perl-5.8.8/config.sh-64-le =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A01 -
> =A0recipes/perl/perl-5.8.8/generate-sh.patch =A0 =A0 =A0 =A0 =A0| =A0 46 =
-
> =A0recipes/perl/perl-5.8.8/installperl.patch =A0 =A0 =A0 =A0 =A0| =A0 15 =
-
> =A0recipes/perl/perl-5.8.8/makedepend-dash.patch =A0 =A0 =A0| =A0 13 -
> =A0recipes/perl/perl-5.8.8/native-no-gdbminc.patch =A0 =A0| =A0 18 -
> =A0recipes/perl/perl-5.8.8/native-nopacklist.patch =A0 =A0| =A0 84 --
> =A0recipes/perl/perl-5.8.8/native-perlinc.patch =A0 =A0 =A0 | =A0 24 -
> =A0recipes/perl/perl-5.8.8/perl-configpm-switch.patch | =A0 34 -
> =A0recipes/perl/perl-5.8.8/perl-configure.sh =A0 =A0 =A0 =A0 =A0| =A0 43 =
-
> =A0recipes/perl/perl-5.8.8/perl-dynloader.patch =A0 =A0 =A0 | =A0 23 -
> =A0recipes/perl/perl-5.8.8/perl-moreconfig.patch =A0 =A0 =A0| =A0 16 -
> =A0recipes/perl/perl-5.8.8/shared-ldflags.patch =A0 =A0 =A0 | =A0 11 -
> =A0recipes/perl/perl-native_5.8.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0114 ---
> =A0recipes/perl/perl_5.8.8.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 | =A0248 -----
> =A0182 files changed, 149 insertions(+), 2794 deletions(-)
> =A0delete mode 100644 recipes/perl/libmodule-build-perl-native_0.2805.bb
> =A0delete mode 100644 recipes/perl/libmodule-build-perl_0.2805.bb
> =A0delete mode 100644 recipes/perl/perl-5.8.8/09_fix_installperl.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/52_debian_extutils_hacks.pa=
tch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/53_debian_mod_paths.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/58_debian_cpan_config_path.=
patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/60_debian_libnet_config_pat=
h.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/62_debian_cpan_definstalldi=
rs.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/Makefile.SH.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/Makefile.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/asm-pageh-fix.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32-be
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-32-le
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64-be
> =A0delete mode 100644 recipes/perl/perl-5.8.8/config.sh-64-le
> =A0delete mode 100644 recipes/perl/perl-5.8.8/generate-sh.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/installperl.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/makedepend-dash.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/native-no-gdbminc.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/native-nopacklist.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/native-perlinc.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/perl-configpm-switch.patch
> =A0delete mode 100755 recipes/perl/perl-5.8.8/perl-configure.sh
> =A0delete mode 100644 recipes/perl/perl-5.8.8/perl-dynloader.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/perl-moreconfig.patch
> =A0delete mode 100644 recipes/perl/perl-5.8.8/shared-ldflags.patch
> =A0delete mode 100644 recipes/perl/perl-native_5.8.8.bb
> =A0delete mode 100644 recipes/perl/perl_5.8.8.bb
>
> diff --git a/recipes/perl/libalgorithm-diff-perl_1.1902.bb b/recipes/perl=
/libalgorithm-diff-perl_1.1902.bb
> index 7aa27b1..10a9b24 100644
> --- a/recipes/perl/libalgorithm-diff-perl_1.1902.bb
> +++ b/recipes/perl/libalgorithm-diff-perl_1.1902.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-exporter perl-module-strict perl-modu=
le-vars \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-strict perl-module-vars"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TY/TYEMQ/Algorit=
hm-Diff-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libarchive-tar-perl_1.30.bb b/recipes/perl/liba=
rchive-tar-perl_1.30.bb
> index 6c59b53..4b0a1a6 100644
> --- a/recipes/perl/libarchive-tar-perl_1.30.bb
> +++ b/recipes/perl/libarchive-tar-perl_1.30.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libio-zlib-perl-native"
> =A0RDEPENDS_${PN} +=3D "libio-zlib-perl"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/K/KA/KANE/Archive-=
Tar-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libarchive-zip-perl_1.30.bb b/recipes/perl/liba=
rchive-zip-perl_1.30.bb
> index 978123d..b932c83 100644
> --- a/recipes/perl/libarchive-zip-perl_1.30.bb
> +++ b/recipes/perl/libarchive-zip-perl_1.30.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
>
> =A0DEPENDS +=3D "libio-zlib-perl-native"
> =A0RDEPENDS_${PN} +=3D "libio-zlib-perl"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Archive=
-Zip-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libauthen-pam-perl_0.16.bb b/recipes/perl/libau=
then-pam-perl_0.16.bb
> index a76964d..b724c9b 100644
> --- a/recipes/perl/libauthen-pam-perl_0.16.bb
> +++ b/recipes/perl/libauthen-pam-perl_0.16.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libpam"
> =A0RDEPENDS_${PN} =3D "perl-module-posix"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/N/NI/NIKIP/Authen-=
PAM-${PV}.tar.gz;name=3Dauthen-pam-perl-${PV}"
> =A0SRC_URI[authen-pam-perl-0.16.md5sum] =3D "7278471dfa694d9ef312bc92d709=
9af2"
> diff --git a/recipes/perl/libcache-cache-perl_1.06.bb b/recipes/perl/libc=
ache-cache-perl_1.06.bb
> index d02f533..254b12f 100644
> --- a/recipes/perl/libcache-cache-perl_1.06.bb
> +++ b/recipes/perl/libcache-cache-perl_1.06.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libdigest-sha1-perl-native liberror-perl-native \
> =A0 =A0 =A0 =A0 =A0 =A0libipc-sharelite-perl-native"
> =A0RDEPENDS_${PN} =3D "libdigest-sha1-perl liberror-perl libipc-sharelite=
-perl"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JS/JSWARTZ/Cache=
-Cache-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libclass-container-perl_0.12.bb b/recipes/perl/=
libclass-container-perl_0.12.bb
> index dceb935..7965c58 100644
> --- a/recipes/perl/libclass-container-perl_0.12.bb
> +++ b/recipes/perl/libclass-container-perl_0.12.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libparams-validate-perl-native"
> =A0RDEPENDS_${PN} =3D "libparams-validate-perl"
> -PR =3D "r8"
> +PR =3D "r9"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Cla=
ss-Container-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libclass-data-inheritable-perl_0.08.bb b/recipe=
s/perl/libclass-data-inheritable-perl_0.08.bb
> index d555202..c361204 100644
> --- a/recipes/perl/libclass-data-inheritable-perl_0.08.bb
> +++ b/recipes/perl/libclass-data-inheritable-perl_0.08.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Class::Data::Inheritable - Inheritable, overridable c=
lass data"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TM/TMTM/Class-Da=
ta-Inheritable-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libclass-factory-util-perl_1.7.bb b/recipes/per=
l/libclass-factory-util-perl_1.7.bb
> index e7c3e11..d63b0b2 100644
> --- a/recipes/perl/libclass-factory-util-perl_1.7.bb
> +++ b/recipes/perl/libclass-factory-util-perl_1.7.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Class::Factory::Util - Provide utility m=
ethods for factory classe
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libmodule-build-perl-native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Class=
-Factory-Util-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "aebd79da361b676a7ecd3245fc3d1b3f"
> diff --git a/recipes/perl/libclass-inspector-perl_1.24.bb b/recipes/perl/=
libclass-inspector-perl_1.24.bb
> index 47b039a..96ea344 100644
> --- a/recipes/perl/libclass-inspector-perl_1.24.bb
> +++ b/recipes/perl/libclass-inspector-perl_1.24.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Class::Inspector - Get information about a class and =
its structure"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Class-I=
nspector-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libclass-methodmaker-perl_2.15.bb b/recipes/per=
l/libclass-methodmaker-perl_2.15.bb
> index b57bd0b..2c04405 100644
> --- a/recipes/perl/libclass-methodmaker-perl_2.15.bb
> +++ b/recipes/perl/libclass-methodmaker-perl_2.15.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Class::MethodMaker - Create generic methods for OO Pe=
rl"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "unknown"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SC/SCHWIGON/clas=
s-methodmaker/Class-MethodMaker-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libclass-singleton-perl_1.4.bb b/recipes/perl/l=
ibclass-singleton-perl_1.4.bb
> index b48bc9b..bcc1154 100644
> --- a/recipes/perl/libclass-singleton-perl_1.4.bb
> +++ b/recipes/perl/libclass-singleton-perl_1.4.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Class::Singleton - Implementation of a "Singleton" cl=
ass"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AB/ABW/Class-Sin=
gleton-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libcompress-raw-zlib-perl_2.023.bb b/recipes/pe=
rl/libcompress-raw-zlib-perl_2.023.bb
> index 6e5f298..3c214a6 100644
> --- a/recipes/perl/libcompress-raw-zlib-perl_2.023.bb
> +++ b/recipes/perl/libcompress-raw-zlib-perl_2.023.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Compress::Raw::Zlib - Low-Level Interfac=
e to zlib compression lib
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "expat expat-native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress=
-Raw-Zlib-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libcompress-zlib-perl_1.42.bb b/recipes/perl/li=
bcompress-zlib-perl_1.42.bb
> index e6d5aaa..7f5c563 100644
> --- a/recipes/perl/libcompress-zlib-perl_1.42.bb
> +++ b/recipes/perl/libcompress-zlib-perl_1.42.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Compress::Zlib - Interface to zlib compression librar=
y"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r10"
> +PR =3D "r21"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress=
-Zlib-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libcompress-zlib-perl_2.015.bb b/recipes/perl/l=
ibcompress-zlib-perl_2.015.bb
> index 7c8522c..5befa37 100644
> --- a/recipes/perl/libcompress-zlib-perl_2.015.bb
> +++ b/recipes/perl/libcompress-zlib-perl_2.015.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Compress::Zlib - Interface to zlib compression librar=
y"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r12"
> +PR =3D "r23"
> =A0RDEPENDS_${PN} +=3D "libio-compress-base-perl libcompress-raw-zlib-per=
l libio-compress-zlib-perl"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PM/PMQS/Compress=
-Zlib-${PV}.tar.gz"
> diff --git a/recipes/perl/libconfig-general-perl_2.44.bb b/recipes/perl/l=
ibconfig-general-perl_2.44.bb
> index 11e5b2c..dc24f73 100644
> --- a/recipes/perl/libconfig-general-perl_2.44.bb
> +++ b/recipes/perl/libconfig-general-perl_2.44.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Generic Configuration Module"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TL/TLINDEN/Confi=
g-General-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libconvert-binhex-perl_1.119.bb b/recipes/perl/=
libconvert-binhex-perl_1.119.bb
> index a85b275..d645425 100644
> --- a/recipes/perl/libconvert-binhex-perl_1.119.bb
> +++ b/recipes/perl/libconvert-binhex-perl_1.119.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Convert::BinHex - extract data from Maci=
ntosh BinHex files"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/E/ER/ERYQ/Convert-=
BinHex-${PV}.tar.gz;name=3Dconvert-binhex-perl-${PV}"
> =A0SRC_URI[convert-binhex-perl-1.119.md5sum] =3D "ba70ad1772abac6270078f2=
8197a7961"
> diff --git a/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb b/recipes/=
perl/libcrypt-openssl-bignum-perl_0.04.bb
> index 6b9b5f5..6959ec8 100644
> --- a/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb
> +++ b/recipes/perl/libcrypt-openssl-bignum-perl_0.04.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "OpenSSL's multiprecision integer arithme=
tic"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "openssl"
> +PR =3D "r1"
> =A0BBCLASSEXTEND =3D "native"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/I/IR/IROBERTS/Cryp=
t-OpenSSL-Bignum-${PV}.tar.gz;name=3Dcrypt-openssl-bignum-perl-${PV}"
> diff --git a/recipes/perl/libcrypt-openssl-random-perl_0.04.bb b/recipes/=
perl/libcrypt-openssl-random-perl_0.04.bb
> index dc72e2a..d56cfdc 100644
> --- a/recipes/perl/libcrypt-openssl-random-perl_0.04.bb
> +++ b/recipes/perl/libcrypt-openssl-random-perl_0.04.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "Perl: random routines for Crypt::OpenSSL=
::RSA"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "openssl"
> +PR =3D "r1"
> =A0BBCLASSEXTEND =3D "native"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/I/IR/IROBERTS/Cryp=
t-OpenSSL-Random-${PV}.tar.gz;name=3Dcrypt-openssl-random-perl-${PV}"
> diff --git a/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb b/recipes/per=
l/libcrypt-openssl-rsa-perl_0.26.bb
> index 0178eaa..33ebd63 100644
> --- a/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb
> +++ b/recipes/perl/libcrypt-openssl-rsa-perl_0.26.bb
> @@ -2,6 +2,7 @@ DESCRIPTION =3D "RSA encoding and decoding, using the ope=
nSSL libraries"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "openssl"
> +PR =3D "r1"
> =A0RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0libcrypt-openssl-bignum-perl \
> =A0 =A0 =A0 =A0libcrypt-openssl-random-perl \
> diff --git a/recipes/perl/libcrypt-rijndael-perl_1.08.bb b/recipes/perl/l=
ibcrypt-rijndael-perl_1.08.bb
> index 4ffbeaf..62e3ae7 100644
> --- a/recipes/perl/libcrypt-rijndael-perl_1.08.bb
> +++ b/recipes/perl/libcrypt-rijndael-perl_1.08.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Crypt::Rijndael - Crypt::CBC compliant R=
ijndael encryption module
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "GPLv2"
> =A0DEPENDS +=3D "expat expat-native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/B/BD/BDFOY/Crypt-R=
ijndael-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb b/recipes/perl/l=
ibcrypt-unixcrypt-perl_1.0.bb
> index 14112f4..5654945 100644
> --- a/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb
> +++ b/recipes/perl/libcrypt-unixcrypt-perl_1.0.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "Crypt::UnixCrypt - perl-only implementation of the cr=
ypt function."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> +PR =3D "r1"
> =A0BBCLASSEXTEND =3D "native"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MV/MVORL/Crypt-U=
nixCrypt-${PV}.tar.gz;name=3Dcrypt-unixcrypt-perl-${PV}"
> diff --git a/recipes/perl/libcurses-perl_1.28.bb b/recipes/perl/libcurses=
-perl_1.28.bb
> index 0495363..a6a4387 100644
> --- a/recipes/perl/libcurses-perl_1.28.bb
> +++ b/recipes/perl/libcurses-perl_1.28.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "ncurses"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GI/GIRAFFED/Curs=
es-${PV}.tgz;name=3Dcurses-perl-${PV}"
> =A0SRC_URI[curses-perl-1.28.md5sum] =3D "ed9f7ddf2d90f4266da91c3dc9fad9c9=
"
> diff --git a/recipes/perl/libcurses-ui-perl_0.9607.bb b/recipes/perl/libc=
urses-ui-perl_0.9607.bb
> index d7fe4c1..b4ff29d 100644
> --- a/recipes/perl/libcurses-ui-perl_0.9607.bb
> +++ b/recipes/perl/libcurses-ui-perl_0.9607.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0 "
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MD/MDXI/Curses-U=
I-${PV}.tar.gz;name=3Dcurses-ui-perl-${PV}"
> =A0SRC_URI[curses-ui-perl-0.9607.md5sum] =3D "8970c72e378aa386e0e79a884ef=
5863a"
> diff --git a/recipes/perl/libdata-optlist-perl_0.101.bb b/recipes/perl/li=
bdata-optlist-perl_0.101.bb
> index b3ee15e..8a1dcc8 100644
> --- a/recipes/perl/libdata-optlist-perl_0.101.bb
> +++ b/recipes/perl/libdata-optlist-perl_0.101.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libsub-install-perl-native libparams-util-perl-native"
> =A0RDEPENDS_${PN} +=3D "perl-module-list-util libparams-util-perl perl-mo=
dule-strict \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0libsub-install-perl perl-module-warnings "
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Data-Opt=
List-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libdate-manip-perl_5.54.bb b/recipes/perl/libda=
te-manip-perl_5.54.bb
> index 183f0d4..ffeb223 100644
> --- a/recipes/perl/libdate-manip-perl_5.54.bb
> +++ b/recipes/perl/libdate-manip-perl_5.54.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Date and time manipulation routines."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-test-more \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-io-file \
> diff --git a/recipes/perl/libdatetime-format-builder-perl_0.80.bb b/recip=
es/perl/libdatetime-format-builder-perl_0.80.bb
> index 7242d5c..9ae2b76 100644
> --- a/recipes/perl/libdatetime-format-builder-perl_0.80.bb
> +++ b/recipes/perl/libdatetime-format-builder-perl_0.80.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D " libclass-factory-util-perl-native libdatetime-perl-nativ=
e libdatetime-format-strptime-perl-native \
> =A0 =A0 =A0 =A0libtask-weaken-perl-native "
> =A0RDEPENDS_${PN} =3D " libclass-factory-util-perl libdatetime-perl libda=
tetime-format-strptime-perl libtask-weaken-perl "
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateT=
ime-Format-Builder-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "f6c5d5a17b5b7478ff555a2d3cce5136"
> diff --git a/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb b/recip=
es/perl/libdatetime-format-iso8601-perl_0.07.bb
> index dec6e81..8f256c4 100644
> --- a/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb
> +++ b/recipes/perl/libdatetime-format-iso8601-perl_0.07.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D " libdatetime-perl-native libdatetime-format-builder-perl-=
native "
> =A0RDEPENDS_${PN} =3D " libdatetime-perl libdatetime-format-builder-perl =
"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JH/JHOBLITT/Date=
Time-Format-ISO8601-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "debb51180d0318ae09cad01c544a1d7d"
> diff --git a/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb b/re=
cipes/perl/libdatetime-format-strptime-perl_1.1000.bb
> index 6270ae7..7054ff6 100644
> --- a/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb
> +++ b/recipes/perl/libdatetime-format-strptime-perl_1.1000.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "DateTime::Format::Strptime - Parse and format strp an=
d strf time patterns"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RI/RICKM/DateTim=
e-Format-Strptime-${PV}.tgz"
>
> diff --git a/recipes/perl/libdatetime-locale-perl_0.45.bb b/recipes/perl/=
libdatetime-locale-perl_0.45.bb
> index 3526f7f..203373c 100644
> --- a/recipes/perl/libdatetime-locale-perl_0.45.bb
> +++ b/recipes/perl/libdatetime-locale-perl_0.45.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://datetime.perl.org/"
> =A0DEPENDS =3D "liblist-moreutils-perl-native libparams-validate-perl-nat=
ive"
> =A0RDEPENDS_${PN} =3D "liblist-moreutils-perl libparams-validate-perl"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateT=
ime-Locale-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "8ba6a4b70f8fa7d987529c2e2c708862"
> diff --git a/recipes/perl/libdatetime-perl_0.61.bb b/recipes/perl/libdate=
time-perl_0.61.bb
> index 448c915..71bfbd0 100644
> --- a/recipes/perl/libdatetime-perl_0.61.bb
> +++ b/recipes/perl/libdatetime-perl_0.61.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libtest-exception-perl-native libdatetime-timezone-perl-n=
ative libdatetime-locale-perl-native "
> =A0RDEPENDS_${PN} =3D "libtest-exception-perl libdatetime-timezone-perl l=
ibdatetime-locale-perl =A0\
> =A0 =A0 =A0 =A0perl-module-scalar-util perl-module-pod-man perl-module-ti=
me-local"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateT=
ime-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "0802efbc53eb11a09d1528223cd52e88"
> diff --git a/recipes/perl/libdatetime-timezone-perl_1.21.bb b/recipes/per=
l/libdatetime-timezone-perl_1.21.bb
> index 73062f6..b75abaf 100644
> --- a/recipes/perl/libdatetime-timezone-perl_1.21.bb
> +++ b/recipes/perl/libdatetime-timezone-perl_1.21.bb
> @@ -5,7 +5,7 @@ HOMEPAGE =3D "http://datetime.perl.org/"
> =A0DEPENDS =3D "libclass-singleton-perl-native libparams-validate-perl-na=
tive"
> =A0RDEPENDS_${PN} =3D "libclass-singleton-perl libparams-validate-perl \
> =A0 =A0 =A0 =A0perl-module-test-more perl-module-cwd"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/DateT=
ime-TimeZone-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "442c2754c061b61e30f04e57954abba3"
> diff --git a/recipes/perl/libdb-file-perl_1.820.bb b/recipes/perl/libdb-f=
ile-perl_1.820.bb
> index 4a3c1df..a380eb9 100644
> --- a/recipes/perl/libdb-file-perl_1.820.bb
> +++ b/recipes/perl/libdb-file-perl_1.820.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "virtual/db"
> =A0RDEPENDS_${PN} +=3D "perl-module-extutils-makemaker"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0BBCLASSEXTEND =3D "native"
>
> diff --git a/recipes/perl/libdbd-mysql-perl-native_4.010.bb b/recipes/per=
l/libdbd-mysql-perl-native_4.010.bb
> index e92d0be..4acc14f 100644
> --- a/recipes/perl/libdbd-mysql-perl-native_4.010.bb
> +++ b/recipes/perl/libdbd-mysql-perl-native_4.010.bb
> @@ -1,4 +1,5 @@
> =A0require libdbd-mysql-perl.inc
> +PR =3D "${INC_PR}.0"
>
> =A0DEPENDS =3D "libdbi-perl-native mysql-native"
>
> diff --git a/recipes/perl/libdbd-mysql-perl.inc b/recipes/perl/libdbd-mys=
ql-perl.inc
> index 91c6f97..5fff376 100644
> --- a/recipes/perl/libdbd-mysql-perl.inc
> +++ b/recipes/perl/libdbd-mysql-perl.inc
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "The database interface driver for the MySQL database.=
"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +INC_PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/C/CA/CAPTTOFU/DBD-=
mysql-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libdbd-mysql-perl_4.010.bb b/recipes/perl/libdb=
d-mysql-perl_4.010.bb
> index 2030ca9..3d2197d 100644
> --- a/recipes/perl/libdbd-mysql-perl_4.010.bb
> +++ b/recipes/perl/libdbd-mysql-perl_4.010.bb
> @@ -1,4 +1,5 @@
> =A0require libdbd-mysql-perl.inc
> +PR =3D "${INC_PR}.0"
>
> =A0DEPENDS =3D "libdbi-perl mysql"
> =A0RDEPENDS_${PN} =3D "perl-module-data-dumper \
> diff --git a/recipes/perl/libdbd-sqlite-perl_1.31.bb b/recipes/perl/libdb=
d-sqlite-perl_1.31.bb
> index 37cf0ca..70bc0cc 100644
> --- a/recipes/perl/libdbd-sqlite-perl_1.31.bb
> +++ b/recipes/perl/libdbd-sqlite-perl_1.31.bb
> @@ -16,7 +16,7 @@ RDEPENDS_${PN} +=3D "libdbi-perl \
> =A0 =A0 =A0 =A0 =A0perl-module-locale \
> =A0 =A0 =A0 =A0 =A0perl-module-tie-hash \
> =A0"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/DBD-SQL=
ite-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "67b3575104efd606c8093bc416e3338d"
> diff --git a/recipes/perl/libdbi-perl_1.607.bb b/recipes/perl/libdbi-perl=
_1.607.bb
> index bc2f612..b3650ef 100644
> --- a/recipes/perl/libdbi-perl_1.607.bb
> +++ b/recipes/perl/libdbi-perl_1.607.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Various MIME modules."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-scalar-util \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-file-spec \
> diff --git a/recipes/perl/libdbix-simple-perl_1.32.bb b/recipes/perl/libd=
bix-simple-perl_1.32.bb
> index 6ab596a..538902c 100644
> --- a/recipes/perl/libdbix-simple-perl_1.32.bb
> +++ b/recipes/perl/libdbix-simple-perl_1.32.bb
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} +=3D "libdbi-perl \
> =A0 =A0 =A0 =A0 =A0perl-module-test-simple \
> =A0 =A0 =A0 =A0 =A0perl-module-storable \
> =A0"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JU/JUERD/DBIx-Si=
mple-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "c1d7bf0ab453e7e00715d9d4e71102d8"
> diff --git a/recipes/perl/libdevel-stacktrace-perl_1.13.bb b/recipes/perl=
/libdevel-stacktrace-perl_1.13.bb
> index 8ea986f..e71ae3f 100644
> --- a/recipes/perl/libdevel-stacktrace-perl_1.13.bb
> +++ b/recipes/perl/libdevel-stacktrace-perl_1.13.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Devel::StackTrace - Stack trace and stack trace frame=
 objects"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Devel=
-StackTrace-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libdevice-serialport-perl_1.04.bb b/recipes/per=
l/libdevice-serialport-perl_1.04.bb
> index e7265a6..3b0a94f 100644
> --- a/recipes/perl/libdevice-serialport-perl_1.04.bb
> +++ b/recipes/perl/libdevice-serialport-perl_1.04.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic"
> =A0RDEPENDS_${PN} +=3D "perl-module-carp perl-module-posix perl-module-io=
-handle \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-strict perl-module-warnings perl-modu=
le-vars \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-xsloader"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/Device/Device-Seria=
lPort-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libdigest-hmac-perl_1.02.bb b/recipes/perl/libd=
igest-hmac-perl_1.02.bb
> index 6ca7b77..a5c961c 100644
> --- a/recipes/perl/libdigest-hmac-perl_1.02.bb
> +++ b/recipes/perl/libdigest-hmac-perl_1.02.bb
> @@ -5,7 +5,7 @@ RDEPENDS_${PN} +=3D "libdigest-sha1-perl perl-module-extu=
tils-makemaker perl-modul
>
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-H=
MAC-${PV}.tar.gz;name=3Ddigest-hmac-perl-${PV}"
> =A0SRC_URI[digest-hmac-perl-1.02.md5sum] =3D "64c4b247d83cd64ec32aa22bf58=
a709b"
> diff --git a/recipes/perl/libdigest-sha1-perl_2.11.bb b/recipes/perl/libd=
igest-sha1-perl_2.11.bb
> index a29c4ba..f26fef4 100644
> --- a/recipes/perl/libdigest-sha1-perl_2.11.bb
> +++ b/recipes/perl/libdigest-sha1-perl_2.11.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Digest::SHA1 - Perl interface to the SHA-1 algorithm"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r14"
> +PR =3D "r25"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Digest-S=
HA1-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libdigest-sha_5.47.bb b/recipes/perl/libdigest-=
sha_5.47.bb
> index 716d69d..9bd7df2 100644
> --- a/recipes/perl/libdigest-sha_5.47.bb
> +++ b/recipes/perl/libdigest-sha_5.47.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "expat expat-native"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/Digest/Digest-SHA-$=
{PV}.tar.gz"
>
> diff --git a/recipes/perl/libemail-date-format-perl_1.002.bb b/recipes/pe=
rl/libemail-date-format-perl_1.002.bb
> index 3d6b23e..c10cacc 100644
> --- a/recipes/perl/libemail-date-format-perl_1.002.bb
> +++ b/recipes/perl/libemail-date-format-perl_1.002.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Various MIME modules."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-test-more \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-time-local"
> diff --git a/recipes/perl/libencode-detect-perl_1.01.bb b/recipes/perl/li=
bencode-detect-perl_1.01.bb
> index 691bb65..7d59d04 100644
> --- a/recipes/perl/libencode-detect-perl_1.01.bb
> +++ b/recipes/perl/libencode-detect-perl_1.01.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "An Encode::Encoding subclass that detect=
s the encoding of data"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "MPL"
> =A0RDEPENDS_${PN} +=3D "perl-module-module-build perl-module-extutils-cbu=
ilder"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JG/JGMYERS/Encod=
e-Detect-${PV}.tar.gz;name=3Dencode-detect-perl-${PV}"
> =A0SRC_URI[encode-detect-perl-1.01.md5sum] =3D "ee9faf55d7105c97b02b8ebe5=
90819c7"
> diff --git a/recipes/perl/liberror-perl_0.17004.bb b/recipes/perl/liberro=
r-perl_0.17004.bb
> index 1a39890..080edab 100644
> --- a/recipes/perl/liberror-perl_0.17004.bb
> +++ b/recipes/perl/liberror-perl_0.17004.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Error - Error/exception handling in an OO-ish way"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r8"
> +PR =3D "r9"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PEVANS/Error-=
${PV}.tar.gz"
>
> diff --git a/recipes/perl/liberror-perl_0.17016.bb b/recipes/perl/liberro=
r-perl_0.17016.bb
> index d3803a4..74dd91c 100644
> --- a/recipes/perl/liberror-perl_0.17016.bb
> +++ b/recipes/perl/liberror-perl_0.17016.bb
> @@ -6,7 +6,7 @@ RDEPENDS_${PN} =3D " \
> =A0 =A0 =A0 =A0 perl-module-warnings \
> =A0 =A0 =A0 =A0 "
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SH/SHLOMIF/Error=
-${PV}.tar.gz;name=3Derror-perl-${PV}"
> =A0SRC_URI[error-perl-0.17016.md5sum] =3D "eedcd3c6970568dd32092b5334328e=
ff"
> diff --git a/recipes/perl/libexception-class-perl_1.23.bb b/recipes/perl/=
libexception-class-perl_1.23.bb
> index 26722cd..596fb6c 100644
> --- a/recipes/perl/libexception-class-perl_1.23.bb
> +++ b/recipes/perl/libexception-class-perl_1.23.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libclass-data-inheritable-perl-native libdevel-stacktrace=
-perl-native"
> =A0RDEPENDS_${PN} =3D "libclass-data-inheritable-perl libdevel-stacktrace=
-perl"
> -PR =3D "r9"
> +PR =3D "r20"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Excep=
tion-Class-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libexpect-perl_1.20.bb b/recipes/perl/libexpect=
-perl_1.20.bb
> index 53c54fe..ca17100 100644
> --- a/recipes/perl/libexpect-perl_1.20.bb
> +++ b/recipes/perl/libexpect-perl_1.20.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Expect.pm - Perl Expect interface"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/Expect/Expect-${PV}=
.tar.gz"
>
> diff --git a/recipes/perl/libextutils-cbuilder-perl_0.18.bb b/recipes/per=
l/libextutils-cbuilder-perl_0.18.bb
> index 7a304ba..4ff6b51 100644
> --- a/recipes/perl/libextutils-cbuilder-perl_0.18.bb
> +++ b/recipes/perl/libextutils-cbuilder-perl_0.18.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "ExtUtils::CBuilder - Compile and link C code for Perl=
 modules"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Ext=
Utils-CBuilder-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libextutils-depends-perl_0.205.bb b/recipes/per=
l/libextutils-depends-perl_0.205.bb
> index a1a71e6..8671004 100644
> --- a/recipes/perl/libextutils-depends-perl_0.205.bb
> +++ b/recipes/perl/libextutils-depends-perl_0.205.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "ExtUtils::Depends - Easily build XS extensions that d=
epend on XS extensions"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RM/RMCFARLA/Gtk2=
-Perl/ExtUtils-Depends-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libextutils-parsexs-perl_2.16.bb b/recipes/perl=
/libextutils-parsexs-perl_2.16.bb
> index 038b991..9b604b8 100644
> --- a/recipes/perl/libextutils-parsexs-perl_2.16.bb
> +++ b/recipes/perl/libextutils-parsexs-perl_2.16.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "ExtUtils::ParseXS - converts Perl XS code into C code=
"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Ext=
Utils-ParseXS-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libextutils-pkgconfig-perl_1.07.bb b/recipes/pe=
rl/libextutils-pkgconfig-perl_1.07.bb
> index e40e109..05c41ed 100644
> --- a/recipes/perl/libextutils-pkgconfig-perl_1.07.bb
> +++ b/recipes/perl/libextutils-pkgconfig-perl_1.07.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "ExtUtils::PkgConfig - simplistic interface to pkg-con=
fig"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RM/RMCFARLA/Gtk2=
-Perl/ExtUtils-PkgConfig-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libfile-slurp-perl_9999.13.bb b/recipes/perl/li=
bfile-slurp-perl_9999.13.bb
> index 2c59dbb..c058540 100644
> --- a/recipes/perl/libfile-slurp-perl_9999.13.bb
> +++ b/recipes/perl/libfile-slurp-perl_9999.13.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "File::Slurp - Efficient Reading/Writing =
of Complete Files"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://search.cpan.org/~uri/"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/File-=
Slurp-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libfilesys-df-perl_0.92.bb b/recipes/perl/libfi=
lesys-df-perl_0.92.bb
> index 02a6126..5a57f6f 100644
> --- a/recipes/perl/libfilesys-df-perl_0.92.bb
> +++ b/recipes/perl/libfilesys-df-perl_0.92.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Filesys-Df - Perl extension for filesyst=
em disk space information
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/I/IG/IGUTHRIE/File=
sys-Df-${PV}.tar.gz;name=3Dfilesys-df-perl-${PV}"
> =A0SRC_URI[filesys-df-perl-0.92.md5sum] =3D "a8b0aa3e5151a8a6c8b306762598=
0934"
> diff --git a/recipes/perl/libhtml-mason-perl_1.35.bb b/recipes/perl/libht=
ml-mason-perl_1.35.bb
> index dcb94e4..6503752 100644
> --- a/recipes/perl/libhtml-mason-perl_1.35.bb
> +++ b/recipes/perl/libhtml-mason-perl_1.35.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} =3D "libexception-class-perl libparams-v=
alidate-perl \
> =A0 =A0 =A0 =A0 perl-module-exporter-heavy perl-module-cwd perl-module-sc=
alar-util \
> =A0 =A0 =A0 =A0 perl-module-list-util perl-module-bytes perl-module-file-=
glob \
> =A0 =A0 =A0 =A0 perl-module-data-dumper"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/HTML-=
Mason-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libhtml-parser-perl_3.60.bb b/recipes/perl/libh=
tml-parser-perl_3.60.bb
> index 45dddea..61f2efc 100644
> --- a/recipes/perl/libhtml-parser-perl_3.60.bb
> +++ b/recipes/perl/libhtml-parser-perl_3.60.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "HTML Parser bits."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-test-more \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-xsloader \
> diff --git a/recipes/perl/libhtml-parser-perl_3.64.bb b/recipes/perl/libh=
tml-parser-perl_3.64.bb
> index 9a0ecdd..0953e32 100644
> --- a/recipes/perl/libhtml-parser-perl_3.64.bb
> +++ b/recipes/perl/libhtml-parser-perl_3.64.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "HTML Parser bits."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-test-more \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-xsloader \
> diff --git a/recipes/perl/libhtml-tagset-perl_3.20.bb b/recipes/perl/libh=
tml-tagset-perl_3.20.bb
> index 8923068..179edab 100644
> --- a/recipes/perl/libhtml-tagset-perl_3.20.bb
> +++ b/recipes/perl/libhtml-tagset-perl_3.20.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "HTML Tagset bits."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/HTML=
-Tagset-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libhtml-treebuilder-perl_3.23.bb b/recipes/perl=
/libhtml-treebuilder-perl_3.23.bb
> index a0cdae5..302c1fe 100644
> --- a/recipes/perl/libhtml-treebuilder-perl_3.23.bb
> +++ b/recipes/perl/libhtml-treebuilder-perl_3.23.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "HTML::TreeBUilder - Class is for HTML syntax trees th=
at get built out of HTML source"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0RDEPENDS_${PN} =3D "perl-module-extutils-makemaker"
>
> diff --git a/recipes/perl/libhttp-cache-transparent-perl_1.0.bb b/recipes=
/perl/libhttp-cache-transparent-perl_1.0.bb
> index fd376fc..86d629e 100644
> --- a/recipes/perl/libhttp-cache-transparent-perl_1.0.bb
> +++ b/recipes/perl/libhttp-cache-transparent-perl_1.0.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "HTTP::Cache::Transparent - Cache the result of http g=
et-requests persistently."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0DEPENDS +=3D "libwww-perl-native"
> =A0RDEPENDS_${PN} +=3D "libwww-perl"
> diff --git a/recipes/perl/libimage-size-perl_3.230.bb b/recipes/perl/libi=
mage-size-perl_3.230.bb
> index 45e997a..eb64731 100644
> --- a/recipes/perl/libimage-size-perl_3.230.bb
> +++ b/recipes/perl/libimage-size-perl_3.230.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Image::Size =A0 =A0 =A0read the dimensions of an imag=
e in several popular formats"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RJ/RJRAY/Image-S=
ize-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "17b5cc123a522aa3c4ca842094d0c0ba"
> diff --git a/recipes/perl/libintl-perl_1.16.bb b/recipes/perl/libintl-per=
l_1.16.bb
> index c67208a..4096c70 100644
> --- a/recipes/perl/libintl-perl_1.16.bb
> +++ b/recipes/perl/libintl-perl_1.16.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} =3D "perl-module-vars perl-module-locale perl-module-io=
-handle \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-symbol perl-module-selectsaver perl-m=
odule-io \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-integer perl-module-exporter-heavy"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://www.cpan.org/authors/id/G/GU/GUIDO/libintl-perl-${=
PV}.tar.gz"
>
> diff --git a/recipes/perl/libintl-perl_1.20.bb b/recipes/perl/libintl-per=
l_1.20.bb
> index 01601ce..1431494 100644
> --- a/recipes/perl/libintl-perl_1.20.bb
> +++ b/recipes/perl/libintl-perl_1.20.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} =3D "perl-module-vars perl-module-locale perl-module-io=
-handle \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-symbol perl-module-selectsaver perl-m=
odule-io \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-integer perl-module-exporter-heavy"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://www.cpan.org/authors/id/G/GU/GUIDO/libintl-perl-${=
PV}.tar.gz"
>
> diff --git a/recipes/perl/libio-compress-base-perl_2.015.bb b/recipes/per=
l/libio-compress-base-perl_2.015.bb
> index 0e13e58..235dd80 100644
> --- a/recipes/perl/libio-compress-base-perl_2.015.bb
> +++ b/recipes/perl/libio-compress-base-perl_2.015.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "IO::Compress::Base - Base Class for IO::=
Compress modules"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "expat expat-native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/IO/IO-Compress-Base=
-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libio-compress-zlib-perl_2.015.bb b/recipes/per=
l/libio-compress-zlib-perl_2.015.bb
> index 2f1dce9..2663516 100644
> --- a/recipes/perl/libio-compress-zlib-perl_2.015.bb
> +++ b/recipes/perl/libio-compress-zlib-perl_2.015.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Compress::Zlib - Interface to zlib compr=
ession library"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "expat expat-native"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/IO/IO-Compress-Zlib=
-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libio-pty-perl_1.07.bb b/recipes/perl/libio-pty=
-perl_1.07.bb
> index ede9b1b..9007fd6 100644
> --- a/recipes/perl/libio-pty-perl_1.07.bb
> +++ b/recipes/perl/libio-pty-perl_1.07.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Perl module for pseudo tty IO"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/IO/IO-Tty-${PV}.tar=
.gz"
>
> diff --git a/recipes/perl/libio-socket-inet6-perl_2.61.bb b/recipes/perl/=
libio-socket-inet6-perl_2.61.bb
> index 6b8629d..d8f0485 100644
> --- a/recipes/perl/libio-socket-inet6-perl_2.61.bb
> +++ b/recipes/perl/libio-socket-inet6-perl_2.61.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "IO::Socket::INET6 - Object interface for=
 AF_INET|AF_INET6 domain
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-test-more libsocket6-perl perl-module=
-io-socket"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0BBCLASSEXTEND =3D "native"
>
> diff --git a/recipes/perl/libio-socket-ssl-perl_1.32.bb b/recipes/perl/li=
bio-socket-ssl-perl_1.32.bb
> index 0071c0d..645a1ec 100644
> --- a/recipes/perl/libio-socket-ssl-perl_1.32.bb
> +++ b/recipes/perl/libio-socket-ssl-perl_1.32.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-scalar-util libnet-ssleay-perl"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SU/SULLR/IO-Sock=
et-SSL-${PV}.tar.gz;name=3Dio-socket-ssl-${PV}"
> =A0SRC_URI[io-socket-ssl-1.32.md5sum] =3D "324ec02c26ecb41c481d0586c4174a=
56"
> diff --git a/recipes/perl/libio-stringy-perl_2.110.bb b/recipes/perl/libi=
o-stringy-perl_2.110.bb
> index 87a4693..7a12a6f 100644
> --- a/recipes/perl/libio-stringy-perl_2.110.bb
> +++ b/recipes/perl/libio-stringy-perl_2.110.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "IO-stringy - I/O on in-core objects like strings and =
arrays"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DS/DSKOLL/IO-str=
ingy-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libio-stty-perl_0.02.bb b/recipes/perl/libio-st=
ty-perl_0.02.bb
> index 9779045..1695a62 100644
> --- a/recipes/perl/libio-stty-perl_0.02.bb
> +++ b/recipes/perl/libio-stty-perl_0.02.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Interface to secure pseudo ttys"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/IO/IO-Stty-.02.tar.=
gz"
>
> diff --git a/recipes/perl/libio-zlib-perl_1.04.bb b/recipes/perl/libio-zl=
ib-perl_1.04.bb
> index 92d6be6..603a692 100644
> --- a/recipes/perl/libio-zlib-perl_1.04.bb
> +++ b/recipes/perl/libio-zlib-perl_1.04.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libcompress-zlib-perl-native"
> =A0RDEPENDS_${PN} +=3D "libcompress-zlib-perl"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-=
Zlib-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libio-zlib-perl_1.10.bb b/recipes/perl/libio-zl=
ib-perl_1.10.bb
> index 820ca19..4656511 100644
> --- a/recipes/perl/libio-zlib-perl_1.10.bb
> +++ b/recipes/perl/libio-zlib-perl_1.10.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libcompress-zlib-perl-native"
> =A0RDEPENDS_${PN} +=3D "libcompress-zlib-perl perl-module-tie-handle"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TO/TOMHUGHES/IO-=
Zlib-${PV}.tar.gz;name=3Dio-zlib-${PV}"
> =A0SRC_URI[io-zlib-1.10.md5sum] =3D "078a9387009b928068f70759e61bd08f"
> diff --git a/recipes/perl/libip-country-perl_2.27.bb b/recipes/perl/libip=
-country-perl_2.27.bb
> index 5faa8d4..ba0fcea 100644
> --- a/recipes/perl/libip-country-perl_2.27.bb
> +++ b/recipes/perl/libip-country-perl_2.27.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-extutils-makemaker"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/N/NW/NWETTERS/IP-C=
ountry-${PV}.tar.gz;name=3Dip-country-perl-${PV}"
> =A0SRC_URI[ip-country-perl-2.27.md5sum] =3D "32932280ee4729145e85e08dad5a=
b8c6"
> diff --git a/recipes/perl/libipc-sharelite-perl_0.09.bb b/recipes/perl/li=
bipc-sharelite-perl_0.09.bb
> index 4f7727b..99eb82e 100644
> --- a/recipes/perl/libipc-sharelite-perl_0.09.bb
> +++ b/recipes/perl/libipc-sharelite-perl_0.09.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "IPC::ShareLite - Light-weight interface to shared mem=
ory"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r14"
> +PR =3D "r25"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MA/MAURICE/IPC-S=
hareLite-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb b/recipes=
/perl/liblingua-en-numbers-ordinate_1.02.bb
> index 3b5a52e..1529dfd 100644
> --- a/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb
> +++ b/recipes/perl/liblingua-en-numbers-ordinate_1.02.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Lingua::EN::Numbers::Ordinate -- go from cardinal num=
ber (3) to ordinal ("3rd")"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SB/SBURKE/Lingua=
-EN-Numbers-Ordinate-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liblinux-dvb-perl_1.0.bb b/recipes/perl/liblinu=
x-dvb-perl_1.0.bb
> index 86e17ff..453c896 100644
> --- a/recipes/perl/liblinux-dvb-perl_1.0.bb
> +++ b/recipes/perl/liblinux-dvb-perl_1.0.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Linux::DVB - interface to (some parts of) the Linux D=
VB API"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/ML/MLEHMANN/Linu=
x-DVB-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liblist-moreutils-perl_0.22.bb b/recipes/perl/l=
iblist-moreutils-perl_0.22.bb
> index 6adb6c9..2df1811 100644
> --- a/recipes/perl/liblist-moreutils-perl_0.22.bb
> +++ b/recipes/perl/liblist-moreutils-perl_0.22.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "List::MoreUtils - Provide the stuff miss=
ing in List::Util"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://datetime.perl.org/"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/V/VP/VPARSEVAL/Lis=
t-MoreUtils-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "3a6ec506f40662ab1296c48c5eb72016"
> diff --git a/recipes/perl/liblocale-gettext-perl_1.05.bb b/recipes/perl/l=
iblocale-gettext-perl_1.05.bb
> index 152813a..ca2b75d 100644
> --- a/recipes/perl/liblocale-gettext-perl_1.05.bb
> +++ b/recipes/perl/liblocale-gettext-perl_1.05.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "virtual/libintl"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r9"
> +PR =3D "r20"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PV/PVANDRY/gette=
xt-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liblog-dispatch-perl_2.13.bb b/recipes/perl/lib=
log-dispatch-perl_2.13.bb
> index 0be534c..4200aec 100644
> --- a/recipes/perl/liblog-dispatch-perl_2.13.bb
> +++ b/recipes/perl/liblog-dispatch-perl_2.13.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Log::Dispatch - Dispatches messages to one or more ou=
tputs"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Log-D=
ispatch-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liblog-log4perl-perl_1.06.bb b/recipes/perl/lib=
log-log4perl-perl_1.06.bb
> index bf6b449..dea75eb 100644
> --- a/recipes/perl/liblog-log4perl-perl_1.06.bb
> +++ b/recipes/perl/liblog-log4perl-perl_1.06.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Log::Log4perl - Log4j implementation for Perl"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MS/MSCHILLI/Log-=
Log4perl-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libmail-dkim-perl_0.37.bb b/recipes/perl/libmai=
l-dkim-perl_0.37.bb
> index e659e18..e966126 100644
> --- a/recipes/perl/libmail-dkim-perl_0.37.bb
> +++ b/recipes/perl/libmail-dkim-perl_0.37.bb
> @@ -15,7 +15,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0libnet-dns-perl \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JA/JASLONG/Mail-=
DKIM-${PV}.tar.gz;name=3Dmail-dkim-perl-${PV}"
> =A0SRC_URI[mail-dkim-perl-0.37.md5sum] =3D "f3e84ec6b5e42d4cbcc7c42ea2900=
649"
> diff --git a/recipes/perl/libmail-sendmail-perl_0.79.bb b/recipes/perl/li=
bmail-sendmail-perl_0.79.bb
> index 467156c..4e2403a 100644
> --- a/recipes/perl/libmail-sendmail-perl_0.79.bb
> +++ b/recipes/perl/libmail-sendmail-perl_0.79.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Mail::Sendmail - Simple platform independent mailer"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/Mail/Mail-Sendmail-=
${PV}.tar.gz"
>
> diff --git a/recipes/perl/libmail-spf-perl_2.007.bb b/recipes/perl/libmai=
l-spf-perl_2.007.bb
> index 72009e6..7b94a69 100644
> --- a/recipes/perl/libmail-spf-perl_2.007.bb
> +++ b/recipes/perl/libmail-spf-perl_2.007.bb
> @@ -23,7 +23,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D " \
> =A0 =A0 =A0 =A0http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/mail-s=
pf/Mail-SPF-v${PV}.tar.gz;name=3Dmail-spf-perl-${PV} \
> diff --git a/recipes/perl/libmailtools-perl_2.06.bb b/recipes/perl/libmai=
ltools-perl_2.06.bb
> index 3870bcc..9ad105b 100644
> --- a/recipes/perl/libmailtools-perl_2.06.bb
> +++ b/recipes/perl/libmailtools-perl_2.06.bb
> @@ -13,7 +13,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0perl-module-test-more \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MailTo=
ols-${PV}.tar.gz;name=3Dmailtools-perl-${PV}"
> =A0SRC_URI[mailtools-perl-2.06.md5sum] =3D "3f90297c7f566cc0cc9c89ee47906=
abf"
> diff --git a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb b/recipes/perl/=
libmath-bigint-gmp-perl_1.18.bb
> index 9226fde..59453e2 100644
> --- a/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
> +++ b/recipes/perl/libmath-bigint-gmp-perl_1.18.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "gmp-native"
> =A0RDEPENDS_${PN} +=3D "gmp"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TE/TELS/math/Mat=
h-BigInt-GMP-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libmime-lite-perl_3.024.bb b/recipes/perl/libmi=
me-lite-perl_3.024.bb
> index da03436..5c8de53 100644
> --- a/recipes/perl/libmime-lite-perl_3.024.bb
> +++ b/recipes/perl/libmime-lite-perl_3.024.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Simple standalone module for generating MIME messages=
."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-file-spec \
> =A0 =A0 =A0 =A0 =A0 =A0 libemail-date-format-perl \
> diff --git a/recipes/perl/libmime-tools-perl_5.427.bb b/recipes/perl/libm=
ime-tools-perl_5.427.bb
> index 1d5cb9d..2cd2b35 100644
> --- a/recipes/perl/libmime-tools-perl_5.427.bb
> +++ b/recipes/perl/libmime-tools-perl_5.427.bb
> @@ -22,7 +22,7 @@ RDEPENDS_${PN} +=3D "\
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DO/DONEILL/MIME-=
tools-${PV}.tar.gz;name=3Dmime-tools-perl-${PV}"
> =A0SRC_URI[mime-tools-perl-5.427.md5sum] =3D "4333caa7238cb9eafb5f7fb39fc=
bd8e7"
> diff --git a/recipes/perl/libmodule-build-perl-native_0.2805.bb b/recipes=
/perl/libmodule-build-perl-native_0.2805.bb
> deleted file mode 100644
> index 9275e50..0000000
> --- a/recipes/perl/libmodule-build-perl-native_0.2805.bb
> +++ /dev/null
> @@ -1,8 +0,0 @@
> -SECTION =3D "libs"
> -
> -inherit native
> -
> -require libmodule-build-perl_${PV}.bb
> -
> -SRC_URI[md5sum] =3D "598bb59b86c2c4842eeffb03392fab5b"
> -SRC_URI[sha256sum] =3D "8fd609d1e6b460b5c95ad5612cb823aa863d51360ed55cae=
a987909a9bab50f5"
> diff --git a/recipes/perl/libmodule-build-perl_0.2805.bb b/recipes/perl/l=
ibmodule-build-perl_0.2805.bb
> deleted file mode 100644
> index 7ebfcb2..0000000
> --- a/recipes/perl/libmodule-build-perl_0.2805.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -DESCRIPTION =3D "Module::Build - Build and install Perl modules"
> -SECTION =3D "libs"
> -SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/K/KW/KWILLIAMS/Modul=
e-Build-${PV}.tar.gz"
> -LICENSE =3D "Artistic|GPLv1+"
> -DEPENDS =3D "libyaml-perl-native libversion-perl-native \
> - =A0 =A0 =A0 =A0 =A0 libextutils-cbuilder-perl-native \
> - =A0 =A0 =A0 =A0 =A0 libextutils-parsexs-perl-native \
> - =A0 =A0 =A0 =A0 =A0 libarchive-tar-perl-native"
> -RDEPENDS_${PN} =3D "libyaml-perl libversion-perl libextutils-cbuilder-pe=
rl \
> - =A0 =A0 =A0 =A0 =A0 =A0libextutils-parsexs-perl libarchive-tar-perl"
> -PR =3D "r6"
> -
> -S =3D "${WORKDIR}/Module-Build-${PV}"
> -
> -inherit cpan_build
> -
> -SRC_URI[md5sum] =3D "598bb59b86c2c4842eeffb03392fab5b"
> -SRC_URI[sha256sum] =3D "8fd609d1e6b460b5c95ad5612cb823aa863d51360ed55cae=
a987909a9bab50f5"
> diff --git a/recipes/perl/libmodule-load-perl_0.16.bb b/recipes/perl/libm=
odule-load-perl_0.16.bb
> index 974ce6b..cb20ce2 100644
> --- a/recipes/perl/libmodule-load-perl_0.16.bb
> +++ b/recipes/perl/libmodule-load-perl_0.16.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "A module loading thingy for perl."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0RDEPENDS_${PN} =3D "perl-module-test-more"
>
> diff --git a/recipes/perl/libnet-cidr-perl_0.13.bb b/recipes/perl/libnet-=
cidr-perl_0.13.bb
> index 6451ab5..bff061a 100644
> --- a/recipes/perl/libnet-cidr-perl_0.13.bb
> +++ b/recipes/perl/libnet-cidr-perl_0.13.bb
> @@ -5,7 +5,7 @@ RDEPENDS_${PN} +=3D "perl-module-carp"
>
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MR/MRSAM/Net-CID=
R-0.13.tar.gz;name=3Dnet-cidr-perl-${PV}"
> =A0SRC_URI[net-cidr-perl-0.13.md5sum] =3D "40f0f42104b314af91ab78119e0096=
de"
> diff --git a/recipes/perl/libnet-dbus-perl_0.33.5.bb b/recipes/perl/libne=
t-dbus-perl_0.33.5.bb
> index 9e48d15..276b8a6 100644
> --- a/recipes/perl/libnet-dbus-perl_0.33.5.bb
> +++ b/recipes/perl/libnet-dbus-perl_0.33.5.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Net::DBus - Perl extension for the DBus message syste=
m"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0RDEPENDS_${PN} =3D "perl-module-vars perl-module-locale perl-module-io=
-handle \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-symbol perl-module-selectsaver perl-m=
odule-io \
> diff --git a/recipes/perl/libnet-dbus-perl_0.33.6.bb b/recipes/perl/libne=
t-dbus-perl_0.33.6.bb
> index 5d6efa5..8d6279c 100644
> --- a/recipes/perl/libnet-dbus-perl_0.33.6.bb
> +++ b/recipes/perl/libnet-dbus-perl_0.33.6.bb
> @@ -6,7 +6,7 @@ RDEPENDS_${PN} =3D "perl-module-vars perl-module-locale p=
erl-module-io-handle \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-symbol perl-module-selectsaver perl-m=
odule-io \
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-integer perl-module-exporter-heavy"
>
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DA/DANBERR/Net-D=
Bus-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libnet-dns-perl_0.66.bb b/recipes/perl/libnet-d=
ns-perl_0.66.bb
> index b27838c..4ee0ccb 100644
> --- a/recipes/perl/libnet-dns-perl_0.66.bb
> +++ b/recipes/perl/libnet-dns-perl_0.66.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/O/OL/OLAF/Net-DNS-=
${PV}.tar.gz;name=3Dnet-dns-perl-${PV}"
> =A0SRC_URI[net-dns-perl-0.66.md5sum] =3D "1635d876324e3c2f6e277d5778bfe94=
c"
> diff --git a/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb =
b/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
> index 347fe5d..91e79b8 100644
> --- a/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
> +++ b/recipes/perl/libnet-dns-resolver-programmable-perl_0.003.bb
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JM/JMEHNLE/net-d=
ns-resolver-programmable/Net-DNS-Resolver-Programmable-v${PV}.tar.gz;name=
=3Dnet-dns-resolver-programmable-perl-${PV}"
> =A0SRC_URI[net-dns-resolver-programmable-perl-0.003.md5sum] =3D "8d44bf33=
1d6115e7fb4ea21f6cf4b96b"
> diff --git a/recipes/perl/libnet-ident-perl_1.20.bb b/recipes/perl/libnet=
-ident-perl_1.20.bb
> index ed2b81f..34f34b9 100644
> --- a/recipes/perl/libnet-ident-perl_1.20.bb
> +++ b/recipes/perl/libnet-ident-perl_1.20.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JP/JPC/Net-Ident=
-${PV}.tar.gz;name=3Dnet-ident-perl-${PV}"
> =A0SRC_URI[net-ident-perl-1.20.md5sum] =3D "70f265f46548675be01977d3c9eed=
570"
> diff --git a/recipes/perl/libnet-ip-perl_1.25.bb b/recipes/perl/libnet-ip=
-perl_1.25.bb
> index 721f059..9be5aa0 100644
> --- a/recipes/perl/libnet-ip-perl_1.25.bb
> +++ b/recipes/perl/libnet-ip-perl_1.25.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libio-zlib-perl-native"
> =A0RDEPENDS_${PN} +=3D "libio-zlib-perl perl-module-math-bigint"
> -PR =3D "r7"
> +PR =3D "r8"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MA/MANU/Net-IP-$=
{PV}.tar.gz"
>
> diff --git a/recipes/perl/libnet-pcap-perl_0.16.bb b/recipes/perl/libnet-=
pcap-perl_0.16.bb
> index 7e38a4c..bc0d7d4 100644
> --- a/recipes/perl/libnet-pcap-perl_0.16.bb
> +++ b/recipes/perl/libnet-pcap-perl_0.16.bb
> @@ -8,7 +8,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0perl-module-xsloader \
> =A0 =A0 =A0 =A0"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0export STAGING_LIBDIR
>
> diff --git a/recipes/perl/libnet-rawip-perl_0.25.bb b/recipes/perl/libnet=
-rawip-perl_0.25.bb
> index e8fe4cd..8ab1eca 100644
> --- a/recipes/perl/libnet-rawip-perl_0.25.bb
> +++ b/recipes/perl/libnet-rawip-perl_0.25.bb
> @@ -10,7 +10,7 @@ RDEPENDS_${PN} =3D " \
> =A0 =A0 =A0 =A0 perl-module-subs \
> =A0 =A0 =A0 =A0 perl-module-test-more \
> =A0 =A0 =A0 =A0 "
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D " \
> =A0 =A0 =A0 =A0http://search.cpan.org/CPAN/authors/id/S/SA/SAPER/Net-RawI=
P-${PV}.tar.gz;name=3Dnet-rawip-perl-${PV} \
> diff --git a/recipes/perl/libnet-ssleay-perl_1.36.bb b/recipes/perl/libne=
t-ssleay-perl_1.36.bb
> index 3c6ba18..da01c46 100644
> --- a/recipes/perl/libnet-ssleay-perl_1.36.bb
> +++ b/recipes/perl/libnet-ssleay-perl_1.36.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0"
>
> =A0BBCLASSEXTEND =3D "native"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/F/FL/FLORA/Net-SSL=
eay-${PV}.tar.gz;name=3Dnet-ssleay-${PV}"
> =A0SRC_URI[net-ssleay-1.36.md5sum] =3D "54061638720dd6a325395331c77f21d8"
> diff --git a/recipes/perl/libnetaddr-ip-perl_4.027.bb b/recipes/perl/libn=
etaddr-ip-perl_4.027.bb
> index 677b62b..f681c77 100644
> --- a/recipes/perl/libnetaddr-ip-perl_4.027.bb
> +++ b/recipes/perl/libnetaddr-ip-perl_4.027.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-test-more"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MI/MIKER/NetAddr=
-IP-${PV}.tar.gz;name=3Dnetaddr-ip-perl-${PV}"
> =A0SRC_URI[netaddr-ip-perl-4.027.md5sum] =3D "c4a21a76e5b1b9f4c8e9810b785=
59d7b"
> diff --git a/recipes/perl/libnetpacket-perl_0.41.1.bb b/recipes/perl/libn=
etpacket-perl_0.41.1.bb
> index 31912a7..6b9a1e3 100644
> --- a/recipes/perl/libnetpacket-perl_0.41.1.bb
> +++ b/recipes/perl/libnetpacket-perl_0.41.1.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/Y/YA/YANICK/NetPac=
ket-${PV}.tar.gz;name=3Dnetpacket-perl-${PV}"
> =A0SRC_URI[netpacket-perl-0.41.1.md5sum] =3D "77c1482927c6892b9571404485f=
fe591"
> diff --git a/recipes/perl/libnetserver-generic-perl_1.03.bb b/recipes/per=
l/libnetserver-generic-perl_1.03.bb
> index 018d7f6..a5a1bb2 100644
> --- a/recipes/perl/libnetserver-generic-perl_1.03.bb
> +++ b/recipes/perl/libnetserver-generic-perl_1.03.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "NetServer::Generic is a perl module that implements a=
n object-oriented interface for developing internet servers."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/NetServer/NetServer=
-Generic-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libole-storage-lite-perl_0.19.bb b/recipes/perl=
/libole-storage-lite-perl_0.19.bb
> index 827ef24..ce4543e 100644
> --- a/recipes/perl/libole-storage-lite-perl_0.19.bb
> +++ b/recipes/perl/libole-storage-lite-perl_0.19.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
> =A0RDEPENDS_${PN} +=3D "perl-module-extutils-makemaker"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JM/JMCNAMARA/OLE=
-Storage_Lite-${PV}.tar.gz;name=3Dole-storage-lite-perl-${PV}"
> =A0SRC_URI[ole-storage-lite-perl-0.19.md5sum] =3D "1a713f5342c7d90e54ab0d=
9659650296"
> diff --git a/recipes/perl/libparams-util-perl_0.20.bb b/recipes/perl/libp=
arams-util-perl_0.20.bb
> index bfdc21e..25473b9 100644
> --- a/recipes/perl/libparams-util-perl_0.20.bb
> +++ b/recipes/perl/libparams-util-perl_0.20.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-exporter perl-module-overload \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-scalar-util perl-module-strict per=
l-module-vars"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Params-=
Util-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libparams-validate-perl_0.95.bb b/recipes/perl/=
libparams-validate-perl_0.95.bb
> index 7c346bb..82c1cb3 100644
> --- a/recipes/perl/libparams-validate-perl_0.95.bb
> +++ b/recipes/perl/libparams-validate-perl_0.95.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Params::Validate - Validate method/function parameter=
s"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DR/DROLSKY/Param=
s-Validate-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libperl6-junction-perl_1.10.bb b/recipes/perl/l=
ibperl6-junction-perl_1.10.bb
> index 9ea4870..1bec7f1 100644
> --- a/recipes/perl/libperl6-junction-perl_1.10.bb
> +++ b/recipes/perl/libperl6-junction-perl_1.10.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Perl6::Junction - Perl6 style Junction operators in P=
erl5."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/C/CF/CFRANKS/Perl6=
-Junction-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libphp-serialization-perl_0.30.bb b/recipes/per=
l/libphp-serialization-perl_0.30.bb
> index 510aa31..7e9d5b8 100644
> --- a/recipes/perl/libphp-serialization-perl_0.30.bb
> +++ b/recipes/perl/libphp-serialization-perl_0.30.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "The standard database interface module for Perl."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/B/BO/BOBTFISH/PHP-=
Serialization-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libpoe-perl_1.007.bb b/recipes/perl/libpoe-perl=
_1.007.bb
> index c4e2c1b..22227bc 100644
> --- a/recipes/perl/libpoe-perl_1.007.bb
> +++ b/recipes/perl/libpoe-perl_1.007.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Event-driven component architecture for Perl"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://backpan.cpan.org/modules/by-module/POE/RCAPUTO/POE=
-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libsnmp-session-perl_1.12.bb b/recipes/perl/lib=
snmp-session-perl_1.12.bb
> index 7905d46..e08587c 100644
> --- a/recipes/perl/libsnmp-session-perl_1.12.bb
> +++ b/recipes/perl/libsnmp-session-perl_1.12.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Perl support for accessing SNMP-aware devices"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://www.switch.ch/misc/leinen/snmp/perl/dist/SNMP_Sess=
ion-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libsoap-lite-perl_0.712.bb b/recipes/perl/libso=
ap-lite-perl_0.712.bb
> index c1dcd51..caf6b2d 100644
> --- a/recipes/perl/libsoap-lite-perl_0.712.bb
> +++ b/recipes/perl/libsoap-lite-perl_0.712.bb
> @@ -6,7 +6,7 @@ DEPENDS =3D " libmime-tools-perl-native libwww-perl-nativ=
e libxml-parser-perl-nati
> =A0RDEPENDS_${PN} =3D " libmime-tools-perl libwww-perl libxml-parser-perl=
 libtask-weaken-perl \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0libio-socket-ssl-perl libclass-inspector-perl =
\
> =A0 =A0 =A0 =A0 =A0 =A0 perl-module-scalar-util perl-module-constant"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.cpan.org/authors/id/M/MK/MKUTTER/SOAP-Lite-${P=
V}.tar.gz"
>
> diff --git a/recipes/perl/libsocket6-perl_0.23.bb b/recipes/perl/libsocke=
t6-perl_0.23.bb
> index 49aeb68..29b2a6c 100644
> --- a/recipes/perl/libsocket6-perl_0.23.bb
> +++ b/recipes/perl/libsocket6-perl_0.23.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Perl extensions for IPv6"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "unknown"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0BBCLASSEXTEND =3D "native"
>
> diff --git a/recipes/perl/libsub-exporter-perl_0.970.bb b/recipes/perl/li=
bsub-exporter-perl_0.970.bb
> index ea9bf02..0bd0485 100644
> --- a/recipes/perl/libsub-exporter-perl_0.970.bb
> +++ b/recipes/perl/libsub-exporter-perl_0.970.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "libdata-optlist-perl-native libsub-install-=
perl-native \
> =A0 =A0 =A0 =A0 =A0 =A0 libparams-util-perl-native"
> =A0RDEPENDS_${PN} +=3D "perl-module-carp libdata-optlist-perl libparams-u=
til-perl \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-strict libsub-install-perl perl-mo=
dule-warnings"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Expo=
rter-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libsub-install-perl_0.922.bb b/recipes/perl/lib=
sub-install-perl_0.922.bb
> index b246641..00b7df1 100644
> --- a/recipes/perl/libsub-install-perl_0.922.bb
> +++ b/recipes/perl/libsub-install-perl_0.922.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-carp perl-module-scalar-util perl-mod=
ule-strict \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-warnings"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RJ/RJBS/Sub-Inst=
all-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libsub-uplevel-perl_0.13.bb b/recipes/perl/libs=
ub-uplevel-perl_0.13.bb
> index c5f98a1..797a494 100644
> --- a/recipes/perl/libsub-uplevel-perl_0.13.bb
> +++ b/recipes/perl/libsub-uplevel-perl_0.13.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Sub::Uplevel - apparently run a function=
 in a higher stack frame"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-exporter perl-module-strict perl-modu=
le-vars"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DA/DAGOLDEN/Sub-=
Uplevel-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libsys-hostname-long-perl_1.4.bb b/recipes/perl=
/libsys-hostname-long-perl_1.4.bb
> index 71c93c3..9d9372d 100644
> --- a/recipes/perl/libsys-hostname-long-perl_1.4.bb
> +++ b/recipes/perl/libsys-hostname-long-perl_1.4.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SC/SCOTT/Sys-Hos=
tname-Long-${PV}.tar.gz;name=3Dsys-hostname-long-perl-${PV}"
> =A0SRC_URI[sys-hostname-long-perl-1.4.md5sum] =3D "a5b3c23754cbcff10e283d=
16c42ec3d3"
> diff --git a/recipes/perl/libsys-mmap-perl_0.13.bb b/recipes/perl/libsys-=
mmap-perl_0.13.bb
> index aa40e51..70dc174 100644
> --- a/recipes/perl/libsys-mmap-perl_0.13.bb
> +++ b/recipes/perl/libsys-mmap-perl_0.13.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Uses mmap to map in a file as a perl variable."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SW/SWALTERS/Sys-=
Mmap-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtask-weaken-perl_1.03.bb b/recipes/perl/libt=
ask-weaken-perl_1.03.bb
> index 80e8bf3..803698d 100644
> --- a/recipes/perl/libtask-weaken-perl_1.03.bb
> +++ b/recipes/perl/libtask-weaken-perl_1.03.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Task::Weaken - Ensure that a platform has weaken supp=
ort"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADAMK/Task-We=
aken-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "056ce36c576450d22e6b23b4dbfacd02"
> diff --git a/recipes/perl/libterm-progressbar-perl_2.09.bb b/recipes/perl=
/libterm-progressbar-perl_2.09.bb
> index 2d759d2..51deba7 100644
> --- a/recipes/perl/libterm-progressbar-perl_2.09.bb
> +++ b/recipes/perl/libterm-progressbar-perl_2.09.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Term::ProgressBar - provide a progress meter on a sta=
ndard terminal"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
> =A0DEPENDS =3D "libtermreadkey-perl-native libclass-methodmaker-perl-nati=
ve"
> =A0RDEPENDS_${PN} =3D "libtermreadkey-perl libclass-methodmaker-perl"
>
> diff --git a/recipes/perl/libtermreadkey-perl_2.30.bb b/recipes/perl/libt=
ermreadkey-perl_2.30.bb
> index bf25a58..7e70496 100644
> --- a/recipes/perl/libtermreadkey-perl_2.30.bb
> +++ b/recipes/perl/libtermreadkey-perl_2.30.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Term::ReadKey - A perl module for simple=
 terminal control"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://search.cpan.org/~jstowe/TermReadKey-2.30/"
> -PR =3D "r2"
> +PR =3D "r3"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JS/JSTOWE/TermRe=
adKey-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtest-builder-tester-perl_1.01.bb b/recipes/p=
erl/libtest-builder-tester-perl_1.01.bb
> index b6f76d8..0aa9cfb 100644
> --- a/recipes/perl/libtest-builder-tester-perl_1.01.bb
> +++ b/recipes/perl/libtest-builder-tester-perl_1.01.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-strict perl-module-carp perl-module-e=
xporter \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-symbol perl-module-vars"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MA/MARKF/Test-Bu=
ilder-Tester-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtest-differences-perl_0.47.bb b/recipes/perl=
/libtest-differences-perl_0.47.bb
> index 190c1d5..d40f807 100644
> --- a/recipes/perl/libtest-differences-perl_0.47.bb
> +++ b/recipes/perl/libtest-differences-perl_0.47.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libtext-diff-perl-native"
> =A0RDEPENDS_${PN} +=3D "perl-module-carp perl-module-constant perl-module=
-exporter \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-strict libtext-diff-perl"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RB/RBS/Test-Diff=
erences-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtest-exception-perl_0.22.bb b/recipes/perl/l=
ibtest-exception-perl_0.22.bb
> index ac60eb2..5b2fdd6 100644
> --- a/recipes/perl/libtest-exception-perl_0.22.bb
> +++ b/recipes/perl/libtest-exception-perl_0.22.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "libsub-uplevel-perl-native"
> =A0RDEPENDS_${PN} +=3D "perl-module-base perl-module-carp perl-module-str=
ict \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0libsub-uplevel-perl perl-module-test-builder \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-warnings"
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/A/AD/ADIE/Test-Exc=
eption-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "dcf44183af3d26b14d7f989fc5ee1117"
> diff --git a/recipes/perl/libtest-mockmodule-perl_0.05.bb b/recipes/perl/=
libtest-mockmodule-perl_0.05.bb
> index 1ffa1ac..6aaf7fa 100644
> --- a/recipes/perl/libtest-mockmodule-perl_0.05.bb
> +++ b/recipes/perl/libtest-mockmodule-perl_0.05.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-carp perl-module-scalar-util perl-mod=
ule-strict \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-vars "
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SI/SIMONFLK/Test=
-MockModule-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtest-output-perl_0.10.bb b/recipes/perl/libt=
est-output-perl_0.10.bb
> index f13c4d3..c06d2c0 100644
> --- a/recipes/perl/libtest-output-perl_0.10.bb
> +++ b/recipes/perl/libtest-output-perl_0.10.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libsub-exporter-perl-native"
> =A0RDEPENDS_${PN} +=3D "libsub-exporter-perl"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/S/SS/SSORICHE/Test=
-Output-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtest-pod-perl_1.42.bb b/recipes/perl/libtest=
-pod-perl_1.42.bb
> index 5b2eb45..1376c60 100644
> --- a/recipes/perl/libtest-pod-perl_1.42.bb
> +++ b/recipes/perl/libtest-pod-perl_1.42.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0BBCLASSEXTEND =3D "native"
> =A0RDEPENDS_${PN} +=3D "perl-module-test-more perl-module-file-spec perl-=
module-module-build perl-module-pod-simple"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/D/DW/DWHEELER/Test=
-Pod-${PV}.tar.gz;name=3Dtest-pod-perl-${PV}"
> =A0SRC_URI[test-pod-perl-1.42.md5sum] =3D "9c9b7ff52ea339aecbf247cd573df2=
38"
> diff --git a/recipes/perl/libtext-diff-perl_0.35.bb b/recipes/perl/libtex=
t-diff-perl_0.35.bb
> index fed91c5..3cbff26 100644
> --- a/recipes/perl/libtext-diff-perl_0.35.bb
> +++ b/recipes/perl/libtext-diff-perl_0.35.bb
> @@ -5,7 +5,7 @@ DEPENDS +=3D "libalgorithm-diff-perl-native"
> =A0RDEPENDS_${PN} +=3D "libalgorithm-diff-perl perl-module-carp perl-modu=
le-constant \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-exporter perl-module-strict perl-m=
odule-carp \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0perl-module-strict "
> -PR =3D "r5"
> +PR =3D "r6"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RB/RBS/Text-Diff=
-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libtimedate-perl_1.20.bb b/recipes/perl/libtime=
date-perl_1.20.bb
> index d280367..af08a3c 100644
> --- a/recipes/perl/libtimedate-perl_1.20.bb
> +++ b/recipes/perl/libtimedate-perl_1.20.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "TimeDate - parser for absolute times"
> =A0SECTION =3D "libs"
> =A0# You can redistribute it and/or modify it under the same terms as Per=
l itself.
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r2"
> +PR =3D "r3"
>
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GB/GBARR/TimeDat=
e-${PV}.tar.gz"
> diff --git a/recipes/perl/libtree-dag-node-perl_1.06.bb b/recipes/perl/li=
btree-dag-node-perl_1.06.bb
> index 2826c23..a433a5c 100644
> --- a/recipes/perl/libtree-dag-node-perl_1.06.bb
> +++ b/recipes/perl/libtree-dag-node-perl_1.06.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-strict"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/C/CO/COGENT/Tree-D=
AG_Node-${PV}.tar.gz;name=3Dtree-dag-node-perl-${PV}"
> =A0SRC_URI[tree-dag-node-perl-1.06.md5sum] =3D "3b006f128bd1d8961fc57c466=
ffa05f2"
> diff --git a/recipes/perl/libtree-simple-perl_1.18.bb b/recipes/perl/libt=
ree-simple-perl_1.18.bb
> index 2c1583d..820e426 100644
> --- a/recipes/perl/libtree-simple-perl_1.18.bb
> +++ b/recipes/perl/libtree-simple-perl_1.18.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "A simple tree object"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-test-more perl-module-scalar-util"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0PACKAGE_ARCH =3D "all"
>
> diff --git a/recipes/perl/libunicode-string-perl_2.09.bb b/recipes/perl/l=
ibunicode-string-perl_2.09.bb
> index 31711d5..7c2c7a5 100644
> --- a/recipes/perl/libunicode-string-perl_2.09.bb
> +++ b/recipes/perl/libunicode-string-perl_2.09.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Unicode::String - String of Unicode characters (UTF-1=
6BE)"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/Unicode-=
String-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libunicode-utf8simple-perl_1.06.bb b/recipes/pe=
rl/libunicode-utf8simple-perl_1.06.bb
> index fac877e..63adf9d 100644
> --- a/recipes/perl/libunicode-utf8simple-perl_1.06.bb
> +++ b/recipes/perl/libunicode-utf8simple-perl_1.06.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "Unicode::UTF8simple - Conversions to/from UTF8 from/t=
o charactersets"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "unknown"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GU/GUS/Unicode-U=
TF8simple-${PV}.tar.gz"
>
> diff --git a/recipes/perl/liburi-perl_1.55.bb b/recipes/perl/liburi-perl_=
1.55.bb
> index 426933a..67959d8 100644
> --- a/recipes/perl/liburi-perl_1.55.bb
> +++ b/recipes/perl/liburi-perl_1.55.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Manipulates and accesses URI strings"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D " perl-module-extutils-makemaker perl-module-mime-=
base64"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/URI-${PV=
}.tar.gz"
>
> diff --git a/recipes/perl/libversion-perl_0.6701.bb b/recipes/perl/libver=
sion-perl_0.6701.bb
> index 3053bf7..1c4714b 100644
> --- a/recipes/perl/libversion-perl_0.6701.bb
> +++ b/recipes/perl/libversion-perl_0.6701.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "version - Perl extension for Version Objects"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r9"
> +PR =3D "r20"
>
> =A0DEFAULT_PREFERENCE =3D "-1"
>
> diff --git a/recipes/perl/libversion-perl_0.82.bb b/recipes/perl/libversi=
on-perl_0.82.bb
> index 9eb8a76..7084894 100644
> --- a/recipes/perl/libversion-perl_0.82.bb
> +++ b/recipes/perl/libversion-perl_0.82.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "version - Perl extension for Version Obj=
ects"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0RDEPENDS_${PN} +=3D "perl-module-file-temp perl-module-test-more"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JP/JPEACOCK/vers=
ion-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "c073f079557297003d805b535711c5d1"
> diff --git a/recipes/perl/libwww-mechanize-perl_1.60.bb b/recipes/perl/li=
bwww-mechanize-perl_1.60.bb
> index 70d300a..8bcbbe1 100644
> --- a/recipes/perl/libwww-mechanize-perl_1.60.bb
> +++ b/recipes/perl/libwww-mechanize-perl_1.60.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "WWW::Mechanize =A0 =A0 =A0 =A0 =A0 Handy web browsing=
 in a Perl object"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PETDANCE/WWW-=
Mechanize-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libwww-perl_5.834.bb b/recipes/perl/libwww-perl=
_5.834.bb
> index 7117bde..dfc969b 100644
> --- a/recipes/perl/libwww-perl_5.834.bb
> +++ b/recipes/perl/libwww-perl_5.834.bb
> @@ -11,7 +11,7 @@ RDEPENDS_${PN} +=3D " \
> =A0 =A0 =A0 =A0"
> =A0BBCLASSEXTEND =3D "native"
>
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GA/GAAS/libwww-p=
erl-${PV}.tar.gz;name=3Dlibwww-perl-${PV}"
> =A0SRC_URI[libwww-perl-5.834.md5sum] =3D "f2ed8a461f76556c9caed9087f47c86=
c"
> diff --git a/recipes/perl/libx10-perl_0.03.bb b/recipes/perl/libx10-perl_=
0.03.bb
> index a313d47..c1a0904 100644
> --- a/recipes/perl/libx10-perl_0.03.bb
> +++ b/recipes/perl/libx10-perl_0.03.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "X10 support for Perl."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/R/RO/ROBF/X10-${PV=
}.tar.gz"
>
> diff --git a/recipes/perl/libxml-dom-perl_1.44.bb b/recipes/perl/libxml-d=
om-perl_1.44.bb
> index 098e304..5b1b091 100644
> --- a/recipes/perl/libxml-dom-perl_1.44.bb
> +++ b/recipes/perl/libxml-dom-perl_1.44.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "XML::DOM - A perl module for building DOM Level 1 com=
pliant document structures"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "unknown"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0DEPENDS +=3D "libxml-parser-perl-native libxml-regexp-perl-native \
> =A0 =A0 =A0 =A0libhtml-parser-perl-native libhtml-tagset-perl-native \
> diff --git a/recipes/perl/libxml-generator-perl_1.03.bb b/recipes/perl/li=
bxml-generator-perl_1.03.bb
> index 0a9123e..b1a05f7 100644
> --- a/recipes/perl/libxml-generator-perl_1.03.bb
> +++ b/recipes/perl/libxml-generator-perl_1.03.bb
> @@ -1,6 +1,7 @@
> =A0DESCRIPTION =3D "XML::Generator - Perl extension for generating XML"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/B/BH/BHOLZMAN/XML-=
Generator-${PV}.tar.gz;name=3Dxml-generator-perl-${PV}"
> =A0SRC_URI[xml-generator-perl-1.03.md5sum] =3D "789d60259eed4517a99897681=
00abede"
> diff --git a/recipes/perl/libxml-libxml-perl_1.70.bb b/recipes/perl/libxm=
l-libxml-perl_1.70.bb
> index 0c59205..2497f61 100644
> --- a/recipes/perl/libxml-libxml-perl_1.70.bb
> +++ b/recipes/perl/libxml-libxml-perl_1.70.bb
> @@ -9,7 +9,7 @@ RDEPENDS_${PN} +=3D "libxml2 \
> =A0 =A0 =A0 =A0 libxml-sax-perl \
> =A0 =A0 =A0 =A0 zlib \
> =A0"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PA/PAJAS/XML-Lib=
XML-${PV}.tar.gz;name=3Dlibxml \
> =A0 =A0 =A0 =A0 file://libxml-libxml-perl-disable-libxml2-check.patch \
> diff --git a/recipes/perl/libxml-namespacesupport-perl_1.11.bb b/recipes/=
perl/libxml-namespacesupport-perl_1.11.bb
> index 335dbb6..8144778 100644
> --- a/recipes/perl/libxml-namespacesupport-perl_1.11.bb
> +++ b/recipes/perl/libxml-namespacesupport-perl_1.11.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "XML-NamespaceSupport"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/P/PE/PERIGRIN/XML-=
NamespaceSupport-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "222cca76161cd956d724286d36b607da"
> diff --git a/recipes/perl/libxml-parser-perl_2.36.bb b/recipes/perl/libxm=
l-parser-perl_2.36.bb
> index f8f61b7..e664328 100644
> --- a/recipes/perl/libxml-parser-perl_2.36.bb
> +++ b/recipes/perl/libxml-parser-perl_2.36.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "XML::Parser - A perl module for parsing =
XML documents"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "expat expat-native"
> -PR=3D "r3"
> +PR=3D "r4"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/XML/XML-Parser-${PV=
}.tar.gz"
>
> diff --git a/recipes/perl/libxml-regexp-perl_0.03.bb b/recipes/perl/libxm=
l-regexp-perl_0.03.bb
> index 4a01c55..6663908 100644
> --- a/recipes/perl/libxml-regexp-perl_0.03.bb
> +++ b/recipes/perl/libxml-regexp-perl_0.03.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D "XML::RegExp - Regular expressions for XML tokens"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "unknown"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/T/TJ/TJMATHER/XML-=
RegExp-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libxml-sax-perl_0.96.bb b/recipes/perl/libxml-s=
ax-perl_0.96.bb
> index 650cfbb..bf26282 100644
> --- a/recipes/perl/libxml-sax-perl_0.96.bb
> +++ b/recipes/perl/libxml-sax-perl_0.96.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libxml-namespacesupport-perl-native"
> =A0RDEPENDS_${PN} +=3D "libxml-namespacesupport-perl perl-module-file-tem=
p"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/G/GR/GRANTM/XML-SA=
X-${PV}.tar.gz;name=3Dsax"
> =A0SRC_URI[sax.md5sum] =3D "bdcd4119a62505184e211e9dfaef0ab1"
> diff --git a/recipes/perl/libxml-simple-perl_2.18.bb b/recipes/perl/libxm=
l-simple-perl_2.18.bb
> index 8db9150..2ffbc72 100644
> --- a/recipes/perl/libxml-simple-perl_2.18.bb
> +++ b/recipes/perl/libxml-simple-perl_2.18.bb
> @@ -3,7 +3,7 @@ SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS +=3D "libxml-sax-perl-native"
> =A0RDEPENDS_${PN} +=3D "libxml-sax-perl"
> -PR =3D "r4"
> +PR =3D "r5"
>
> =A0SRC_URI =3D "http://www.cpan.org/modules/by-module/XML/XML-Simple-${PV=
}.tar.gz"
>
> diff --git a/recipes/perl/libxml-twig-perl_3.35.bb b/recipes/perl/libxml-=
twig-perl_3.35.bb
> index 81967cb..d35c77e 100644
> --- a/recipes/perl/libxml-twig-perl_3.35.bb
> +++ b/recipes/perl/libxml-twig-perl_3.35.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://www.xmltwig.com/"
> =A0DEPENDS +=3D "libxml-parser-perl-native"
> =A0RDEPENDS_${PN} +=3D "libxml-parser-perl"
> -PR =3D "r1"
> +PR =3D "r2"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MI/MIROD/XML-Twi=
g-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "867449a4c53c628dd16bdc8de49cfc88"
> diff --git a/recipes/perl/libxml-writer-perl_0.606.bb b/recipes/perl/libx=
ml-writer-perl_0.606.bb
> index fde313d..58727be 100644
> --- a/recipes/perl/libxml-writer-perl_0.606.bb
> +++ b/recipes/perl/libxml-writer-perl_0.606.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "XML::Writer - Perl extension for writing=
 XML documents."
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> =A0HOMEPAGE =3D "http://search.cpan.org/dist/XML-Writer/"
> -PR =3D "r3"
> +PR =3D "r4"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/J/JO/JOSEPHW/XML-W=
riter-${PV}.tar.gz"
>
> diff --git a/recipes/perl/libxml-xpath-perl_1.13.bb b/recipes/perl/libxml=
-xpath-perl_1.13.bb
> index 64e38c3..3496fbd 100644
> --- a/recipes/perl/libxml-xpath-perl_1.13.bb
> +++ b/recipes/perl/libxml-xpath-perl_1.13.bb
> @@ -1,7 +1,7 @@
> =A0DESCRIPTION =3D"XML::XPath - a set of modules for parsing and evaluati=
ng XPath statement"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "Artistic|GPLv1+"
> -PR =3D "r0"
> +PR =3D "r1"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/M/MS/MSERGEANT/XML=
-XPath-${PV}.tar.gz"
> =A0SRC_URI[md5sum] =3D "b5919d9220d83982feb6e2321850c5d7"
> diff --git a/recipes/perl/libyaml-perl_0.62.bb b/recipes/perl/libyaml-per=
l_0.62.bb
> index 2bdaaf5..d5fadf5 100644
> --- a/recipes/perl/libyaml-perl_0.62.bb
> +++ b/recipes/perl/libyaml-perl_0.62.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "Artistic|GPLv1+"
> =A0DEPENDS =3D "libdigest-sha1-perl-native liberror-perl-native \
> =A0 =A0 =A0 =A0 =A0 =A0libipc-sharelite-perl-native"
> =A0RDEPENDS_${PN} =3D "libdigest-sha1-perl liberror-perl libipc-sharelite=
-perl"
> -PR =3D "r6"
> +PR =3D "r7"
>
> =A0SRC_URI =3D "http://search.cpan.org/CPAN/authors/id/I/IN/INGY/YAML-${P=
V}.tar.gz"
>
> diff --git a/recipes/perl/perl-5.8.8/09_fix_installperl.patch b/recipes/p=
erl/perl-5.8.8/09_fix_installperl.patch
> deleted file mode 100644
> index f550537..0000000
> --- a/recipes/perl/perl-5.8.8/09_fix_installperl.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -Correctly identify arch-specific modules in ext/ where the .pm files
> -are under lib.
> -
> -Ensure that POSIX/SigAction is kept with the rest of the POSIX module
> -under archlib.
> -
> -diff --exclude=3Ddebian -Naur perl-5.8.8.orig/installperl perl-5.8.8/ins=
tallperl
> ---- perl-5.8.8.orig/installperl =A0 =A0 =A0 =A02006-01-29 02:35:28.00000=
0000 +1100
> -+++ perl-5.8.8/installperl =A0 =A0 2006-05-31 22:54:41.000000000 +1000
> -@@ -156,11 +156,8 @@
> - =A0 =A0 if ("$File::Find::dir/$_" =3D~ m{^ext\b(.*)/([^/]+)\.pm$}) {
> - =A0 =A0 =A0 my($path, $modname) =3D ($1,$2);
> -
> -- =A0 =A0 =A0# strip trailing component first
> -- =A0 =A0 =A0$path =3D~ s{/[^/]*$}{};
> --
> -- =A0 =A0 =A0# strip optional "/lib";
> -- =A0 =A0 =A0$path =3D~ s{/lib\b}{};
> -+ =A0 =A0 =A0# strip to optional "/lib", or remove trailing component
> -+ =A0 =A0 =A0$path =3D~ s{.*/lib\b}{} or $path =3D~ s{/[^/]*$}{};
> -
> - =A0 =A0 =A0 # strip any leading /
> - =A0 =A0 =A0 $path =3D~ s{^/}{};
> -@@ -851,7 +848,7 @@
> - =A0 =A0 }
> -
> - =A0 =A0 if (-f $_) {
> -- =A0 =A0 =A0if (/\.(?:al|ix)$/ && !($dir =3D~ m[^auto/(.*)$] && $archpm=
s{$1})) {
> -+ =A0 =A0 =A0if (/\.(?:al|ix)$/ && !($dir =3D~ m[^auto/(.*)$])) {
> - =A0 =A0 =A0 =A0 =A0 $installlib =3D $installprivlib;
> - =A0 =A0 =A0 =A0 =A0 #We're installing *.al and *.ix files into $install=
privlib,
> - =A0 =A0 =A0 =A0 =A0 #but we have to delete old *.al and *.ix files from=
 the 5.000
> diff --git a/recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch b/rec=
ipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch
> deleted file mode 100644
> index 8a964f9..0000000
> --- a/recipes/perl/perl-5.8.8/52_debian_extutils_hacks.patch
> +++ /dev/null
> @@ -1,234 +0,0 @@
> -Various debian-specific ExtUtils changes:
> -
> - * Respect umask during installation, and set as appropriate for each of
> - =A0 perl, vendor and site (policy requires group writable site dirs).
> -
> - * Don't install .packlist or perllocal.pod for perl or vendor.
> - * Fiddle with *PREFIX and variables written to the makefile so that
> - =A0 install directories may be changed when make is run by passing
> - =A0 PREFIX=3D to the "make install" command (used when packaging
> - =A0 modules).
> -
> - * Set location of libperl.a to /usr/lib.
> - * Note that libperl-dev package is required for embedded linking.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/Embed.pm perl=
-5.8.8/lib/ExtUtils/Embed.pm
> ---- perl-5.8.8.orig/lib/ExtUtils/Embed.pm =A0 =A0 =A02004-08-03 20:41:49=
.000000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/Embed.pm =A0 2006-02-05 10:42:11.000000000 +=
1100
> -@@ -300,6 +300,9 @@
> - Typically, an application B<Makefile> will invoke ExtUtils::Embed
> - functions while building your application.
> -
> -+Note that on Debian systems the B<libperl-dev> package is required for
> -+compiling applications which embed an interpreter.
> -+
> - =3Dhead1 @EXPORT
> -
> - ExtUtils::Embed exports the following functions:
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/Install.pm pe=
rl-5.8.8/lib/ExtUtils/Install.pm
> ---- perl-5.8.8.orig/lib/ExtUtils/Install.pm =A0 =A02005-10-21 22:00:01.0=
00000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/Install.pm 2006-02-05 10:42:11.000000000 +11=
00
> -@@ -173,8 +173,8 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (-f $targetfile){
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 forceunlink($targetfile) unless $no=
nono;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mkpath($targetdir,0,0755) unless $n=
onono;
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0print "mkpath($targetdir,0,0755)\n"=
 if $verbose>1;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mkpath($targetdir) unless $nonono;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0print "mkpath($targetdir)\n" if $ve=
rbose>1;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 copy($sourcefile, $targetfile) unless $nono=
no;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 print "Installing $targetfile\n";
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/MM_Any.pm per=
l-5.8.8/lib/ExtUtils/MM_Any.pm
> ---- perl-5.8.8.orig/lib/ExtUtils/MM_Any.pm =A0 =A0 2005-04-13 17:49:53.0=
00000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/MM_Any.pm =A02006-02-05 11:17:52.000000000 +=
1100
> -@@ -645,8 +645,6 @@
> - sub manifypods_target {
> - =A0 =A0 my($self) =3D shift;
> -
> -- =A0 =A0my $man1pods =A0 =A0 =A0=3D '';
> -- =A0 =A0my $man3pods =A0 =A0 =A0=3D '';
> - =A0 =A0 my $dependencies =A0=3D '';
> -
> - =A0 =A0 # populate manXpods & dependencies:
> -@@ -666,7 +664,7 @@
> - =A0 =A0 foreach my $section (qw(1 3)) {
> - =A0 =A0 =A0 =A0 my $pods =3D $self->{"MAN${section}PODS"};
> - =A0 =A0 =A0 =A0 push @man_cmds, $self->split_command(<<CMD, %$pods);
> -- =A0 =A0 =A0\$(NOECHO) \$(POD2MAN) --section=3D$section --perm_rw=3D\$(=
PERM_RW)
> -+ =A0 =A0 =A0\$(NOECHO) \$(POD2MAN) --section=3D\$(MAN${section}EXT) --p=
erm_rw=3D\$(PERM_RW)
> - CMD
> - =A0 =A0 }
> -
> -@@ -1080,9 +1078,11 @@
> - =A0 =A0 =A0 =A0 $self->{SITEPREFIX} =A0 ||=3D $sprefix;
> - =A0 =A0 =A0 =A0 $self->{VENDORPREFIX} ||=3D $vprefix;
> -
> -- =A0 =A0 =A0 =A0# Lots of MM extension authors like to use $(PREFIX) so=
 we
> -- =A0 =A0 =A0 =A0# put something sensible in there no matter what.
> -- =A0 =A0 =A0 =A0$self->{PREFIX} =3D '$('.uc $self->{INSTALLDIRS}.'PREFI=
X)';
> -+ =A0 =A0 =A0my $p =3D $self->{PREFIX} =3D $self->{PERLPREFIX};
> -+ =A0 =A0 =A0for my $t (qw/PERL SITE VENDOR/)
> -+ =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0$self->{"${t}PREFIX"} =3D~ s!^\Q$p\E(?=3D/|$)!\$(PR=
EFIX)!;
> -+ =A0 =A0 =A0}
> - =A0 =A0 }
> -
> - =A0 =A0 my $arch =A0 =A0=3D $Config{archname};
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm pe=
rl-5.8.8/lib/ExtUtils/MM_Unix.pm
> ---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm =A0 =A02005-05-21 19:42:56.0=
00000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm 2006-02-05 17:40:19.000000000 +11=
00
> -@@ -2054,9 +2054,7 @@
> - =A0 =A0 =A0 $(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to IN=
STALLDIRS=3Dsite
> -
> - pure_perl_install ::
> -- =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0read }.$self->catfile('$(PERL_ARCHLIB)','au=
to','$(FULLEXT)','.packlist').q{ \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0write }.$self->catfile('$(DESTINSTALLARCHLI=
B)','auto','$(FULLEXT)','.packlist').q{ \
> -+ =A0 =A0 =A0$(NOECHO) umask 022; $(MOD_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_LIB) $(DESTINSTALLPRIVLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_BIN) $(DESTINSTALLBIN) \
> -@@ -2068,7 +2066,7 @@
> -
> -
> - pure_site_install ::
> -- =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> -+ =A0 =A0 =A0$(NOECHO) umask 02; $(MOD_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 read }.$self->catfile('$(SITEARCHEXP)','aut=
o','$(FULLEXT)','.packlist').q{ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 write }.$self->catfile('$(DESTINSTALLSITEAR=
CH)','auto','$(FULLEXT)','.packlist').q{ \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_LIB) $(DESTINSTALLSITELIB) \
> -@@ -2081,9 +2079,7 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }.$self->catdir('$(PERL_ARCHLIB)','auto','$=
(FULLEXT)').q{
> -
> - pure_vendor_install ::
> -- =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0read }.$self->catfile('$(VENDORARCHEXP)','a=
uto','$(FULLEXT)','.packlist').q{ \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0write }.$self->catfile('$(DESTINSTALLVENDOR=
ARCH)','auto','$(FULLEXT)','.packlist').q{ \
> -+ =A0 =A0 =A0$(NOECHO) umask 022; $(MOD_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_LIB) $(DESTINSTALLVENDORLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_BIN) $(DESTINSTALLVENDORBIN) \
> -@@ -2092,37 +2088,19 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
> -
> - doc_perl_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"Module" "$(NAME)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"installed into" "$(INSTALLPRIVLIB)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0LINKTYPE "$(LINKTYPE)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0VERSION "$(VERSION)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -
> - doc_site_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -+ =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLSITEARCH)/perllocal.pod
> -+ =A0 =A0 =A0-$(NOECHO) umask 02; $(MKPATH) $(DESTINSTALLSITEARCH)
> -+ =A0 =A0 =A0-$(NOECHO) umask 02; $(DOC_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Module" "$(NAME)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "installed into" "$(INSTALLSITELIB)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 LINKTYPE "$(LINKTYPE)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 VERSION "$(VERSION)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLSITEARCH)=
','perllocal.pod').q{
> -
> - doc_vendor_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"Module" "$(NAME)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"installed into" "$(INSTALLVENDORLIB)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0LINKTYPE "$(LINKTYPE)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0VERSION "$(VERSION)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -
> - };
> -
> -@@ -2131,13 +2109,12 @@
> - =A0 =A0 =A0 $(NOECHO) $(NOOP)
> -
> - uninstall_from_perldirs ::
> -- =A0 =A0 =A0$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','=
auto','$(FULLEXT)','.packlist').q{
> -
> - uninstall_from_sitedirs ::
> - =A0 =A0 =A0 $(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','a=
uto','$(FULLEXT)','.packlist').q{
> -
> - uninstall_from_vendordirs ::
> -- =A0 =A0 =A0$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)',=
'auto','$(FULLEXT)','.packlist').q{
> -+
> - };
> -
> - =A0 =A0 join("",@m);
> -@@ -2415,7 +2392,7 @@
> - =A0 =A0 =A0 ($lperl =3D $libperl) =3D~ s/\$\(A\)/$self->{LIB_EXT}/;
> - =A0 =A0 }
> - =A0 =A0 unless ($libperl && -f $lperl) { # Ilya's code...
> -- =A0 =A0 =A0my $dir =3D $self->{PERL_SRC} || "$self->{PERL_ARCHLIB}/COR=
E";
> -+ =A0 =A0 =A0my $dir =3D $self->{PERL_SRC} || "/usr/lib";
> - =A0 =A0 =A0 $dir =3D "$self->{PERL_ARCHLIB}/.." if $self->{UNINSTALLED_=
PERL};
> - =A0 =A0 =A0 $libperl ||=3D "libperl$self->{LIB_EXT}";
> - =A0 =A0 =A0 $libperl =A0 =3D "$dir/$libperl";
> -@@ -3007,8 +2984,7 @@
> - =A0 =A0 print STDERR " =A0prefixify $var =3D> $path\n" if $Verbose >=3D=
 2;
> - =A0 =A0 print STDERR " =A0 =A0from $sprefix to $rprefix\n" if $Verbose =
>=3D 2;
> -
> -- =A0 =A0if( $self->{ARGS}{PREFIX} && $self->file_name_is_absolute($path=
) &&
> -- =A0 =A0 =A0 =A0$path !~ s{^\Q$sprefix\E\b}{$rprefix}s )
> -+ =A0 =A0if( $path !~ s{^\Q$sprefix\E\b}{$rprefix}s && $self->{ARGS}{PRE=
FIX} )
> - =A0 =A0 {
> -
> - =A0 =A0 =A0 =A0 print STDERR " =A0 =A0cannot prefix, using default.\n" =
if $Verbose >=3D 2;
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/t/INST.t perl=
-5.8.8/lib/ExtUtils/t/INST.t
> ---- perl-5.8.8.orig/lib/ExtUtils/t/INST.t =A0 =A0 =A02005-10-21 19:12:39=
.000000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/t/INST.t =A0 2006-02-05 17:48:56.000000000 +=
1100
> -@@ -65,9 +65,7 @@
> - is( $mm->{NAME}, 'Big::Dummy', =A0'NAME' );
> - is( $mm->{VERSION}, 0.01, =A0 =A0 =A0 =A0 =A0 =A0'VERSION' );
> -
> --my $config_prefix =3D $Config{installprefixexp} || $Config{installprefi=
x} ||
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$Config{prefixexp} =A0 =A0 =A0 =
=A0|| $Config{prefix};
> --is( $mm->{PERLPREFIX}, $config_prefix, =A0 'PERLPREFIX' );
> -+is( $mm->{PERLPREFIX}, '$(PREFIX)', =A0 'PERLPREFIX' );
> -
> - is( !!$mm->{PERL_CORE}, !!$ENV{PERL_CORE}, 'PERL_CORE' );
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/t/INST_PREFIX=
.t perl-5.8.8/lib/ExtUtils/t/INST_PREFIX.t
> ---- perl-5.8.8.orig/lib/ExtUtils/t/INST_PREFIX.t =A0 =A0 =A0 2005-10-21 =
22:00:19.000000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/t/INST_PREFIX.t =A0 =A02006-02-05 17:48:06.0=
00000000 +1100
> -@@ -16,7 +16,7 @@
> - }
> -
> - use strict;
> --use Test::More tests =3D> 52;
> -+use Test::More tests =3D> 47;
> - use MakeMaker::Test::Utils;
> - use MakeMaker::Test::Setup::BFD;
> - use ExtUtils::MakeMaker;
> -@@ -62,16 +62,16 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Writing\ $Makefile\ for=
\ Big::Dummy\n
> - }x );
> -
> --is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' )=
;
> -+#is( $mm->{PREFIX}, '$(SITEPREFIX)', 'PREFIX set based on INSTALLDIRS' =
);
> -
> - isa_ok( $mm, 'ExtUtils::MakeMaker' );
> -
> - is( $mm->{NAME}, 'Big::Dummy', =A0'NAME' );
> - is( $mm->{VERSION}, 0.01, =A0 =A0 =A0 =A0 =A0 =A0'VERSION' );
> -
> --foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
> -- =A0 =A0unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
> --}
> -+#foreach my $prefix (qw(PREFIX PERLPREFIX SITEPREFIX VENDORPREFIX)) {
> -+# =A0 =A0unlike( $mm->{$prefix}, qr/\$\(PREFIX\)/ );
> -+#}
> -
> -
> - my $PREFIX =3D File::Spec->catdir('foo', 'bar');
> diff --git a/recipes/perl/perl-5.8.8/53_debian_mod_paths.patch b/recipes/=
perl/perl-5.8.8/53_debian_mod_paths.patch
> deleted file mode 100644
> index df74bc5..0000000
> --- a/recipes/perl/perl-5.8.8/53_debian_mod_paths.patch
> +++ /dev/null
> @@ -1,107 +0,0 @@
> -Tweak @INC so that the ordering is:
> -
> - =A0 =A0etc (for config files)
> - =A0 =A0site (5.8.1)
> - =A0 =A0vendor (all)
> - =A0 =A0core (5.8.1)
> - =A0 =A0site (version-indep)
> - =A0 =A0site (pre-5.8.1)
> -
> -The rationale being that an admin (via site), or module packager
> -(vendor) can chose to shadow core modules when there is a newer
> -version than is included in core.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/perl.c perl-5.8.8/perl.c
> ---- perl-5.8.8.orig/perl.c =A0 =A0 2006-01-31 23:34:47.000000000 +1100
> -+++ perl-5.8.8/perl.c =A02006-02-02 23:36:38.000000000 +1100
> -@@ -4776,9 +4776,14 @@
> - =A0 =A0 incpush(APPLLIB_EXP, TRUE, TRUE, TRUE);
> - #endif
> -
> -+#if 1
> -+ =A0 =A0/* for configuration where /usr is mounted ro (CPAN::Config, Ne=
t::Config) */
> -+ =A0 =A0incpush("/etc/perl", FALSE, FALSE, FALSE);
> -+#else
> - #ifdef ARCHLIB_EXP
> - =A0 =A0 incpush(ARCHLIB_EXP, FALSE, FALSE, TRUE);
> - #endif
> -+#endif
> - #ifdef MACOS_TRADITIONAL
> - =A0 =A0 {
> - =A0 =A0 =A0 Stat_t tmpstatbuf;
> -@@ -4803,11 +4808,13 @@
> - #ifndef PRIVLIB_EXP
> - # =A0define PRIVLIB_EXP "/usr/local/lib/perl5:/usr/local/lib/perl"
> - #endif
> -+#if 0
> - #if defined(WIN32)
> - =A0 =A0 incpush(PRIVLIB_EXP, TRUE, FALSE, TRUE);
> - #else
> - =A0 =A0 incpush(PRIVLIB_EXP, FALSE, FALSE, TRUE);
> - #endif
> -+#endif
> -
> - #ifdef SITEARCH_EXP
> - =A0 =A0 /* sitearch is always relative to sitelib on Windows for
> -@@ -4850,6 +4857,61 @@
> - =A0 =A0 incpush(PERL_VENDORLIB_STEM, FALSE, TRUE, TRUE);
> - #endif
> -
> -+#if 1
> -+ =A0 =A0incpush(ARCHLIB_EXP, FALSE, FALSE, TRUE);
> -+ =A0 =A0incpush(PRIVLIB_EXP, FALSE, FALSE, TRUE);
> -+
> -+ =A0 =A0/* Non-versioned site directory for local modules and for
> -+ =A0 =A0 =A0 compatability with the previous packages' site dirs */
> -+ =A0 =A0incpush("/usr/local/lib/site_perl", TRUE, FALSE, FALSE);
> -+
> -+#ifdef PERL_INC_VERSION_LIST
> -+ =A0 =A0{
> -+ =A0 =A0 =A0struct stat s;
> -+
> -+ =A0 =A0 =A0/* add small buffer in case old versions are longer than th=
e
> -+ =A0 =A0 =A0 =A0 current version */
> -+ =A0 =A0 =A0char sitearch[sizeof(SITEARCH_EXP)+16] =3D SITEARCH_EXP;
> -+ =A0 =A0 =A0char sitelib[sizeof(SITELIB_EXP)+16] =3D SITELIB_EXP;
> -+ =A0 =A0 =A0char const *vers[] =3D { PERL_INC_VERSION_LIST };
> -+ =A0 =A0 =A0char const **p;
> -+
> -+ =A0 =A0 =A0char *arch_vers =3D strrchr(sitearch, '/');
> -+ =A0 =A0 =A0char *lib_vers =3D strrchr(sitelib, '/');
> -+
> -+ =A0 =A0 =A0if (arch_vers && isdigit(*++arch_vers))
> -+ =A0 =A0 =A0 =A0 =A0*arch_vers =3D 0;
> -+ =A0 =A0 =A0else
> -+ =A0 =A0 =A0 =A0 =A0arch_vers =3D 0;
> -+
> -+ =A0 =A0 =A0if (lib_vers && isdigit(*++lib_vers))
> -+ =A0 =A0 =A0 =A0 =A0*lib_vers =3D 0;
> -+ =A0 =A0 =A0else
> -+ =A0 =A0 =A0 =A0 =A0lib_vers =3D 0;
> -+
> -+ =A0 =A0 =A0/* there is some duplication here as incpush does something
> -+ =A0 =A0 =A0 =A0 similar internally, but required as sitearch is not a
> -+ =A0 =A0 =A0 =A0 subdirectory of sitelib */
> -+ =A0 =A0 =A0for (p =3D vers; *p; p++)
> -+ =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0if (arch_vers)
> -+ =A0 =A0 =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0strcpy(arch_vers, *p);
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (PerlLIO_stat(sitearch, &s) >=3D 0 && S_=
ISDIR(s.st_mode))
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0incpush(sitearch, FALSE, FALSE, FAL=
SE);
> -+ =A0 =A0 =A0 =A0 =A0}
> -+
> -+ =A0 =A0 =A0 =A0 =A0if (lib_vers)
> -+ =A0 =A0 =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0strcpy(lib_vers, *p);
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0if (PerlLIO_stat(sitelib, &s) >=3D 0 && S_I=
SDIR(s.st_mode))
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0incpush(sitelib, FALSE, FALSE, FALS=
E);
> -+ =A0 =A0 =A0 =A0 =A0}
> -+ =A0 =A0 =A0}
> -+ =A0 =A0}
> -+#endif
> -+#endif
> -+
> - #ifdef PERL_OTHERLIBDIRS
> - =A0 =A0 incpush(PERL_OTHERLIBDIRS, TRUE, TRUE, TRUE);
> - #endif
> diff --git a/recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch b/recipes/=
perl/perl-5.8.8/54_debian_perldoc-r.patch
> deleted file mode 100644
> index 432cd85..0000000
> --- a/recipes/perl/perl-5.8.8/54_debian_perldoc-r.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -In a Debian installation, not all directories in @INC need exist (the
> -site directories for example are created on demand).
> -
> -Suggested by Joey Hess <joeyh@debian.org>.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/Pod/Perldoc.pm perl-5.=
8.8/lib/Pod/Perldoc.pm
> ---- perl-5.8.8.orig/lib/Pod/Perldoc.pm 2004-12-29 23:15:33.000000000 +11=
00
> -+++ perl-5.8.8/lib/Pod/Perldoc.pm =A0 =A0 =A02006-02-02 23:38:49.0000000=
00 +1100
> -@@ -1533,6 +1533,7 @@
> - =A0 =A0 $self->{'target'} =3D (splitdir $s)[-1]; =A0# XXX: why not use =
File::Basename?
> - =A0 =A0 for ($i=3D0; $i<@dirs; $i++) {
> - =A0 =A0 =A0 $dir =3D $dirs[$i];
> -+ =A0 =A0 =A0next unless -d $dir; # some dirs in @INC are optional
> - =A0 =A0 =A0 ($dir =3D VMS::Filespec::unixpath($dir)) =3D~ s!/\z!! if IS=
_VMS;
> - =A0 =A0 =A0 if ( =A0 =A0 =A0 (! $self->opt_m && ( $ret =3D $self->check=
_file($dir,"$s.pod")))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 or ( $ret =3D $self->check_file($dir,"$s.pm=
"))
> diff --git a/recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch b/r=
ecipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch
> deleted file mode 100644
> index b38c70c..0000000
> --- a/recipes/perl/perl-5.8.8/58_debian_cpan_config_path.patch
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -Set location of CPAN::Config to /etc/perl as /usr may not be writable.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/CPAN.pm perl-5.8.8/lib=
/CPAN.pm
> ---- perl-5.8.8.orig/lib/CPAN.pm =A0 =A0 =A0 =A02006-02-01 01:11:22.00000=
0000 +1100
> -+++ perl-5.8.8/lib/CPAN.pm =A0 =A0 2006-02-02 23:49:26.000000000 +1100
> -@@ -1246,7 +1246,7 @@
> - =A0 =A0 =A0 $configpm =3D $INC{"CPAN/MyConfig.pm"};
> - =A0 =A0 =A0 $redo++;
> - =A0 =A0 } else {
> -- =A0 =A0 =A0my($path_to_cpan) =3D File::Basename::dirname($INC{"CPAN.pm=
"});
> -+ =A0 =A0 =A0my($path_to_cpan) =3D '/etc/perl';
> - =A0 =A0 =A0 my($configpmdir) =3D File::Spec->catdir($path_to_cpan,"CPAN=
");
> - =A0 =A0 =A0 my($configpmtest) =3D File::Spec->catfile($configpmdir,"Con=
fig.pm");
> - =A0 =A0 =A0 if (-d $configpmdir or File::Path::mkpath($configpmdir)) {
> diff --git a/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch b=
/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch
> deleted file mode 100644
> index 7842ce1..0000000
> --- a/recipes/perl/perl-5.8.8/60_debian_libnet_config_path.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Set location of libnet.cfg to /etc/perl/Net as /usr may not be writable.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/Net/Config.pm perl-5.8=
.8/lib/Net/Config.pm
> ---- perl-5.8.8.orig/lib/Net/Config.pm =A02002-03-01 01:04:31.000000000 +=
1100
> -+++ perl-5.8.8/lib/Net/Config.pm =A0 =A0 =A0 2006-02-03 00:00:55.0000000=
00 +1100
> -@@ -57,9 +57,8 @@
> - }
> - TRY_INTERNET_CONFIG
> -
> --my $file =3D __FILE__;
> -+my $file =3D '/etc/perl/Net/libnet.cfg';
> - my $ref;
> --$file =3D~ s/Config.pm/libnet.cfg/;
> - if ( -f $file ) {
> - =A0 =A0 $ref =3D eval { local $SIG{__DIE__}; do $file };
> - =A0 =A0 if (ref($ref) eq 'HASH') {
> diff --git a/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch =
b/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch
> deleted file mode 100644
> index 682061d..0000000
> --- a/recipes/perl/perl-5.8.8/62_debian_cpan_definstalldirs.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -Some modules which are included in core set INSTALLDIRS =3D> 'perl'
> -explicitly in Makefile.PL. =A0This makes sense for the normal @INC
> -ordering, but not ours. =A0Provide a sensible default.
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/CPAN/FirstTime.pm perl=
-5.8.8/lib/CPAN/FirstTime.pm
> ---- perl-5.8.8.orig/lib/CPAN/FirstTime.pm =A0 =A0 =A02006-01-31 08:08:57=
.000000000 +1100
> -+++ perl-5.8.8/lib/CPAN/FirstTime.pm =A0 2006-02-03 00:05:24.000000000 +=
1100
> -@@ -358,7 +358,7 @@
> -
> - };
> -
> -- =A0 =A0$default =3D $CPAN::Config->{makepl_arg} || "";
> -+ =A0 =A0$default =3D $CPAN::Config->{makepl_arg} || "INSTALLDIRS=3Dsite=
";
> - =A0 =A0 $CPAN::Config->{makepl_arg} =3D
> - =A0 =A0 =A0 prompt("Parameters for the 'perl Makefile.PL' command?
> - Typical frequently used settings:
> diff --git a/recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch b/recipes=
/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
> deleted file mode 100644
> index c207a93..0000000
> --- a/recipes/perl/perl-5.8.8/64_debian_enc2xs_inc.patch
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -Tweak enc2xs to handle Debian @INC: =A0ignore missing directories,
> -follow symlinks (/usr/share/perl/5.8 -> 5.8.4).
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/ext/Encode/bin/enc2xs perl=
-5.8.8/ext/Encode/bin/enc2xs
> ---- perl-5.8.8.orig/ext/Encode/bin/enc2xs =A0 =A0 =A02004-09-03 01:53:51=
.000000000 +1000
> -+++ perl-5.8.8/ext/Encode/bin/enc2xs =A0 2006-02-03 00:21:32.000000000 +=
1100
> -@@ -909,10 +909,11 @@
> - =A0 =A0 eval { require File::Find; };
> - =A0 =A0 my (@inc, %e2x_dir);
> - =A0 =A0 for my $inc (@INC){
> -+ =A0 =A0 =A0next unless -d $inc; # skip non-existent directories
> - =A0 =A0 =A0 push @inc, $inc unless $inc eq '.'; #skip current dir
> - =A0 =A0 }
> - =A0 =A0 File::Find::find(
> -- =A0 =A0 =A0 =A0 =A0 sub {
> -+ =A0 =A0 =A0 =A0 =A0 { wanted =3D> sub {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0my ($dev,$ino,$mode,$nlink,$uid,$gid,$rd=
ev,$size,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$atime,$mtime,$ctime,$blksize,$b=
locks)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=3D lstat($_) or return;
> -@@ -922,7 +923,7 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0$e2x_dir{$File::Find::dir} ||=3D=
 $mtime;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
> -- =A0 =A0 =A0 =A0 =A0 }, @inc);
> -+ =A0 =A0 =A0 =A0 =A0 }, follow =3D> 1}, @inc);
> - =A0 =A0 warn join("\n", keys %e2x_dir), "\n";
> - =A0 =A0 for my $d (sort {$e2x_dir{$a} <=3D> $e2x_dir{$b}} keys %e2x_dir=
){
> - =A0 =A0 =A0 $_E2X =3D $d;
> diff --git a/recipes/perl/perl-5.8.8/Makefile.SH.patch b/recipes/perl/per=
l-5.8.8/Makefile.SH.patch
> deleted file mode 100644
> index 864bd78..0000000
> --- a/recipes/perl/perl-5.8.8/Makefile.SH.patch
> +++ /dev/null
> @@ -1,253 +0,0 @@
> -Index: perl-5.8.8/Makefile.SH
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/Makefile.SH =A0 =A0 =A0 =A02006-01-24 23:49:44.00000=
0000 +1100
> -+++ perl-5.8.8/Makefile.SH =A0 =A0 2007-06-14 13:29:37.000000000 +1000
> -@@ -43,12 +43,12 @@
> - true)
> - =A0 =A0 =A0 # Prefix all runs of 'miniperl' and 'perl' with
> - =A0 =A0 =A0 # $ldlibpth so that ./perl finds *this* shared libperl.
> -- =A0 =A0 =A0case "$LD_LIBRARY_PATH" in
> -- =A0 =A0 =A0'')
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`";;
> -- =A0 =A0 =A0*)
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`:${LD_LI=
BRARY_PATH}";;
> -- =A0 =A0 =A0esac
> -+# =A0 =A0 case "$LD_LIBRARY_PATH" in
> -+# =A0 =A0 '')
> -+# =A0 =A0 =A0 =A0 =A0 =A0 ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`";;
> -+# =A0 =A0 *)
> -+# =A0 =A0 =A0 =A0 =A0 =A0 ldlibpth=3D"LD_LIBRARY_PATH=3D`pwd`:${LD_LIBR=
ARY_PATH}";;
> -+# =A0 =A0 esac
> -
> - =A0 =A0 =A0 pldlflags=3D"$cccdlflags"
> - =A0 =A0 =A0 static_target=3D'static_pic'
> -@@ -108,7 +108,8 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ldlibpth=3D''
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 =A0 =A0 *)
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0eval "ldlibpth=3D\"$ldlibpthname=3D`pwd`:\$=
$ldlibpthname\""
> -+# We compile in the library path in OE from cross-compile, so lets not =
do this
> -+# =A0 =A0 =A0 =A0 =A0 =A0 eval "ldlibpth=3D\"$ldlibpthname=3D`pwd`:\$$l=
dlibpthname\""
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 =A0 =A0 esac
> - =A0 =A0 =A0 =A0 =A0 # Strip off any trailing :'s
> -@@ -129,18 +130,7 @@
> - =A0 =A0 =A0 =A0 =A0 # INSTALL file, under "Building a shared perl libra=
ry".
> - =A0 =A0 =A0 =A0 =A0 # If there is no pre-existing $libperl, we don't ne=
ed
> - =A0 =A0 =A0 =A0 =A0 # to do anything further.
> -- =A0 =A0 =A0 =A0 =A0if test -f $archlib/CORE/$libperl; then
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0rm -f preload
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0cat <<'EOT' > preload
> --#! /bin/sh
> --lib=3D$1
> --shift
> --test -r $lib && export LD_PRELOAD=3D"$lib $LD_PRELOAD"
> --exec "$@"
> --EOT
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0chmod 755 preload
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0ldlibpth=3D"$ldlibpth `pwd`/preload `pwd`/$=
libperl"
> -- =A0 =A0 =A0 =A0 =A0fi
> -+ =A0 =A0 =A0 =A0 =A0echo linux libraries overwritten by cross-compile p=
atches
> - =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 os390) =A0test -f /bin/env && ldlibpth=3D"/bin/env $ldlibpt=
h"
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> -@@ -401,9 +391,19 @@
> - .c.s:
> - =A0 =A0 =A0 $(CCCMDSRC) -S $*.c
> -
> --all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) extra.pods $(private) $(unidat=
afiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
> -- =A0 =A0 =A0@echo " ";
> -- =A0 =A0 =A0@echo " Everything is up to date. Type '$(MAKE) test' to ru=
n test suite."
> -+#all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) extra.pods $(private) $(unida=
tafiles) $(public) $(dynamic_ext) $(nonxs_ext) extras.make
> -+# =A0 =A0 @echo " ";
> -+# =A0 =A0 @echo " Everything is up to date. Type '$(MAKE) test' to run =
test suite."
> -+
> -+all: $(FIRSTMAKEFILE) miniperl$(EXE_EXT) $(unidatafiles)
> -+
> -+more: extra.pods $(private) $(public)
> -+
> -+more2: $(dynamic_ext)
> -+
> -+more3: $(nonxs_ext)
> -+
> -+more4: extras.make
> -
> - .PHONY: all compile translators utilities
> -
> -@@ -413,10 +413,10 @@
> - =A0 =A0 =A0 cd x2p; $(MAKE) compile;
> - =A0 =A0 =A0 cd pod; $(MAKE) compile;
> -
> --translators: =A0miniperl$(EXE_EXT) $(CONFIGPM) FORCE
> -+translators: =A0$(CONFIGPM) FORCE
> - =A0 =A0 =A0 @echo " "; echo " =A0 =A0 =A0 Making x2p stuff"; cd x2p; $(=
LDLIBPTH) $(MAKE) all
> -
> --utilities: =A0 =A0miniperl$(EXE_EXT) $(CONFIGPM) $(plextract) lib/lib.p=
m FORCE
> -+utilities: =A0 =A0$(CONFIGPM) $(plextract) lib/lib.pm FORCE
> - =A0 =A0 =A0 @echo " "; echo " =A0 =A0 =A0 Making utilities"; cd utils; =
$(LDLIBPTH) $(MAKE) all
> -
> -
> -@@ -550,7 +550,7 @@
> - =A0 =A0 =A0 case "$useshrplib" in
> - =A0 =A0 =A0 true)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $spitshell >>Makefile <<'!NO!SUBS!'
> -- =A0 =A0 =A0$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs)
> -+ =A0 =A0 =A0$(LD) -o $@ $(SHRPLDFLAGS) perl$(OBJ_EXT) $(obj) $(libs) -W=
l,-soname,libperl.so.5
> - !NO!SUBS!
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 case "$osname" in
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 aix)
> -@@ -591,7 +591,9 @@
> - =A0 =A0 =A0 $(CC) -o miniperl $(CLDFLAGS) \
> - =A0 =A0 =A0 =A0 =A0 `echo $(obj) | sed 's/ op$(OBJ_EXT) / /'` \
> - =A0 =A0 =A0 =A0 =A0 miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perl$(OBJ_E=
XT) $(libs)
> -- =A0 =A0 =A0$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MA=
KE) minitest
> -+ =A0 =A0 =A0mv -f miniperl miniperl-target
> -+ =A0 =A0 =A0ln -s hostperl miniperl
> -+# =A0 =A0 $(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE=
) minitest
> - !NO!SUBS!
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 next4*)
> -@@ -599,7 +601,9 @@
> - miniperl: $& miniperlmain$(OBJ_EXT) $(LIBPERL) opmini$(OBJ_EXT)
> - =A0 =A0 =A0 $(CC) -o miniperl `echo $(obj) | sed 's/ op$(OBJ_EXT) / /'`=
 \
> - =A0 =A0 =A0 =A0 =A0 miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) perl$(OBJ_E=
XT) $(libs)
> -- =A0 =A0 =A0$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MA=
KE) minitest
> -+ =A0 =A0 =A0mv -f miniperl miniperl-target
> -+ =A0 =A0 =A0ln -s hostperl miniperl
> -+# =A0 =A0 $(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE=
) minitest
> - !NO!SUBS!
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 darwin*)
> -@@ -620,7 +624,9 @@
> - =A0 =A0 =A0 -@rm -f miniperl.xok
> - =A0 =A0 =A0 $(CC) $(CLDFLAGS) $(NAMESPACEFLAGS) -o miniperl \
> - =A0 =A0 =A0 =A0 =A0 miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) $(LLIBPERL)=
 $(libs)
> -- =A0 =A0 =A0$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MA=
KE) minitest
> -+ =A0 =A0 =A0mv -f miniperl miniperl-target
> -+ =A0 =A0 =A0ln -s hostperl miniperl
> -+# =A0 =A0 $(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE=
) minitest
> - !NO!SUBS!
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 *)
> -@@ -629,7 +635,9 @@
> - =A0 =A0 =A0 -@rm -f miniperl.xok
> - =A0 =A0 =A0 $(LDLIBPTH) $(CC) $(CLDFLAGS) -o miniperl \
> - =A0 =A0 =A0 =A0 =A0 miniperlmain$(OBJ_EXT) opmini$(OBJ_EXT) $(LLIBPERL)=
 $(libs)
> -- =A0 =A0 =A0$(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MA=
KE) minitest
> -+ =A0 =A0 =A0mv -f miniperl miniperl-target
> -+ =A0 =A0 =A0ln -s hostperl miniperl
> -+# =A0 =A0 $(LDLIBPTH) ./miniperl -w -Ilib -MExporter -e '<?>' || $(MAKE=
) minitest
> - !NO!SUBS!
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ;;
> - =A0 =A0 =A0 esac
> -@@ -766,7 +774,7 @@
> - # We need to autosplit in two steps because VOS can't handle so many ar=
gs
> - #
> - .PHONY: preplibrary
> --preplibrary: miniperl$(EXE_EXT) $(CONFIGPM) lib/lib.pm $(PREPLIBRARY_LI=
BPERL)
> -+preplibrary: $(CONFIGPM) lib/lib.pm $(PREPLIBRARY_LIBPERL)
> - =A0 =A0 =A0 @sh ./makedir lib/auto
> - =A0 =A0 =A0 @echo " AutoSplitting perl library"
> - =A0 =A0 =A0 $(LDLIBPTH) ./miniperl -Ilib -e 'use AutoSplit; \
> -@@ -775,35 +783,35 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 autosplit_lib_modules(@ARGV)' lib/*/*.pm
> - =A0 =A0 =A0 $(MAKE) lib/re.pm
> -
> --lib/Config.pod: config.sh miniperl$(EXE_EXT) configpm Porting/Glossary
> -+lib/Config.pod: config.sh configpm Porting/Glossary
> - =A0 =A0 =A0 $(LDLIBPTH) ./miniperl -Ilib configpm --heavy=3Dlib/Config_=
heavy.pl lib/Config.pm
> -
> - $(CONFIGPM): lib/Config.pod
> -
> --lib/ExtUtils/Miniperl.pm: miniperlmain.c miniperl$(EXE_EXT) minimod.pl =
$(CONFIGPM)
> -+lib/ExtUtils/Miniperl.pm: miniperlmain.c minimod.pl $(CONFIGPM)
> - =A0 =A0 =A0 $(LDLIBPTH) ./miniperl minimod.pl > lib/ExtUtils/Miniperl.p=
m
> -
> - lib/re.pm: ext/re/re.pm
> - =A0 =A0 =A0 cp ext/re/re.pm lib/re.pm
> -
> --$(plextract): miniperl$(EXE_EXT) $(CONFIGPM) x2p/s2p
> -+$(plextract): $(CONFIGPM) x2p/s2p
> - =A0 =A0 =A0 @-rm -f $@
> - =A0 =A0 =A0 $(LDLIBPTH) ./miniperl -I`pwd`/lib $@.PL
> -
> --x2p/s2p: miniperl$(EXE_EXT) $(CONFIGPM) x2p/s2p.PL
> -+x2p/s2p: $(CONFIGPM) x2p/s2p.PL
> - =A0 =A0 =A0 cd x2p; $(LDLIBPTH) $(MAKE) s2p
> -
> --lib/lib.pm: =A0 miniperl$(EXE_EXT) $(CONFIGPM)
> -+lib/lib.pm: =A0 $(CONFIGPM)
> - =A0 =A0 =A0 @-rm -f $@
> - =A0 =A0 =A0 $(LDLIBPTH) ./miniperl -Ilib lib/lib_pm.PL
> -
> - unidatafiles $(unidatafiles): uni.data
> -
> --uni.data: miniperl$(EXE_EXT) $(CONFIGPM) lib/unicore/mktables
> -+uni.data: $(CONFIGPM) lib/unicore/mktables
> - =A0 =A0 =A0 cd lib/unicore && $(LDLIBPTH) ../../miniperl -I../../lib mk=
tables -w
> - =A0 =A0 =A0 touch uni.data
> -
> --extra.pods: miniperl$(EXE_EXT)
> -+extra.pods:
> - =A0 =A0 =A0 -@test -f extra.pods && rm -f `cat extra.pods`
> - =A0 =A0 =A0 -@rm -f extra.pods
> - =A0 =A0 =A0 -@for x in `grep -l '^=3D[a-z]' README.* | grep -v README.v=
ms` ; do \
> -@@ -850,18 +858,7 @@
> - INSTALL_DEPENDENCE =3D all
> -
> - install.perl: $(INSTALL_DEPENDENCE) installperl
> -- =A0 =A0 =A0if [ -n "$(COMPILE)" ]; \
> -- =A0 =A0 =A0then \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0cd utils; $(MAKE) compile; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ../x2p; $(MAKE) compile; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0cd ../pod; $(MAKE) compile; \
> -- =A0 =A0 =A0else :; \
> -- =A0 =A0 =A0fi
> -- =A0 =A0 =A0$(LDLIBPTH) ./perl installperl --destdir=3D$(DESTDIR) $(INS=
TALLFLAGS) $(STRIPFLAGS)
> -- =A0 =A0 =A0$(MAKE) extras.install
> --
> --install.man: =A0all installman
> -- =A0 =A0 =A0$(LDLIBPTH) ./perl installman --destdir=3D$(DESTDIR) $(INST=
ALLFLAGS)
> -+ =A0 =A0 =A0./hostperl -Ifake_config_library -Ilib -MConfig installperl=
 $(INSTALLFLAGS) $(STRIPFLAGS)
> -
> - # XXX Experimental. Hardwired values, but useful for testing.
> - # Eventually Configure could ask for some of these values.
> -@@ -978,16 +975,16 @@
> - #
> - # DynaLoader may be needed for extensions that use Makefile.PL.
> -
> --$(DYNALOADER): =A0 =A0 =A0 =A0miniperl$(EXE_EXT) preplibrary FORCE
> -+$(DYNALOADER): =A0 =A0 =A0 =A0preplibrary FORCE
> - =A0 =A0 =A0 @$(LDLIBPTH) sh ext/util/make_ext $(STATIC) $@ MAKE=3D$(MAK=
E) LIBPERL_A=3D$(LIBPERL)
> -
> --d_dummy $(dynamic_ext): =A0 =A0 =A0 miniperl$(EXE_EXT) preplibrary $(DY=
NALOADER) FORCE
> -+d_dummy $(dynamic_ext): =A0 =A0 =A0 preplibrary $(DYNALOADER) FORCE
> - =A0 =A0 =A0 @$(LDLIBPTH) sh ext/util/make_ext dynamic $@ MAKE=3D$(MAKE)=
 LIBPERL_A=3D$(LIBPERL)
> -
> --s_dummy $(static_ext): =A0 =A0 =A0 =A0miniperl$(EXE_EXT) preplibrary $(=
DYNALOADER) FORCE
> -+s_dummy $(static_ext): =A0 =A0 =A0 =A0preplibrary $(DYNALOADER) FORCE
> - =A0 =A0 =A0 @$(LDLIBPTH) sh ext/util/make_ext $(STATIC) $@ MAKE=3D$(MAK=
E) LIBPERL_A=3D$(LIBPERL)
> -
> --n_dummy $(nonxs_ext): miniperl$(EXE_EXT) preplibrary $(DYNALOADER) FORC=
E
> -+n_dummy $(nonxs_ext): preplibrary $(DYNALOADER) FORCE
> - =A0 =A0 =A0 @$(LDLIBPTH) sh ext/util/make_ext nonxs $@ MAKE=3D$(MAKE) L=
IBPERL_A=3D$(LIBPERL)
> -
> - .PHONY: clean _tidy _mopup _cleaner1 _cleaner2 \
> -@@ -1125,7 +1122,7 @@
> -
> - test_prep_pre: preplibrary utilities $(nonxs_ext)
> -
> --test_prep: test_prep_pre miniperl$(EXE_EXT) $(unidatafiles) perl$(EXE_E=
XT) $(dynamic_ext) $(TEST_PERL_DLL)
> -+test_prep: test_prep_pre $(unidatafiles) perl$(EXE_EXT) $(dynamic_ext) =
$(TEST_PERL_DLL)
> - =A0 =A0 =A0 PERL=3D./perl $(MAKE) _test_prep
> -
> - _test_tty:
> -@@ -1238,7 +1235,7 @@
> -
> - # Can't depend on lib/Config.pm because that might be where miniperl
> - # is crashing.
> --minitest: miniperl$(EXE_EXT) lib/re.pm minitest.prep
> -+minitest: lib/re.pm minitest.prep
> - =A0 =A0 =A0 - cd t && (rm -f perl$(EXE_EXT); $(LNS) ../miniperl$(EXE_EX=
T) perl$(EXE_EXT)) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 && $(LDLIBPTH) ./perl TEST -minitest base/*=
.t comp/*.t cmd/*.t run/*.t io/*.t op/*.t uni/*.t </dev/tty
> -
> diff --git a/recipes/perl/perl-5.8.8/Makefile.patch b/recipes/perl/perl-5=
.8.8/Makefile.patch
> deleted file mode 100644
> index ed494b3..0000000
> --- a/recipes/perl/perl-5.8.8/Makefile.patch
> +++ /dev/null
> @@ -1,61 +0,0 @@
> -Index: perl-5.8.8/Cross/Makefile
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/Cross/Makefile =A0 =A0 2004-01-12 21:44:01.000000000=
 +0100
> -+++ perl-5.8.8/Cross/Makefile =A02007-08-15 00:15:18.000000000 +0200
> -@@ -2,7 +2,8 @@
> - #
> - ## $Id: Makefile,v 1.7 2004/01/12 15:41:02 red Exp red $
> -
> --export TOPDIR=3D${shell pwd}
> -+override TOPDIR=3D${shell pwd}
> -+export TOPDIR
> - include $(TOPDIR)/config
> - export CFLAGS
> - export SYS=3D$(ARCH)-$(OS)
> -@@ -12,7 +13,7 @@
> -
> - export CC =3D $(CROSS)gcc
> - export CXX =3D $(CROSS)g++
> --export LD =3D $(CROSS)ld
> -+export LD =3D $(CC)
> - export STRIP =3D $(CROSS)strip
> - export AR =3D $(CROSS)ar
> - export RANLIB =3D $(CROSS)ranlib
> -@@ -34,21 +35,6 @@
> - all:
> - =A0 =A0 =A0 @echo Please read the README file before doing anything els=
e.
> -
> --gen_patch:
> -- =A0 =A0 =A0diff -Bbur ../Makefile.SH Makefile.SH > Makefile.SH.patch
> -- =A0 =A0 =A0diff -Bbur ../installperl installperl > installperl.patch
> --
> --patch:
> -- =A0 =A0 =A0cd .. ; if [ ! -e ./CROSS_PATCHED ] ; then \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0patch -p1 < Cross/Makefile.SH.patch; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0patch -p1 < Cross/installperl.patch ; mv in=
stallperl installperl-patched; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -e 's/XXSTRIPXX/$(SYS)/' installperl-pa=
tched > installperl; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0touch CROSS_PATCHED ; fi
> --
> --dry_patch:
> -- =A0 =A0 =A0cd .. ; patch --dry-run -p1 < Cross/Makefile.SH.patch; \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0patch --dry-run -p1 < Cross/installperl.pat=
ch; \
> --
> - perl:
> - =A0 =A0 =A0 @echo Perl cross-build directory is $(TOPDIR)
> - =A0 =A0 =A0 @echo Target arch is $(SYS)
> -@@ -58,11 +44,11 @@
> - =A0 =A0 =A0 $(TOPDIR)/generate_config_sh config.sh-$(SYS) > $(TOPDIR)/.=
./config.sh
> - =A0 =A0 =A0 cd $(TOPDIR)/.. ; ./Configure -S ; make depend ; make ; mak=
e more
> - =A0 =A0 =A0 cd $(TOPDIR)/.. ; mkdir -p fake_config_library ; cp lib/Con=
fig.pm fake_config_library
> -- =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more2 "PERLRUN=3D/usr/bin/perl -I=
$(TOPDIR)/../fake_config_library -MConfig"
> -- =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more3 "PERLRUN=3D/usr/bin/perl -I=
$(TOPDIR)/../fake_config_library -MConfig"
> -- =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more4 "PERLRUN=3D/usr/bin/perl -I=
$(TOPDIR)/../fake_config_library -MConfig"
> -+ =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more2 "PERLRUN=3Dhostperl -I$(TOP=
DIR)/../fake_config_library -MConfig"
> -+ =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more3 "PERLRUN=3Dhostperl -I$(TOP=
DIR)/../fake_config_library -MConfig"
> -+ =A0 =A0 =A0cd $(TOPDIR)/.. ; $(MAKE) more4 "PERLRUN=3Dhostperl -I$(TOP=
DIR)/../fake_config_library -MConfig"
> - =A0 =A0 =A0 cd $(TOPDIR)/.. ; rm -rf install_me_here
> -- =A0 =A0 =A0cd $(TOPDIR)/.. ; make install-strip
> -+# =A0 =A0 cd $(TOPDIR)/.. ; make install-strip
> - =A0 =A0 =A0 cd $(TOPDIR)/.. ; sh -x Cross/warp
> -
> -
> diff --git a/recipes/perl/perl-5.8.8/asm-pageh-fix.patch b/recipes/perl/p=
erl-5.8.8/asm-pageh-fix.patch
> deleted file mode 100644
> index 41f3b1d..0000000
> --- a/recipes/perl/perl-5.8.8/asm-pageh-fix.patch
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -Perl inclues asm/page.h in order to get the definition for getpagesize w=
hich
> -has been definied in unistd.h since glibc 2.1. Some recent version of li=
nux
> -libc headers removed the asm/page.h resulting in failures here for some
> -people.
> -
> -Index: perl-5.8.8/ext/IPC/SysV/SysV.xs
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/ext/IPC/SysV/SysV.xs =A0 =A0 =A0 2001-07-01 04:46:07=
.000000000 +1000
> -+++ perl-5.8.8/ext/IPC/SysV/SysV.xs =A0 =A02007-07-06 11:40:21.000000000=
 +1000
> -@@ -3,9 +3,6 @@
> - #include "XSUB.h"
> -
> - #include <sys/types.h>
> --#ifdef __linux__
> --# =A0 include <asm/page.h>
> --#endif
> - #if defined(HAS_MSG) || defined(HAS_SEM) || defined(HAS_SHM)
> - #ifndef HAS_SEM
> - # =A0 include <sys/ipc.h>
> diff --git a/recipes/perl/perl-5.8.8/config.sh b/recipes/perl/perl-5.8.8/=
config.sh
> deleted file mode 100644
> index ac8d237..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh
> +++ /dev/null
> @@ -1,1021 +0,0 @@
> -#!/bin/sh
> -#
> -# This file was produced by running the Configure script. It holds all t=
he
> -# definitions figured out by Configure. Should you modify one of these v=
alues,
> -# do not forget to propagate your changes by running "Configure -der". Y=
ou may
> -# instead choose to run each of the .SH files by yourself, or "Configure=
 -S".
> -#
> -
> -# Package name =A0 =A0 =A0: perl5
> -# Source directory =A0: .
> -# Configuration time: Thu Apr =A05 19:20:23 EST 2007
> -# Configured by =A0 =A0 : Open Embedded
> -# Target system =A0 =A0 : linux birgitte 2.6.21-rc5 #63 tue mar 27 14:41=
:54 est 2007 i686 gnulinux
> -
> -Author=3D''
> -Date=3D'$Date'
> -Header=3D''
> -Id=3D'$Id'
> -Locker=3D''
> -Log=3D'$Log'
> -Mcc=3D'Mcc'
> -RCSfile=3D'$RCSfile'
> -Revision=3D'$Revision'
> -Source=3D''
> -State=3D''
> -_a=3D'.a'
> -_exe=3D''
> -_o=3D'.o'
> -afs=3D'false'
> -afsroot=3D'/afs'
> -ansi2knr=3D''
> -aphostname=3D''
> -api_revision=3D'5'
> -api_subversion=3D'0'
> -api_version=3D'8'
> -api_versionstring=3D'5.8.0'
> -ar=3D'ar'
> -archlib=3D'/usr/lib/perl/5.8'
> -archlibexp=3D'/usr/lib/perl/5.8'
> -archname64=3D''
> -archname=3D'@ARCH@-thread-multi'
> -archobjs=3D''
> -asctime_r_proto=3D'REENTRANT_PROTO_B_SB'
> -awk=3D'awk'
> -baserev=3D'5.0'
> -bash=3D''
> -bin=3D'/usr/bin'
> -binexp=3D'/usr/bin'
> -bison=3D'bison'
> -byacc=3D'byacc'
> -c=3D''
> -castflags=3D'0'
> -cat=3D'cat'
> -cc=3D'gcc'
> -cccdlflags=3D'-fPIC'
> -ccdlflags=3D'-Wl,-E'
> -ccname=3D'gcc'
> -ccversion=3D''
> -cf_by=3D'Open Embedded'
> -cf_email=3D'Open Embedded@localhost.localdomain'
> -cf_time=3D'Thu Apr =A05 23:06:39 EST 2007'
> -charsize=3D'1'
> -chgrp=3D''
> -chmod=3D'chmod'
> -chown=3D''
> -clocktype=3D'clock_t'
> -comm=3D'comm'
> -compress=3D''
> -contains=3D'grep'
> -cp=3D'cp'
> -cpio=3D''
> -cpp=3D'cpp'
> -cpp_stuff=3D'42'
> -cpplast=3D'-'
> -cppminus=3D'-'
> -cpprun=3D'gcc -E'
> -cppstdin=3D'gcc -E'
> -crypt_r_proto=3D'REENTRANT_PROTO_B_CCS'
> -cryptlib=3D''
> -csh=3D'csh'
> -ctermid_r_proto=3D'0'
> -ctime_r_proto=3D'REENTRANT_PROTO_B_SB'
> -d_Gconvert=3D'gcvt((x),(n),(b))'
> -d_PRIEUldbl=3D'define'
> -d_PRIFUldbl=3D'define'
> -d_PRIGUldbl=3D'define'
> -d_PRIXU64=3D'define'
> -d_PRId64=3D'define'
> -d_PRIeldbl=3D'define'
> -d_PRIfldbl=3D'define'
> -d_PRIgldbl=3D'define'
> -d_PRIi64=3D'define'
> -d_PRIo64=3D'define'
> -d_PRIu64=3D'define'
> -d_PRIx64=3D'define'
> -d_SCNfldbl=3D'define'
> -d__fwalk=3D'undef'
> -d_access=3D'define'
> -d_accessx=3D'undef'
> -d_aintl=3D'undef'
> -d_alarm=3D'define'
> -d_archlib=3D'define'
> -d_asctime_r=3D'define'
> -d_atolf=3D'undef'
> -d_atoll=3D'define'
> -d_attribute_format=3D'define'
> -d_attribute_malloc=3D'define'
> -d_attribute_nonnull=3D'define'
> -d_attribute_noreturn=3D'define'
> -d_attribute_pure=3D'define'
> -d_attribute_unused=3D'define'
> -d_attribute_warn_unused_result=3D'undef'
> -d_bcmp=3D'define'
> -d_bcopy=3D'define'
> -d_bsd=3D'undef'
> -d_bsdgetpgrp=3D'undef'
> -d_bsdsetpgrp=3D'undef'
> -d_bzero=3D'define'
> -d_casti32=3D'undef'
> -d_castneg=3D'define'
> -d_charvspr=3D'define'
> -d_chown=3D'define'
> -d_chroot=3D'define'
> -d_chsize=3D'undef'
> -d_class=3D'undef'
> -d_clearenv=3D'define'
> -d_closedir=3D'define'
> -d_cmsghdr_s=3D'define'
> -d_const=3D'define'
> -d_copysignl=3D'define'
> -d_crypt=3D'define'
> -d_crypt_r=3D'define'
> -d_csh=3D'undef'
> -d_ctermid_r=3D'undef'
> -d_ctime_r=3D'define'
> -d_cuserid=3D'define'
> -d_dbl_dig=3D'define'
> -d_dbminitproto=3D'undef'
> -d_difftime=3D'define'
> -d_dirfd=3D'define'
> -d_dirnamlen=3D'undef'
> -d_dlerror=3D'define'
> -d_dlopen=3D'define'
> -d_dlsymun=3D'undef'
> -d_dosuid=3D'undef'
> -d_drand48_r=3D'define'
> -d_drand48proto=3D'define'
> -d_dup2=3D'define'
> -d_eaccess=3D'undef'
> -d_endgrent=3D'define'
> -d_endgrent_r=3D'undef'
> -d_endhent=3D'define'
> -d_endhostent_r=3D'undef'
> -d_endnent=3D'define'
> -d_endnetent_r=3D'undef'
> -d_endpent=3D'define'
> -d_endprotoent_r=3D'undef'
> -d_endpwent=3D'define'
> -d_endpwent_r=3D'undef'
> -d_endsent=3D'define'
> -d_endservent_r=3D'undef'
> -d_eofnblk=3D'define'
> -d_eunice=3D'undef'
> -d_faststdio=3D'undef'
> -d_fchdir=3D'define'
> -d_fchmod=3D'define'
> -d_fchown=3D'define'
> -d_fcntl=3D'define'
> -d_fcntl_can_lock=3D'define'
> -d_fd_macros=3D'define'
> -d_fd_set=3D'define'
> -d_fds_bits=3D'define'
> -d_fgetpos=3D'define'
> -d_finite=3D'define'
> -d_finitel=3D'define'
> -d_flexfnam=3D'define'
> -d_flock=3D'define'
> -d_flockproto=3D'define'
> -d_fork=3D'define'
> -d_fp_class=3D'undef'
> -d_fpathconf=3D'define'
> -d_fpclass=3D'undef'
> -d_fpclassify=3D'undef'
> -d_fpclassl=3D'undef'
> -d_fpos64_t=3D'undef'
> -d_frexpl=3D'define'
> -d_fs_data_s=3D'undef'
> -d_fseeko=3D'define'
> -d_fsetpos=3D'define'
> -d_fstatfs=3D'define'
> -d_fstatvfs=3D'define'
> -d_fsync=3D'define'
> -d_ftello=3D'define'
> -d_ftime=3D'undef'
> -d_futimes=3D'define'
> -d_getcwd=3D'define'
> -d_getespwnam=3D'undef'
> -d_getfsstat=3D'undef'
> -d_getgrent=3D'define'
> -d_getgrent_r=3D'define'
> -d_getgrgid_r=3D'define'
> -d_getgrnam_r=3D'define'
> -d_getgrps=3D'define'
> -d_gethbyaddr=3D'define'
> -d_gethbyname=3D'define'
> -d_gethent=3D'define'
> -d_gethname=3D'define'
> -d_gethostbyaddr_r=3D'define'
> -d_gethostbyname_r=3D'define'
> -d_gethostent_r=3D'define'
> -d_gethostprotos=3D'define'
> -d_getitimer=3D'define'
> -d_getlogin=3D'define'
> -d_getlogin_r=3D'define'
> -d_getmnt=3D'undef'
> -d_getmntent=3D'define'
> -d_getnbyaddr=3D'define'
> -d_getnbyname=3D'define'
> -d_getnent=3D'define'
> -d_getnetbyaddr_r=3D'define'
> -d_getnetbyname_r=3D'define'
> -d_getnetent_r=3D'define'
> -d_getnetprotos=3D'define'
> -d_getpagsz=3D'define'
> -d_getpbyname=3D'define'
> -d_getpbynumber=3D'define'
> -d_getpent=3D'define'
> -d_getpgid=3D'define'
> -d_getpgrp2=3D'undef'
> -d_getpgrp=3D'define'
> -d_getppid=3D'define'
> -d_getprior=3D'define'
> -d_getprotobyname_r=3D'define'
> -d_getprotobynumber_r=3D'define'
> -d_getprotoent_r=3D'define'
> -d_getprotoprotos=3D'define'
> -d_getprpwnam=3D'undef'
> -d_getpwent=3D'define'
> -d_getpwent_r=3D'define'
> -d_getpwnam_r=3D'define'
> -d_getpwuid_r=3D'define'
> -d_getsbyname=3D'define'
> -d_getsbyport=3D'define'
> -d_getsent=3D'define'
> -d_getservbyname_r=3D'define'
> -d_getservbyport_r=3D'define'
> -d_getservent_r=3D'define'
> -d_getservprotos=3D'define'
> -d_getspnam=3D'define'
> -d_getspnam_r=3D'undef'
> -d_gettimeod=3D'define'
> -d_gmtime_r=3D'define'
> -d_gnulibc=3D'define'
> -d_grpasswd=3D'define'
> -d_hasmntopt=3D'define'
> -d_htonl=3D'define'
> -d_ilogbl=3D'define'
> -d_index=3D'undef'
> -d_inetaton=3D'define'
> -d_int64_t=3D'define'
> -d_isascii=3D'define'
> -d_isfinite=3D'undef'
> -d_isinf=3D'define'
> -d_isnan=3D'define'
> -d_isnanl=3D'define'
> -d_killpg=3D'define'
> -d_lchown=3D'define'
> -d_ldbl_dig=3D'define'
> -d_libm_lib_version=3D'define'
> -d_link=3D'define'
> -d_localtime_r=3D'define'
> -d_locconv=3D'define'
> -d_lockf=3D'define'
> -d_longdbl=3D'define'
> -d_longlong=3D'define'
> -d_lseekproto=3D'define'
> -d_lstat=3D'define'
> -d_madvise=3D'define'
> -d_malloc_good_size=3D'undef'
> -d_malloc_size=3D'undef'
> -d_mblen=3D'define'
> -d_mbstowcs=3D'define'
> -d_mbtowc=3D'define'
> -d_memchr=3D'define'
> -d_memcmp=3D'define'
> -d_memcpy=3D'define'
> -d_memmove=3D'define'
> -d_memset=3D'define'
> -d_mkdir=3D'define'
> -d_mkdtemp=3D'define'
> -d_mkfifo=3D'define'
> -d_mkstemp=3D'define'
> -d_mkstemps=3D'undef'
> -d_mktime=3D'define'
> -d_mmap=3D'define'
> -d_modfl=3D'define'
> -d_modfl_pow32_bug=3D'undef'
> -d_modflproto=3D'define'
> -d_mprotect=3D'define'
> -d_msg=3D'define'
> -d_msg_ctrunc=3D'define'
> -d_msg_dontroute=3D'define'
> -d_msg_oob=3D'define'
> -d_msg_peek=3D'define'
> -d_msg_proxy=3D'define'
> -d_msgctl=3D'define'
> -d_msgget=3D'define'
> -d_msghdr_s=3D'define'
> -d_msgrcv=3D'define'
> -d_msgsnd=3D'define'
> -d_msync=3D'define'
> -d_munmap=3D'define'
> -d_mymalloc=3D'undef'
> -d_nice=3D'define'
> -d_nl_langinfo=3D'define'
> -d_nv_zero_is_allbits_zero=3D'define'
> -d_off64_t=3D'define'
> -d_old_pthread_create_joinable=3D'undef'
> -d_oldpthreads=3D'undef'
> -d_oldsock=3D'undef'
> -d_open3=3D'define'
> -d_pathconf=3D'define'
> -d_pause=3D'define'
> -d_perl_otherlibdirs=3D'define'
> -d_phostname=3D'undef'
> -d_pipe=3D'define'
> -d_poll=3D'define'
> -d_portable=3D'define'
> -d_procselfexe=3D'define'
> -d_pthread_atfork=3D'define'
> -d_pthread_attr_setscope=3D'define'
> -d_pthread_yield=3D'define'
> -d_pwage=3D'undef'
> -d_pwchange=3D'undef'
> -d_pwclass=3D'undef'
> -d_pwcomment=3D'undef'
> -d_pwexpire=3D'undef'
> -d_pwgecos=3D'define'
> -d_pwpasswd=3D'define'
> -d_pwquota=3D'undef'
> -d_qgcvt=3D'define'
> -d_quad=3D'define'
> -d_random_r=3D'define'
> -d_readdir64_r=3D'define'
> -d_readdir=3D'define'
> -d_readdir_r=3D'define'
> -d_readlink=3D'define'
> -d_readv=3D'define'
> -d_recvmsg=3D'define'
> -d_rename=3D'define'
> -d_rewinddir=3D'define'
> -d_rmdir=3D'define'
> -d_safebcpy=3D'undef'
> -d_safemcpy=3D'undef'
> -d_sanemcmp=3D'define'
> -d_sbrkproto=3D'define'
> -d_scalbnl=3D'define'
> -d_sched_yield=3D'define'
> -d_scm_rights=3D'define'
> -d_seekdir=3D'define'
> -d_select=3D'define'
> -d_sem=3D'define'
> -d_semctl=3D'define'
> -d_semctl_semid_ds=3D'define'
> -d_semctl_semun=3D'define'
> -d_semget=3D'define'
> -d_semop=3D'define'
> -d_sendmsg=3D'define'
> -d_setegid=3D'define'
> -d_seteuid=3D'define'
> -d_setgrent=3D'define'
> -d_setgrent_r=3D'undef'
> -d_setgrps=3D'define'
> -d_sethent=3D'define'
> -d_sethostent_r=3D'undef'
> -d_setitimer=3D'define'
> -d_setlinebuf=3D'define'
> -d_setlocale=3D'define'
> -d_setlocale_r=3D'undef'
> -d_setnent=3D'define'
> -d_setnetent_r=3D'undef'
> -d_setpent=3D'define'
> -d_setpgid=3D'define'
> -d_setpgrp2=3D'undef'
> -d_setpgrp=3D'define'
> -d_setprior=3D'define'
> -d_setproctitle=3D'undef'
> -d_setprotoent_r=3D'undef'
> -d_setpwent=3D'define'
> -d_setpwent_r=3D'undef'
> -d_setregid=3D'define'
> -d_setresgid=3D'define'
> -d_setresuid=3D'define'
> -d_setreuid=3D'define'
> -d_setrgid=3D'undef'
> -d_setruid=3D'undef'
> -d_setsent=3D'define'
> -d_setservent_r=3D'undef'
> -d_setsid=3D'define'
> -d_setvbuf=3D'define'
> -d_sfio=3D'undef'
> -d_shm=3D'define'
> -d_shmat=3D'define'
> -d_shmatprototype=3D'define'
> -d_shmctl=3D'define'
> -d_shmdt=3D'define'
> -d_shmget=3D'define'
> -d_sigaction=3D'define'
> -d_sigprocmask=3D'define'
> -d_sigsetjmp=3D'define'
> -d_sockatmark=3D'define'
> -d_sockatmarkproto=3D'define'
> -d_socket=3D'define'
> -d_socklen_t=3D'define'
> -d_sockpair=3D'define'
> -d_socks5_init=3D'undef'
> -d_sprintf_returns_strlen=3D'define'
> -d_sqrtl=3D'define'
> -d_srand48_r=3D'define'
> -d_srandom_r=3D'define'
> -d_sresgproto=3D'define'
> -d_sresuproto=3D'define'
> -d_statblks=3D'define'
> -d_statfs_f_flags=3D'undef'
> -d_statfs_s=3D'define'
> -d_statvfs=3D'define'
> -d_stdio_cnt_lval=3D'undef'
> -d_stdio_ptr_lval=3D'undef'
> -d_stdio_ptr_lval_nochange_cnt=3D'undef'
> -d_stdio_ptr_lval_sets_cnt=3D'undef'
> -d_stdio_stream_array=3D'undef'
> -d_stdiobase=3D'undef'
> -d_stdstdio=3D'undef'
> -d_strchr=3D'define'
> -d_strcoll=3D'define'
> -d_strctcpy=3D'define'
> -d_strerrm=3D'strerror(e)'
> -d_strerror=3D'define'
> -d_strerror_r=3D'define'
> -d_strftime=3D'define'
> -d_strlcat=3D'undef'
> -d_strlcpy=3D'undef'
> -d_strtod=3D'define'
> -d_strtol=3D'define'
> -d_strtold=3D'define'
> -d_strtoll=3D'define'
> -d_strtoq=3D'define'
> -d_strtoul=3D'define'
> -d_strtoull=3D'define'
> -d_strtouq=3D'define'
> -d_strxfrm=3D'define'
> -d_suidsafe=3D'undef'
> -d_symlink=3D'define'
> -d_syscall=3D'define'
> -d_syscallproto=3D'define'
> -d_sysconf=3D'define'
> -d_sysernlst=3D''
> -d_syserrlst=3D'define'
> -d_system=3D'define'
> -d_tcgetpgrp=3D'define'
> -d_tcsetpgrp=3D'define'
> -d_telldir=3D'define'
> -d_telldirproto=3D'define'
> -d_time=3D'define'
> -d_times=3D'define'
> -d_tm_tm_gmtoff=3D'define'
> -d_tm_tm_zone=3D'define'
> -d_tmpnam_r=3D'define'
> -d_truncate=3D'define'
> -d_ttyname_r=3D'define'
> -d_tzname=3D'define'
> -d_ualarm=3D'define'
> -d_umask=3D'define'
> -d_uname=3D'define'
> -d_union_semun=3D'undef'
> -d_unordered=3D'undef'
> -d_unsetenv=3D'define'
> -d_usleep=3D'define'
> -d_usleepproto=3D'define'
> -d_ustat=3D'define'
> -d_vendorarch=3D'define'
> -d_vendorbin=3D'define'
> -d_vendorlib=3D'define'
> -d_vendorscript=3D'define'
> -d_vfork=3D'undef'
> -d_void_closedir=3D'undef'
> -d_voidsig=3D'define'
> -d_voidtty=3D''
> -d_volatile=3D'define'
> -d_vprintf=3D'define'
> -d_wait4=3D'define'
> -d_waitpid=3D'define'
> -d_wcstombs=3D'define'
> -d_wctomb=3D'define'
> -d_writev=3D'define'
> -d_xenix=3D'undef'
> -date=3D'date'
> -db_hashtype=3D'u_int32_t'
> -db_prefixtype=3D'size_t'
> -db_version_major=3D''
> -db_version_minor=3D''
> -db_version_patch=3D''
> -defvoidused=3D'15'
> -direntrytype=3D'struct dirent'
> -dlext=3D'so'
> -dlsrc=3D'dl_dlopen.xs'
> -doublesize=3D'8'
> -drand01=3D'drand48()'
> -drand48_r_proto=3D'REENTRANT_PROTO_I_ST'
> -dynamic_ext=3D'attrs B ByteLoader Cwd Data/Dumper Devel/DProf Devel/Peek=
 Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Call I18N/Langi=
nfo IO IPC/SysV List/Util MIME/Base64 Opcode PerlIO/encoding PerlIO/scalar =
PerlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog threa=
ds Time/HiRes Unicode/Normalize XS/APItest XS/Typemap threads/shared'
> -eagain=3D'EAGAIN'
> -ebcdic=3D'undef'
> -echo=3D'echo'
> -egrep=3D'egrep'
> -emacs=3D''
> -endgrent_r_proto=3D'0'
> -endhostent_r_proto=3D'0'
> -endnetent_r_proto=3D'0'
> -endprotoent_r_proto=3D'0'
> -endpwent_r_proto=3D'0'
> -endservent_r_proto=3D'0'
> -eunicefix=3D':'
> -exe_ext=3D''
> -expr=3D'expr'
> -extensions=3D'attrs B ByteLoader Cwd Data/Dumper Devel/DProf Devel/Peek =
Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Call I18N/Langin=
fo IO IPC/SysV List/Util MIME/Base64 Opcode PerlIO/encoding PerlIO/scalar P=
erlIO/via POSIX re SDBM_File Socket Storable Sys/Hostname Sys/Syslog thread=
s Time/HiRes Unicode/Normalize XS/APItest XS/Typemap threads/shared Errno'
> -extras=3D''
> -fflushNULL=3D'define'
> -fflushall=3D'undef'
> -find=3D''
> -firstmakefile=3D'makefile'
> -flex=3D''
> -fpossize=3D'16'
> -fpostype=3D'fpos_t'
> -freetype=3D'void'
> -from=3D':'
> -full_ar=3D'/usr/bin/ar'
> -full_csh=3D'/bin/csh'
> -full_sed=3D'/bin/sed'
> -gccansipedantic=3D''
> -gccosandvers=3D''
> -getgrent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
> -getgrgid_r_proto=3D'REENTRANT_PROTO_I_TSBWR'
> -getgrnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
> -gethostbyaddr_r_proto=3D'REENTRANT_PROTO_I_TsISBWRE'
> -gethostbyname_r_proto=3D'REENTRANT_PROTO_I_CSBWRE'
> -gethostent_r_proto=3D'REENTRANT_PROTO_I_SBWRE'
> -getlogin_r_proto=3D'REENTRANT_PROTO_I_BW'
> -getnetbyaddr_r_proto=3D'REENTRANT_PROTO_I_uISBWRE'
> -getnetbyname_r_proto=3D'REENTRANT_PROTO_I_CSBWRE'
> -getnetent_r_proto=3D'REENTRANT_PROTO_I_SBWRE'
> -getprotobyname_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
> -getprotobynumber_r_proto=3D'REENTRANT_PROTO_I_ISBWR'
> -getprotoent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
> -getpwent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
> -getpwnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
> -getpwuid_r_proto=3D'REENTRANT_PROTO_I_TSBWR'
> -getservbyname_r_proto=3D'REENTRANT_PROTO_I_CCSBWR'
> -getservbyport_r_proto=3D'REENTRANT_PROTO_I_ICSBWR'
> -getservent_r_proto=3D'REENTRANT_PROTO_I_SBWR'
> -gidsign=3D'1'
> -gidsize=3D'4'
> -gidtype=3D'gid_t'
> -glibpth=3D'/usr/shlib =A0/lib /usr/lib /usr/lib/386 /lib/386 /usr/ccs/li=
b /usr/ucblib /usr/local/lib '
> -gmake=3D'gmake'
> -gmtime_r_proto=3D'REENTRANT_PROTO_S_TS'
> -grep=3D'grep'
> -groupcat=3D'cat /etc/group'
> -groupstype=3D'gid_t'
> -gzip=3D'gzip'
> -h_fcntl=3D'false'
> -h_sysfile=3D'true'
> -hint=3D'recommended'
> -hostcat=3D'cat /etc/hosts'
> -html1dir=3D' '
> -html1direxp=3D''
> -html3dir=3D' '
> -html3direxp=3D''
> -i16size=3D'2'
> -i16type=3D'short'
> -i32size=3D'4'
> -i64size=3D'8'
> -i8size=3D'1'
> -i8type=3D'char'
> -i_arpainet=3D'define'
> -i_bsdioctl=3D''
> -i_crypt=3D'define'
> -i_db=3D'undef'
> -i_dbm=3D'undef'
> -i_dirent=3D'define'
> -i_dld=3D'undef'
> -i_dlfcn=3D'define'
> -i_fcntl=3D'undef'
> -i_float=3D'define'
> -i_fp=3D'undef'
> -i_fp_class=3D'undef'
> -i_gdbm=3D'undef'
> -i_grp=3D'define'
> -i_ieeefp=3D'undef'
> -i_inttypes=3D'define'
> -i_langinfo=3D'define'
> -i_libutil=3D'undef'
> -i_limits=3D'define'
> -i_locale=3D'define'
> -i_machcthr=3D'undef'
> -i_malloc=3D'define'
> -i_math=3D'define'
> -i_memory=3D'undef'
> -i_mntent=3D'define'
> -i_ndbm=3D'undef'
> -i_netdb=3D'define'
> -i_neterrno=3D'undef'
> -i_netinettcp=3D'define'
> -i_niin=3D'define'
> -i_poll=3D'define'
> -i_prot=3D'undef'
> -i_pthread=3D'define'
> -i_pwd=3D'define'
> -i_rpcsvcdbm=3D'undef'
> -i_sfio=3D'undef'
> -i_sgtty=3D'undef'
> -i_shadow=3D'define'
> -i_socks=3D'undef'
> -i_stdarg=3D'define'
> -i_stddef=3D'define'
> -i_stdlib=3D'define'
> -i_string=3D'define'
> -i_sunmath=3D'undef'
> -i_sysaccess=3D'undef'
> -i_sysdir=3D'define'
> -i_sysfile=3D'define'
> -i_sysfilio=3D'undef'
> -i_sysin=3D'undef'
> -i_sysioctl=3D'define'
> -i_syslog=3D'define'
> -i_sysmman=3D'define'
> -i_sysmode=3D'undef'
> -i_sysmount=3D'define'
> -i_sysndir=3D'undef'
> -i_sysparam=3D'define'
> -i_sysresrc=3D'define'
> -i_syssecrt=3D'undef'
> -i_sysselct=3D'define'
> -i_syssockio=3D'undef'
> -i_sysstat=3D'define'
> -i_sysstatfs=3D'define'
> -i_sysstatvfs=3D'define'
> -i_systime=3D'define'
> -i_systimek=3D'undef'
> -i_systimes=3D'define'
> -i_systypes=3D'define'
> -i_sysuio=3D'define'
> -i_sysun=3D'define'
> -i_sysutsname=3D'define'
> -i_sysvfs=3D'define'
> -i_syswait=3D'define'
> -i_termio=3D'undef'
> -i_termios=3D'define'
> -i_time=3D'define'
> -i_unistd=3D'define'
> -i_ustat=3D'define'
> -i_utime=3D'define'
> -i_values=3D'define'
> -i_varargs=3D'undef'
> -i_varhdr=3D'stdarg.h'
> -i_vfork=3D'undef'
> -ignore_versioned_solibs=3D'y'
> -inc_version_list=3D' '
> -inc_version_list_init=3D'0'
> -incpath=3D''
> -inews=3D''
> -installarchlib=3D'@DESTDIR@/usr/lib/perl/5.8'
> -installbin=3D'@DESTDIR@/usr/bin'
> -installhtml1dir=3D''
> -installhtml3dir=3D''
> -installman1dir=3D'@DESTDIR@/usr/share/man/man1'
> -installman3dir=3D'@DESTDIR@/usr/share/man/man3'
> -installprefix=3D'@DESTDIR@/usr'
> -installprefixexp=3D'@DESTDIR@/usr'
> -installprivlib=3D'@DESTDIR@/usr/share/perl/5.8'
> -installscript=3D'@DESTDIR@/usr/bin'
> -installsitearch=3D'@DESTDIR@/usr/local/lib/perl/5.8.8'
> -installsitebin=3D'@DESTDIR@/usr/local/bin'
> -installsitehtml1dir=3D''
> -installsitehtml3dir=3D''
> -installsitelib=3D'@DESTDIR@/usr/local/share/perl/5.8.8'
> -installsiteman1dir=3D'@DESTDIR@/usr/local/man/man1'
> -installsiteman3dir=3D'@DESTDIR@/usr/local/man/man3'
> -installsitescript=3D'@DESTDIR@/usr/local/bin'
> -installstyle=3D'lib/perl5'
> -installusrbinperl=3D'define'
> -installvendorarch=3D'@DESTDIR@/usr/lib/perl5'
> -installvendorbin=3D'@DESTDIR@/usr/bin'
> -installvendorhtml1dir=3D''
> -installvendorhtml3dir=3D''
> -installvendorlib=3D'@DESTDIR@/usr/share/perl5'
> -installvendorman1dir=3D'@DESTDIR@/usr/share/man/man1'
> -installvendorman3dir=3D'@DESTDIR@/usr/share/man/man3'
> -installvendorscript=3D'@DESTDIR@/usr/bin'
> -intsize=3D'4'
> -issymlink=3D'test -h'
> -ivdformat=3D'"ld"'
> -ivtype=3D'long'
> -known_extensions=3D'attrs B ByteLoader Cwd Data/Dumper DB_File Devel/DPr=
of Devel/Peek Devel/PPPort Digest/MD5 Encode Fcntl File/Glob Filter/Util/Ca=
ll GDBM_File I18N/Langinfo IO IPC/SysV List/Util MIME/Base64 NDBM_File ODBM=
_File Opcode PerlIO/encoding PerlIO/scalar PerlIO/via POSIX re SDBM_File So=
cket Storable Sys/Hostname Sys/Syslog Thread threads Time/HiRes Unicode/Nor=
malize XS/APItest XS/Typemap threads/shared'
> -ksh=3D''
> -ld=3D'gcc'
> -lddlflags=3D'-shared -L/usr/local/lib'
> -ldflags=3D' -L/usr/local/lib'
> -ldflags_uselargefiles=3D''
> -ldlibpthname=3D'LD_LIBRARY_PATH'
> -less=3D'less'
> -lib_ext=3D'.a'
> -libperl=3D'libperl.so'
> -libpth=3D'/usr/local/lib /lib /usr/lib'
> -line=3D''
> -lint=3D''
> -lkflags=3D''
> -ln=3D'ln'
> -lns=3D'/bin/ln -s'
> -localtime_r_proto=3D'REENTRANT_PROTO_S_TS'
> -locincpth=3D'/usr/local/include /opt/local/include /usr/gnu/include /opt=
/gnu/include /usr/GNU/include /opt/GNU/include'
> -loclibpth=3D'/usr/local/lib /opt/local/lib /usr/gnu/lib /opt/gnu/lib /us=
r/GNU/lib /opt/GNU/lib'
> -longlongsize=3D'8'
> -lp=3D''
> -lpr=3D''
> -ls=3D'ls'
> -lseeksize=3D'8'
> -lseektype=3D'off_t'
> -mail=3D''
> -mailx=3D''
> -make=3D'make'
> -make_set_make=3D'#'
> -mallocobj=3D''
> -mallocsrc=3D''
> -malloctype=3D'void *'
> -man1dir=3D'/usr/share/man/man1'
> -man1direxp=3D'/usr/share/man/man1'
> -man1ext=3D'1'
> -man3dir=3D'/usr/share/man/man3'
> -man3direxp=3D'/usr/share/man/man3'
> -man3ext=3D'3pm'
> -mips_type=3D''
> -mistrustnm=3D''
> -mkdir=3D'mkdir'
> -mmaptype=3D'void *'
> -modetype=3D'mode_t'
> -more=3D'more'
> -multiarch=3D'undef'
> -mv=3D''
> -myarchname=3D'@ARCH@'
> -mydomain=3D'.localdomain'
> -myhostname=3D'localhost'
> -n=3D'-n'
> -need_va_copy=3D'undef'
> -netdb_hlen_type=3D'size_t'
> -netdb_host_type=3D'const void *'
> -netdb_name_type=3D'const char *'
> -netdb_net_type=3D'in_addr_t'
> -nm=3D'nm'
> -nm_opt=3D''
> -nm_so_opt=3D'--dynamic'
> -nonxs_ext=3D'Errno'
> -nroff=3D'nroff'
> -nvEUformat=3D'"E"'
> -nvFUformat=3D'"F"'
> -nvGUformat=3D'"G"'
> -nveformat=3D'"e"'
> -nvfformat=3D'"f"'
> -nvgformat=3D'"g"'
> -nvsize=3D'8'
> -nvtype=3D'double'
> -o_nonblock=3D'O_NONBLOCK'
> -obj_ext=3D'.o'
> -old_pthread_create_joinable=3D''
> -optimize=3D'-O2'
> -orderlib=3D'false'
> -osname=3D'linux'
> -otherlibdirs=3D' '
> -package=3D'perl5'
> -pager=3D'/usr/bin/less -isr'
> -passcat=3D'cat /etc/passwd'
> -patchlevel=3D'8'
> -path_sep=3D':'
> -perl5=3D'hostperl'
> -perl=3D''
> -perl_patchlevel=3D''
> -perladmin=3D'root@localhost'
> -perllibs=3D'-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
> -perlpath=3D'hostperl'
> -pg=3D'pg'
> -phostname=3D''
> -pidtype=3D'pid_t'
> -plibpth=3D''
> -pmake=3D''
> -pr=3D''
> -prefix=3D'/usr'
> -prefixexp=3D'/usr'
> -privlib=3D'/usr/share/perl/5.8'
> -privlibexp=3D'/usr/share/perl/5.8'
> -procselfexe=3D'"/proc/self/exe"'
> -prototype=3D'define'
> -randbits=3D'48'
> -randfunc=3D'drand48'
> -random_r_proto=3D'REENTRANT_PROTO_I_St'
> -randseedtype=3D'long'
> -ranlib=3D':'
> -rd_nodata=3D'-1'
> -readdir64_r_proto=3D'REENTRANT_PROTO_I_TSR'
> -readdir_r_proto=3D'REENTRANT_PROTO_I_TSR'
> -revision=3D'5'
> -rm=3D'rm'
> -rmail=3D''
> -run=3D''
> -runnm=3D'false'
> -sPRIEUldbl=3D'"LE"'
> -sPRIFUldbl=3D'"LF"'
> -sPRIGUldbl=3D'"LG"'
> -sPRIeldbl=3D'"Le"'
> -sPRIfldbl=3D'"Lf"'
> -sPRIgldbl=3D'"Lg"'
> -sSCNfldbl=3D'"Lf"'
> -sched_yield=3D'sched_yield()'
> -scriptdir=3D'/usr/bin'
> -scriptdirexp=3D'/usr/bin'
> -sed=3D'sed'
> -seedfunc=3D'srand48'
> -selecttype=3D'fd_set *'
> -sendmail=3D''
> -setgrent_r_proto=3D'0'
> -sethostent_r_proto=3D'0'
> -setlocale_r_proto=3D'0'
> -setnetent_r_proto=3D'0'
> -setprotoent_r_proto=3D'0'
> -setpwent_r_proto=3D'0'
> -setservent_r_proto=3D'0'
> -sh=3D'/bin/sh'
> -shar=3D''
> -sharpbang=3D'#!'
> -shmattype=3D'void *'
> -shortsize=3D'2'
> -shrpenv=3D''
> -shsharp=3D'true'
> -sig_count=3D'65'
> -sig_num=3D'0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23=
 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48=
 49 50 51 52 53 54 55 56 57 58 59 60 61 62 63 64 6 17 29 31 '
> -sig_num_init=3D'0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16=
, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 3=
5, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, =
54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 6, 17, 29, 31, 0'
> -sig_size=3D'69'
> -sig_name=3D'ZERO HUP INT QUIT ILL TRAP ABRT BUS FPE KILL USR1 SEGV USR2 =
PIPE ALRM TERM STKFLT CHLD CONT STOP TSTP TTIN TTOU URG XCPU XFSZ VTALRM PR=
OF WINCH IO PWR SYS NUM32 NUM33 RTMIN NUM35 NUM36 NUM37 NUM38 NUM39 NUM40 N=
UM41 NUM42 NUM43 NUM44 NUM45 NUM46 NUM47 NUM48 NUM49 NUM50 NUM51 NUM52 NUM5=
3 NUM54 NUM55 NUM56 NUM57 NUM58 NUM59 NUM60 NUM61 NUM62 NUM63 RTMAX IOT CLD=
 POLL UNUSED '
> -sig_name_init=3D'"ZERO", "HUP", "INT", "QUIT", "ILL", "TRAP", "ABRT", "B=
US", "FPE", "KILL", "USR1", "SEGV", "USR2", "PIPE", "ALRM", "TERM", "STKFLT=
", "CHLD", "CONT", "STOP", "TSTP", "TTIN", "TTOU", "URG", "XCPU", "XFSZ", "=
VTALRM", "PROF", "WINCH", "IO", "PWR", "SYS", "NUM32", "NUM33", "RTMIN", "N=
UM35", "NUM36", "NUM37", "NUM38", "NUM39", "NUM40", "NUM41", "NUM42", "NUM4=
3", "NUM44", "NUM45", "NUM46", "NUM47", "NUM48", "NUM49", "NUM50", "NUM51",=
 "NUM52", "NUM53", "NUM54", "NUM55", "NUM56", "NUM57", "NUM58", "NUM59", "N=
UM60", "NUM61", "NUM62", "NUM63", "RTMAX", "IOT", "CLD", "POLL", "UNUSED", =
0'
> -signal_t=3D'void'
> -sitearch=3D'/usr/local/lib/perl/5.8.8'
> -sitearchexp=3D'/usr/local/lib/perl/5.8.8'
> -sitebin=3D'/usr/local/bin'
> -sitebinexp=3D'/usr/local/bin'
> -sitehtml1dir=3D''
> -sitehtml1direxp=3D''
> -sitehtml3dir=3D''
> -sitehtml3direxp=3D''
> -sitelib=3D'/usr/local/share/perl/5.8.8'
> -sitelib_stem=3D''
> -sitelibexp=3D'/usr/local/share/perl/5.8.8'
> -siteman1dir=3D'/usr/local/man/man1'
> -siteman1direxp=3D'/usr/local/man/man1'
> -siteman3dir=3D'/usr/local/man/man3'
> -siteman3direxp=3D'/usr/local/man/man3'
> -siteprefix=3D'/usr/local'
> -siteprefixexp=3D'/usr/local'
> -sitescript=3D'/usr/local/bin'
> -sitescriptexp=3D'/usr/local/bin'
> -sizetype=3D'size_t'
> -sleep=3D''
> -smail=3D''
> -so=3D'so'
> -sockethdr=3D''
> -socketlib=3D''
> -socksizetype=3D'socklen_t'
> -sort=3D'sort'
> -spackage=3D'Perl5'
> -spitshell=3D'cat'
> -srand48_r_proto=3D'REENTRANT_PROTO_I_LS'
> -srandom_r_proto=3D'REENTRANT_PROTO_I_TS'
> -src=3D'.'
> -ssizetype=3D'ssize_t'
> -startperl=3D'#!/usr/bin/perl'
> -startsh=3D'#!/bin/sh'
> -static_ext=3D' '
> -stdchar=3D'char'
> -stdio_base=3D'((fp)->_IO_read_base)'
> -stdio_bufsiz=3D'((fp)->_IO_read_end - (fp)->_IO_read_base)'
> -stdio_cnt=3D'((fp)->_IO_read_end - (fp)->_IO_read_ptr)'
> -stdio_filbuf=3D''
> -stdio_ptr=3D'((fp)->_IO_read_ptr)'
> -stdio_stream_array=3D''
> -strerror_r_proto=3D'REENTRANT_PROTO_B_IBW'
> -strings=3D'/usr/include/string.h'
> -submit=3D''
> -subversion=3D'8'
> -sysman=3D'/usr/share/man/man1'
> -tail=3D''
> -tar=3D''
> -targetarch=3D''
> -tbl=3D''
> -tee=3D''
> -test=3D'test'
> -timeincl=3D'/usr/include/sys/time.h /usr/include/time.h '
> -timetype=3D'time_t'
> -tmpnam_r_proto=3D'REENTRANT_PROTO_B_B'
> -to=3D':'
> -touch=3D'touch'
> -tr=3D'tr'
> -trnl=3D'\n'
> -troff=3D''
> -ttyname_r_proto=3D'REENTRANT_PROTO_I_IBW'
> -u16size=3D'2'
> -u16type=3D'unsigned short'
> -u32size=3D'4'
> -u64size=3D'8'
> -u8size=3D'1'
> -u8type=3D'unsigned char'
> -uidsign=3D'1'
> -uidsize=3D'4'
> -uidtype=3D'uid_t'
> -uname=3D'uname'
> -uniq=3D'uniq'
> -use5005threads=3D'undef'
> -usecrosscompile=3D'undef'
> -usedl=3D'define'
> -usefaststdio=3D'define'
> -useithreads=3D'define'
> -uselargefiles=3D'define'
> -uselongdouble=3D'undef'
> -usemallocwrap=3D'define'
> -usemorebits=3D'undef'
> -usemultiplicity=3D'define'
> -usemymalloc=3D'n'
> -usenm=3D'false'
> -useopcode=3D'true'
> -useperlio=3D'define'
> -useposix=3D'true'
> -usereentrant=3D'undef'
> -usesfio=3D'false'
> -useshrplib=3D'true'
> -usesitecustomize=3D'undef'
> -usesocks=3D'undef'
> -usethreads=3D'define'
> -usevendorprefix=3D'define'
> -usevfork=3D'false'
> -usrinc=3D'/usr/include'
> -uuname=3D''
> -uvXUformat=3D'"lX"'
> -uvoformat=3D'"lo"'
> -uvtype=3D'unsigned long'
> -uvuformat=3D'"lu"'
> -uvxformat=3D'"lx"'
> -vendorarch=3D'/usr/lib/perl5'
> -vendorarchexp=3D'/usr/lib/perl5'
> -vendorbin=3D'/usr/bin'
> -vendorbinexp=3D'/usr/bin'
> -vendorhtml1dir=3D' '
> -vendorhtml1direxp=3D''
> -vendorhtml3dir=3D' '
> -vendorhtml3direxp=3D''
> -vendorlib=3D'/usr/share/perl5'
> -vendorlib_stem=3D''
> -vendorlibexp=3D'/usr/share/perl5'
> -vendorman1dir=3D'/usr/share/man/man1'
> -vendorman1direxp=3D'/usr/share/man/man1'
> -vendorman3dir=3D'/usr/share/man/man3'
> -vendorman3direxp=3D'/usr/share/man/man3'
> -vendorprefix=3D'/usr'
> -vendorprefixexp=3D'/usr'
> -vendorscript=3D'/usr/bin'
> -vendorscriptexp=3D'/usr/bin'
> -version=3D'5.8.8'
> -version_patchlevel_string=3D'version 8 subversion 8'
> -versiononly=3D'undef'
> -vi=3D''
> -voidflags=3D'15'
> -xlibpth=3D'/usr/lib/386 /lib/386'
> -yacc=3D'yacc'
> -yaccflags=3D''
> -zcat=3D''
> -zip=3D'zip'
> -# Configure command line arguments.
> -config_arg0=3D'Configure'
> -config_args=3D'-des -Doptimize=3D-O2 -Dmyhostname=3Dlocalhost -Dperladmi=
n=3Droot@localhost -Dcc=3Dgcc -Dcf_by=3DOpen Embedded -Dinstallprefix=3D@DE=
STDIR@ -Dprefix=3D/usr -Dvendorprefix=3D/usr -Dsiteprefix=3D/usr -Dotherlib=
dirs=3D/usr/lib/perl5/5.8.8 -Duseshrplib -Dusethreads -Duseithreads -Dusela=
rgefiles -Ud_dosuid -Dd_semctl_semun -Ui_db -Ui_ndbm -Ui_gdbm -Di_shadow -D=
i_syslog -Dman3ext=3D3pm -Duseperlio -Dinstallusrbinperl -Ubincompat5005 -U=
versiononly -Dpager=3D/usr/bin/less -isr'
> -config_argc=3D28
> -config_arg1=3D'-des'
> -config_arg2=3D'-Doptimize=3D-O2'
> -config_arg3=3D'-Dmyhostname=3Dlocalhost'
> -config_arg4=3D'-Dperladmin=3Droot@localhost'
> -config_arg5=3D'-Dcc=3Dgcc'
> -config_arg6=3D'-Dcf_by=3DOpen Embedded'
> -config_arg7=3D'-Dinstallprefix=3D@DESTDIR@'
> -config_arg8=3D'-Dprefix=3D/usr'
> -config_arg9=3D'-Dvendorprefix=3D/usr'
> -config_arg10=3D'-Dsiteprefix=3D/usr'
> -config_arg11=3D'-Dotherlibdirs=3D/usr/lib/perl5/5.8.8'
> -config_arg12=3D'-Duseshrplib'
> -config_arg13=3D'-Dusethreads'
> -config_arg14=3D'-Duseithreads'
> -config_arg15=3D'-Duselargefiles'
> -config_arg16=3D'-Ud_dosuid'
> -config_arg17=3D'-Dd_semctl_semun'
> -config_arg18=3D'-Ui_db'
> -config_arg19=3D'-Ui_ndbm'
> -config_arg20=3D'-Ui_gdbm'
> -config_arg21=3D'-Di_shadow'
> -config_arg22=3D'-Di_syslog'
> -config_arg23=3D'-Dman3ext=3D3pm'
> -config_arg24=3D'-Duseperlio'
> -config_arg25=3D'-Dinstallusrbinperl'
> -config_arg26=3D'-Ubincompat5005'
> -config_arg27=3D'-Uversiononly'
> -config_arg28=3D'-Dpager=3D/usr/bin/less -isr'
> -PERL_REVISION=3D5
> -PERL_VERSION=3D8
> -PERL_SUBVERSION=3D8
> -PERL_API_REVISION=3D5
> -PERL_API_VERSION=3D8
> -PERL_API_SUBVERSION=3D0
> -PERL_PATCHLEVEL=3D
> -PERL_CONFIG_SH=3Dtrue
> diff --git a/recipes/perl/perl-5.8.8/config.sh-32 b/recipes/perl/perl-5.8=
.8/config.sh-32
> deleted file mode 100644
> index e22d71d..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-32
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -alignbytes=3D'4'
> -ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-al=
iasing -pipe -I/usr/local/include -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=
=3D64'
> -ccflags_uselargefiles=3D'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
> -yaccflags=3D''
> -ccsymbols=3D'__GNUC_PATCHLEVEL__=3D5'
> -cppccsymbols=3D'__GNUC__=3D3 __GNUC_MINOR__=3D3'
> -cppccsymbols=3D'__GNUC__=3D3 __GNUC_MINOR__=3D3'
> -cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-a=
liasing -pipe -I/usr/local/include'
> -cppsymbols=3D'__ELF__=3D1 _FILE_OFFSET_BITS=3D64 __GLIBC__=3D2 __GLIBC_M=
INOR__=3D3 __GNU_LIBRARY__=3D6 _GNU_SOURCE=3D1 i386=3D1 __i386=3D1 __i386__=
=3D1 __i486=3D1 __i486__=3D1 _LARGEFILE64_SOURCE=3D1 _LARGEFILE_SOURCE=3D1 =
linux=3D1 __linux=3D1 __linux__=3D1 _POSIX_C_SOURCE=3D199506L _POSIX_SOURCE=
=3D1 _REENTRANT=3D1 __STDC__=3D1 unix=3D1 __unix=3D1 __unix__=3D1 __USE_BSD=
=3D1 __USE_FILE_OFFSET64=3D1 __USE_GNU=3D1 __USE_LARGEFILE=3D1 __USE_LARGEF=
ILE64=3D1 __USE_MISC=3D1 __USE_POSIX=3D1 __USE_POSIX199309=3D1 __USE_POSIX1=
99506=3D1 __USE_POSIX2=3D1 __USE_REENTRANT=3D1 __USE_SVID=3D1 __USE_UNIX98=
=3D1 __USE_XOPEN=3D1 __USE_XOPEN_EXTENDED=3D1 _XOPEN_SOURCE=3D600 _XOPEN_SO=
URCE_EXTENDED=3D1'
> -d_nv_preserves_uv=3D'define'
> -d_u32align=3D'undef'
> -gccversion=3D'3.3.5 (Debian 1:3.3.5-13)'
> -getspnam_r_proto=3D'0'
> -gidformat=3D'"lu"'
> -gnulibc_version=3D'2.3.2'
> -i32type=3D'long'
> -i64type=3D'long long'
> -ivsize=3D'4'
> -gnulibc_version=3D'2.3.2'
> -libc=3D'/lib/libc-2.3.2.so'
> -libsfiles=3D' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthre=
ad.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr=
/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.s=
o'
> -ignore_versioned_solibs=3D'y'
> -libs=3D'-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
> -libsdirs=3D' /usr/lib'
> -libsfiles=3D' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthre=
ad.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr=
/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.s=
o'
> -libspath=3D' /usr/local/lib /lib /usr/lib'
> -libswanted=3D'sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld =
sun m crypt sec util pthread c cposix posix ucb BSD'
> -libswanted_uselargefiles=3D''
> -perllibs=3D'-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
> -libsfiles=3D' libnsl.so libdl.so libm.so libcrypt.so libutil.so libpthre=
ad.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdl.so /usr/lib/libm.so /usr=
/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.so /usr/lib/libc.s=
o'
> -longdblsize=3D'12'
> -longlongsize=3D'8'
> -longsize=3D'4'
> -myuname=3D'linux birgitte 2.6.21-rc5 #63 tue mar 27 14:41:54 est 2007 i6=
86 gnulinux '
> -nv_preserves_uv_bits=3D'32'
> -osvers=3D'2.6.21-rc5'
> -ptrsize=3D'4'
> -quadkind=3D'3'
> -quadtype=3D'long long'
> -uquadtype=3D'unsigned long long'
> -sPRIXU64=3D'"LX"'
> -sPRId64=3D'"Ld"'
> -sPRIi64=3D'"Li"'
> -sPRIo64=3D'"Lo"'
> -sPRIu64=3D'"Lu"'
> -sPRIx64=3D'"Lx"'
> -selectminbits=3D'32'
> -sizesize=3D'4'
> -u32type=3D'unsigned long'
> -u64type=3D'unsigned long long'
> -uidformat=3D'"lu"'
> -uquadtype=3D'unsigned long long'
> -use64bitall=3D'undef'
> -use64bitint=3D'undef'
> -uvsize=3D'4'
> diff --git a/recipes/perl/perl-5.8.8/config.sh-32-be b/recipes/perl/perl-=
5.8.8/config.sh-32-be
> deleted file mode 100644
> index a59a9ab..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-32-be
> +++ /dev/null
> @@ -1 +0,0 @@
> -byteorder=3D'4321'
> diff --git a/recipes/perl/perl-5.8.8/config.sh-32-le b/recipes/perl/perl-=
5.8.8/config.sh-32-le
> deleted file mode 100644
> index 10e4226..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-32-le
> +++ /dev/null
> @@ -1 +0,0 @@
> -byteorder=3D'1234'
> diff --git a/recipes/perl/perl-5.8.8/config.sh-64 b/recipes/perl/perl-5.8=
.8/config.sh-64
> deleted file mode 100644
> index 6e58fa7..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-64
> +++ /dev/null
> @@ -1,58 +0,0 @@
> -alignbytes=3D'8'
> -ccflags=3D'-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-al=
iasing -pipe -Wdeclaration-after-statement -D_LARGEFILE_SOURCE -D_FILE_OFFS=
ET_BITS=3D64'
> -ccflags_uselargefiles=3D'-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64'
> -yaccflags=3D''
> -ccsymbols=3D''
> -cppccsymbols=3D''
> -cppccsymbols=3D''
> -cppflags=3D'-D_REENTRANT -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -fno-strict-a=
liasing -pipe -Wdeclaration-after-statement'
> -cppsymbols=3D'__amd64=3D1 __amd64__=3D1 __ELF__=3D1 _FILE_OFFSET_BITS=3D=
64 __GLIBC__=3D2 __GLIBC_MINOR__=3D4 __GNUC__=3D4 __GNUC_MINOR__=3D1 __GNU_=
LIBRARY__=3D6 _GNU_SOURCE=3D1 _LARGEFILE64_SOURCE=3D1 _LARGEFILE_SOURCE=3D1=
 linux=3D1 __linux=3D1 __linux__=3D1 _LP64=3D1 __LP64__=3D1 _POSIX_C_SOURCE=
=3D199506L _POSIX_SOURCE=3D1 _REENTRANT=3D1 __STDC__=3D1 unix=3D1 __unix=3D=
1 __unix__=3D1 __USE_BSD=3D1 __USE_FILE_OFFSET64=3D1 __USE_GNU=3D1 __USE_LA=
RGEFILE=3D1 __USE_LARGEFILE64=3D1 __USE_MISC=3D1 __USE_POSIX=3D1 __USE_POSI=
X199309=3D1 __USE_POSIX199506=3D1 __USE_POSIX2=3D1 __USE_REENTRANT=3D1 __US=
E_SVID=3D1 __USE_UNIX98=3D1 __USE_XOPEN=3D1 __USE_XOPEN_EXTENDED=3D1 __x86_=
64=3D1 __x86_64__=3D1 _XOPEN_SOURCE=3D600 _XOPEN_SOURCE_EXTENDED=3D1'
> -d_nv_preserves_uv=3D'undef'
> -d_u32align=3D'define'
> -gccversion=3D'4.1.2 20060928 (prerelease) (Ubuntu 4.1.1-13ubuntu5)'
> -getspnam_r_proto=3D'REENTRANT_PROTO_I_CSBWR'
> -gidformat=3D'"u"'
> -gnulibc_version=3D'2.4'
> -i32type=3D'int'
> -i64type=3D'long'
> -ivsize=3D'8'
> -gnulibc_version=3D'2.4'
> -libc=3D'/lib/libc-2.4.so'
> -libsfiles=3D' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so=
 libpthread.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /us=
r/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.=
so /usr/lib/libc.so'
> -ignore_versioned_solibs=3D'y'
> -libs=3D'-lnsl -ldb -ldl -lm -lcrypt -lutil -lpthread -lc'
> -libsdirs=3D' /usr/lib'
> -libsfiles=3D' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so=
 libpthread.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /us=
r/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.=
so /usr/lib/libc.so'
> -libspath=3D' /usr/local/lib /lib /usr/lib'
> -libswanted=3D'sfio socket inet nsl nm ndbm gdbm dbm db malloc dl dld ld =
sun m crypt sec util pthread c cposix posix ucb BSD'
> -libswanted_uselargefiles=3D''
> -perllibs=3D'-lnsl -ldl -lm -lcrypt -lutil -lpthread -lc'
> -libsfiles=3D' libnsl.so libdb.so libdl.so libm.so libcrypt.so libutil.so=
 libpthread.so libc.so'
> -libsfound=3D' /usr/lib/libnsl.so /usr/lib/libdb.so /usr/lib/libdl.so /us=
r/lib/libm.so /usr/lib/libcrypt.so /usr/lib/libutil.so /usr/lib/libpthread.=
so /usr/lib/libc.so'
> -longdblsize=3D'16'
> -longlongsize=3D'8'
> -longsize=3D'8'
> -myuname=3D'linux nynaeve 2.6.20.4 #29 smp thu mar 29 15:35:30 est 2007 x=
86_64 gnulinux '
> -nv_preserves_uv_bits=3D'53'
> -osvers=3D'2.6.20.4'
> -ptrsize=3D'8'
> -quadkind=3D'2'
> -quadtype=3D'long'
> -uquadtype=3D'unsigned long'
> -sPRIXU64=3D'"lX"'
> -sPRId64=3D'"ld"'
> -sPRIi64=3D'"li"'
> -sPRIo64=3D'"lo"'
> -sPRIu64=3D'"lu"'
> -sPRIx64=3D'"lx"'
> -selectminbits=3D'64'
> -sizesize=3D'8'
> -u32type=3D'unsigned int'
> -u64type=3D'unsigned long'
> -uidformat=3D'"u"'
> -uquadtype=3D'unsigned long'
> -use64bitall=3D'define'
> -use64bitint=3D'define'
> -uvsize=3D'8'
> diff --git a/recipes/perl/perl-5.8.8/config.sh-64-be b/recipes/perl/perl-=
5.8.8/config.sh-64-be
> deleted file mode 100644
> index c08ce3c..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-64-be
> +++ /dev/null
> @@ -1 +0,0 @@
> -byteorder=3D'87654321'
> diff --git a/recipes/perl/perl-5.8.8/config.sh-64-le b/recipes/perl/perl-=
5.8.8/config.sh-64-le
> deleted file mode 100644
> index 277d2a9..0000000
> --- a/recipes/perl/perl-5.8.8/config.sh-64-le
> +++ /dev/null
> @@ -1 +0,0 @@
> -byteorder=3D'12345678'
> diff --git a/recipes/perl/perl-5.8.8/generate-sh.patch b/recipes/perl/per=
l-5.8.8/generate-sh.patch
> deleted file mode 100644
> index ceb7419..0000000
> --- a/recipes/perl/perl-5.8.8/generate-sh.patch
> +++ /dev/null
> @@ -1,46 +0,0 @@
> -Use the ld flags from the supplied configuration file. For sh we need th=
e
> -flags that specify to build PIC code so that the shared libraries work.
> -
> -Index: perl-5.8.8/Cross/generate_config_sh
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/Cross/generate_config_sh =A0 2003-09-05 18:31:08.000=
000000 +1000
> -+++ perl-5.8.8/Cross/generate_config_sh =A0 =A0 =A0 =A02007-05-30 09:12:=
50.000000000 +1000
> -@@ -19,10 +19,10 @@
> - $callbacks->{'ar'} =3D [\&simple_process, ["AR", "arm-linux-ar"]];
> - $callbacks->{'archname'} =3D [\&simple_process, ["SYS", "armv4l-linux"]=
];
> - $callbacks->{'cc'} =3D [\&simple_process, ["CC", "arm-linux-gcc"]];
> --$callbacks->{'cccdlflags'} =3D [\&simple_process, ["CFLAGS", ""]];
> --$callbacks->{'ccdlflags'} =3D [\&simple_process, ["CFLAGS", ""]];
> --$callbacks->{'ccflags'} =3D [\&simple_process, ["CFLAGS", "-fno-strict-=
aliasing -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"]];
> --$callbacks->{'ccflags_uselargefiles'} =3D [\&simple_process, ["CFLAGS",=
 "-D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=3D64"]];
> -+#$callbacks->{'cccdlflags'} =3D [\&simple_process, ["CFLAGS", ""]];
> -+#$callbacks->{'ccdlflags'} =3D [\&simple_process, ["CFLAGS", ""]];
> -+$callbacks->{'ccflags'} =3D [\&simple_process_insert, ["CFLAGS", "-fno-=
strict-aliasing -D_GNU_SOURCE -DTHREADS_HAVE_PIDS -D_LARGEFILE_SOURCE -D_FI=
LE_OFFSET_BITS=3D64"]];
> -+$callbacks->{'ccflags_uselargefiles'} =3D [\&simple_process_insert, ["C=
FLAGS", "-D_GNU_SOURCE -DTHREADS_HAVE_PIDS -D_LARGEFILE_SOURCE -D_FILE_OFFS=
ET_BITS=3D64"]];
> - $callbacks->{'ccname'} =3D [\&simple_process, ["CC", "arm-linux-gcc"]];
> - $callbacks->{'cpp'} =3D [\&simple_process, ["CCP", "arm-linux-cpp"]];
> - $callbacks->{'cppflags'} =3D [\&simple_process, ["CCPFLAGS", "-fno-stri=
ct-aliasing"]];
> -@@ -105,6 +105,23 @@
> -
> - }
> -
> -+# Insert env var into the variables value
> -+sub simple_process_insert {
> -+ =A0 =A0 =A0my $key =3D shift;
> -+ =A0 =A0 =A0my $value =3D shift;
> -+ =A0 =A0 =A0my $envvar =3D $callbacks->{$key}->[1][0];
> -+
> -+ =A0 =A0 =A0if ($ENV{$envvar}) {
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0# Strip quotes from value
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$value =3D~ s/^\'//;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$value =3D~ s/\'$//;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0# Remove -I/usr/local/... from the value
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0$value =3D~ s#\W-I/usr/local/\w+\W# #g;
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0# Prepend env var (OE setting) to value
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0print("$key=3D\'$ENV{$envvar} $value\'\n");
> -+ =A0 =A0 =A0}
> -+}
> -+
> - sub library_munge {
> - =A0 =A0 =A0 my $key =3D shift;
> - =A0 =A0 =A0 my $value =3D shift;
> diff --git a/recipes/perl/perl-5.8.8/installperl.patch b/recipes/perl/per=
l-5.8.8/installperl.patch
> deleted file mode 100644
> index ff52bc3..0000000
> --- a/recipes/perl/perl-5.8.8/installperl.patch
> +++ /dev/null
> @@ -1,15 +0,0 @@
> -Index: perl-5.8.8/installperl
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/installperl =A0 =A0 =A0 =A02007-06-14 12:36:23.00000=
0000 +1000
> -+++ perl-5.8.8/installperl =A0 =A0 2007-06-14 12:38:39.000000000 +1000
> -@@ -3,8 +3,8 @@
> - BEGIN {
> - =A0 =A0 require 5.004;
> - =A0 =A0 chdir '..' if !-d 'lib' and -d '../lib';
> -- =A0 =A0@INC =3D 'lib';
> -- =A0 =A0$ENV{PERL5LIB} =3D 'lib';
> -+# =A0 =A0@INC =3D 'lib';
> -+# =A0 =A0$ENV{PERL5LIB} =3D 'lib';
> - }
> -
> - use strict;
> diff --git a/recipes/perl/perl-5.8.8/makedepend-dash.patch b/recipes/perl=
/perl-5.8.8/makedepend-dash.patch
> deleted file mode 100644
> index 1f15474..0000000
> --- a/recipes/perl/perl-5.8.8/makedepend-dash.patch
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -Index: perl-5.8.8/makedepend.SH
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/makedepend.SH =A0 =A0 =A02007-05-24 12:06:52.0000000=
00 +1000
> -+++ perl-5.8.8/makedepend.SH =A0 2007-05-24 12:27:33.000000000 +1000
> -@@ -128,7 +128,7 @@
> - =A0 =A0 *.y) filebase=3D`basename $file .y` ;;
> - =A0 =A0 esac
> - =A0 =A0 case "$file" in
> -- =A0 =A0*/*) finc=3D"-I`echo $file | sed 's#/[^/]*$##`" ;;
> -+ =A0 =A0*/*) finc=3D"-I`echo $file | sed 's#/[^/]*$##'`" ;;
> - =A0 =A0 *) =A0 finc=3D ;;
> - =A0 =A0 esac
> - =A0 =A0 $echo "Finding dependencies for $filebase$_o."
> diff --git a/recipes/perl/perl-5.8.8/native-no-gdbminc.patch b/recipes/pe=
rl/perl-5.8.8/native-no-gdbminc.patch
> deleted file mode 100644
> index f00fa2c..0000000
> --- a/recipes/perl/perl-5.8.8/native-no-gdbminc.patch
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -If you have a /usr/include/gdbm/ndbm.h host on the header then the confi=
gure
> -script adds -I/usr/include/gdbm to the ccflags even though gdbm support =
is
> -disabled. Prevent perl from doing this so we don't get cross compile bad=
ness
> -errors while building perl.
> -
> ---- perl-5.8.8/Configure =A0 =A0 =A0 2007/05/06 23:42:18 =A0 =A0 1.1
> -+++ perl-5.8.8/Configure =A0 =A0 =A0 2007/05/06 23:42:48
> -@@ -20033,8 +20033,8 @@
> - =A0 =A0 # ndbm.h header in /usr/include/gdbm/ndbm.h.
> - =A0 =A0 if $test -f /usr/include/gdbm/ndbm.h; then
> - =A0 =A0 =A0 echo '<gdbm/ndbm.h> found.'
> -- =A0 =A0 =A0 =A0ccflags=3D"$ccflags -I/usr/include/gdbm"
> -- =A0 =A0 =A0 =A0cppflags=3D"$cppflags -I/usr/include/gdbm"
> -+# =A0 =A0 =A0 =A0ccflags=3D"$ccflags -I/usr/include/gdbm"
> -+# =A0 =A0 =A0 =A0cppflags=3D"$cppflags -I/usr/include/gdbm"
> - =A0 =A0 =A0 =A0 t_ndbm=3D$define
> - =A0 =A0 fi
> - =A0 =A0 ;;
> diff --git a/recipes/perl/perl-5.8.8/native-nopacklist.patch b/recipes/pe=
rl/perl-5.8.8/native-nopacklist.patch
> deleted file mode 100644
> index a0ba269..0000000
> --- a/recipes/perl/perl-5.8.8/native-nopacklist.patch
> +++ /dev/null
> @@ -1,84 +0,0 @@
> -Part of 52_debian_extutils_hacks.patch just to exclude the installation =
of .packlist files
> -
> -diff -Naur --exclude=3Ddebian perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm pe=
rl-5.8.8/lib/ExtUtils/MM_Unix.pm
> ---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm =A0 =A02005-05-21 19:42:56.0=
00000000 +1000
> -+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm 2006-02-05 17:40:19.000000000 +11=
00
> -@@ -2054,9 +2054,7 @@
> - =A0 =A0 =A0 $(NOECHO) $(ECHO) INSTALLDIRS not defined, defaulting to IN=
STALLDIRS=3Dsite
> -
> - pure_perl_install ::
> -- =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0read }.$self->catfile('$(PERL_ARCHLIB)','au=
to','$(FULLEXT)','.packlist').q{ \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0write }.$self->catfile('$(DESTINSTALLARCHLI=
B)','auto','$(FULLEXT)','.packlist').q{ \
> -+ =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_LIB) $(DESTINSTALLPRIVLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_ARCHLIB) $(DESTINSTALLARCHLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_BIN) $(DESTINSTALLBIN) \
> -@@ -2081,9 +2079,7 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 }.$self->catdir('$(PERL_ARCHLIB)','auto','$=
(FULLEXT)').q{
> -
> - pure_vendor_install ::
> -- =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0read }.$self->catfile('$(VENDORARCHEXP)','a=
uto','$(FULLEXT)','.packlist').q{ \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0write }.$self->catfile('$(DESTINSTALLVENDOR=
ARCH)','auto','$(FULLEXT)','.packlist').q{ \
> -+ =A0 =A0 =A0$(NOECHO) $(MOD_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_LIB) $(DESTINSTALLVENDORLIB) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_ARCHLIB) $(DESTINSTALLVENDORARCH) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_BIN) $(DESTINSTALLVENDORBIN) \
> -@@ -2092,37 +2088,19 @@
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 $(INST_MAN3DIR) $(DESTINSTALLVENDORMAN3DIR)
> -
> - doc_perl_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"Module" "$(NAME)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"installed into" "$(INSTALLPRIVLIB)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0LINKTYPE "$(LINKTYPE)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0VERSION "$(VERSION)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -
> - doc_site_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -+ =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLSITEARCH)/perllocal.pod
> -+ =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLSITEARCH)
> -+ =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Module" "$(NAME)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 "installed into" "$(INSTALLSITELIB)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 LINKTYPE "$(LINKTYPE)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 VERSION "$(VERSION)" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -+ =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLSITEARCH)=
','perllocal.pod').q{
> -
> - doc_vendor_install ::
> -- =A0 =A0 =A0$(NOECHO) $(ECHO) Appending installation info to $(DESTINST=
ALLARCHLIB)/perllocal.pod
> -- =A0 =A0 =A0-$(NOECHO) $(MKPATH) $(DESTINSTALLARCHLIB)
> -- =A0 =A0 =A0-$(NOECHO) $(DOC_INSTALL) \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"Module" "$(NAME)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0"installed into" "$(INSTALLVENDORLIB)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0LINKTYPE "$(LINKTYPE)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0VERSION "$(VERSION)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0EXE_FILES "$(EXE_FILES)" \
> -- =A0 =A0 =A0 =A0 =A0 =A0 =A0>> }.$self->catfile('$(DESTINSTALLARCHLIB)'=
,'perllocal.pod').q{
> -
> - };
> -
> -@@ -2131,13 +2109,12 @@
> - =A0 =A0 =A0 $(NOECHO) $(NOOP)
> -
> - uninstall_from_perldirs ::
> -- =A0 =A0 =A0$(NOECHO) $(UNINSTALL) }.$self->catfile('$(PERL_ARCHLIB)','=
auto','$(FULLEXT)','.packlist').q{
> -
> - uninstall_from_sitedirs ::
> - =A0 =A0 =A0 $(NOECHO) $(UNINSTALL) }.$self->catfile('$(SITEARCHEXP)','a=
uto','$(FULLEXT)','.packlist').q{
> -
> - uninstall_from_vendordirs ::
> -- =A0 =A0 =A0$(NOECHO) $(UNINSTALL) }.$self->catfile('$(VENDORARCHEXP)',=
'auto','$(FULLEXT)','.packlist').q{
> -+
> - };
> -
> - =A0 =A0 join("",@m);
> diff --git a/recipes/perl/perl-5.8.8/native-perlinc.patch b/recipes/perl/=
perl-5.8.8/native-perlinc.patch
> deleted file mode 100644
> index 6dc4b95..0000000
> --- a/recipes/perl/perl-5.8.8/native-perlinc.patch
> +++ /dev/null
> @@ -1,24 +0,0 @@
> -Index: perl-5.8.8/lib/ExtUtils/MM_Unix.pm
> -=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> ---- perl-5.8.8.orig/lib/ExtUtils/MM_Unix.pm =A0 =A02008-10-31 22:01:35.0=
00000000 +0000
> -+++ perl-5.8.8/lib/ExtUtils/MM_Unix.pm 2008-11-08 16:01:12.000000000 +00=
00
> -@@ -1597,6 +1597,19 @@
> - =A0 =A0 =A0 $self->{PERL_LIB} =A0 =A0 ||=3D $Config{privlibexp};
> - =A0 =A0 =A0 $self->{PERL_ARCHLIB} ||=3D $Config{archlibexp};
> - =A0 =A0 =A0 $self->{PERL_INC} =A0 =A0 =3D $self->catdir("$self->{PERL_A=
RCHLIB}","CORE"); # wild guess for now
> -+ =A0 =A0 =A0# Check for environment override so we'll find the headers =
in the correct place
> -+ =A0 =A0 =A0 =A0if (defined $ENV{PERL_LIB})
> -+ =A0 =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0 =A0$self->{PERL_LIB} =3D $ENV{PERL_LIB};
> -+ =A0 =A0 =A0 =A0}
> -+ =A0 =A0 =A0 =A0if (defined $ENV{PERL_ARCHLIB})
> -+ =A0 =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0 =A0$self->{PERL_ARCHLIB} =3D $ENV{PERL_ARCHLIB};
> -+ =A0 =A0 =A0 =A0}
> -+ =A0 =A0 =A0 =A0if (defined $ENV{PERL_INC})
> -+ =A0 =A0 =A0 =A0{
> -+ =A0 =A0 =A0 =A0 =A0 =A0$self->{PERL_INC} =3D $ENV{PERL_INC};
> -+ =A0 =A0 =A0 =A0}
> - =A0 =A0 =A0 my $perl_h;
> -
> - =A0 =A0 =A0 if (not -f ($perl_h =3D $self->catfile($self->{PERL_INC},"p=
erl.h"))
> diff --git a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch b/recipes=
/perl/perl-5.8.8/perl-configpm-switch.patch
> deleted file mode 100644
> index 8becb8e..0000000
> --- a/recipes/perl/perl-5.8.8/perl-configpm-switch.patch
> +++ /dev/null
> @@ -1,34 +0,0 @@
> -This patch is used for perl-native only. It enables the switching of
> -configuration files between Config_heavy.pl and
> -Config_heavy-$TARGET_SYS.pl by setting the environment variables
> -PERLCONFIGTARGET - the later containing settings for the target while
> -the former contains those for the host. This will allow cpan.bbclass
> -to use the settings appropriate for the native and/or target builds
> -as required. This also disables the use of the cache since the cached
> -values would be valid for the host only.
> -
> ---- perl-5.8.8/configpm =A0 =A0 =A0 =A02007/04/30 03:10:43 =A0 =A0 1.1
> -+++ perl-5.8.8/configpm =A0 =A0 =A0 =A02007/04/30 03:11:56
> -@@ -374,7 +374,7 @@
> - =A0 =A0 my($self, $key) =3D @_;
> -
> - =A0 =A0 # check for cached value (which may be undef so we use exists n=
ot defined)
> -- =A0 =A0return $self->{$key} if exists $self->{$key};
> -+ =A0 =A0#return $self->{$key} if exists $self->{$key};
> -
> - =A0 =A0 return $self->fetch_string($key);
> - }
> -@@ -530,7 +530,12 @@
> - sub DESTROY { }
> -
> - sub AUTOLOAD {
> -- =A0 =A0require 'Config_heavy.pl';
> -+ =A0 =A0my $cfgfile =3D 'Config_heavy.pl';
> -+ =A0 =A0if (defined $ENV{PERLCONFIGTARGET} and $ENV{PERLCONFIGTARGET} n=
e "")
> -+ =A0 =A0{
> -+ =A0 =A0 =A0 =A0$cfgfile =3D "Config_heavy-$ENV{PERLCONFIGTARGET}.pl";
> -+ =A0 =A0}
> -+ =A0 =A0require $cfgfile;
> - =A0 =A0 goto \&launcher unless $Config::AUTOLOAD =3D~ /launcher$/;
> - =A0 =A0 die "&Config::AUTOLOAD failed on $Config::AUTOLOAD";
> - }
> diff --git a/recipes/perl/perl-5.8.8/perl-configure.sh b/recipes/perl/per=
l-5.8.8/perl-configure.sh
> deleted file mode 100755
> index 9800394..0000000
> --- a/recipes/perl/perl-5.8.8/perl-configure.sh
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -ls#! /bin/sh
> -
> -#
> -# Generate the common perl configuration
> -# Needs to be run on a host that matches the bitsize of the target platf=
orm
> -#
> -
> -echo sh Configure -des \
> - =A0 =A0 =A0 =A0-Doptimize=3D-O2 \
> - =A0 =A0 =A0 =A0-Dmyhostname=3Dlocalhost \
> - =A0 =A0 =A0 =A0-Dperladmin=3Droot@localhost \
> - =A0 =A0 =A0 =A0-Dcc=3Dgcc \
> - =A0 =A0 =A0 =A0-Dcf_by=3D'Open Embedded' \
> - =A0 =A0 =A0 =A0-Dinstallprefix=3D@DESTDIR@ \
> - =A0 =A0 =A0 =A0-Dprefix=3D/usr \
> - =A0 =A0 =A0 =A0-Dvendorprefix=3D/usr \
> - =A0 =A0 =A0 =A0-Dsiteprefix=3D/usr \
> - =A0 =A0 =A0 =A0-Dotherlibdirs=3D/usr/lib/perl5/5.8.8 \
> - =A0 =A0 =A0 =A0-Duseshrplib \
> - =A0 =A0 =A0 =A0-Dusethreads \
> - =A0 =A0 =A0 =A0-Duseithreads \
> - =A0 =A0 =A0 =A0-Duselargefiles \
> - =A0 =A0 =A0 =A0-Ud_dosuid \
> - =A0 =A0 =A0 =A0-Dd_semctl_semun \
> - =A0 =A0 =A0 =A0-Ui_db \
> - =A0 =A0 =A0 =A0-Ui_ndbm \
> - =A0 =A0 =A0 =A0-Ui_gdbm \
> - =A0 =A0 =A0 =A0-Di_shadow \
> - =A0 =A0 =A0 =A0-Di_syslog \
> - =A0 =A0 =A0 =A0-Dman3ext=3D3pm \
> - =A0 =A0 =A0 =A0-Duseperlio \
> - =A0 =A0 =A0 =A0-Dinstallusrbinperl \
> - =A0 =A0 =A0 =A0-Ubincompat5005 \
> - =A0 =A0 =A0 =A0-Uversiononly \
> - =A0 =A0 =A0 =A0-Dpager=3D'/usr/bin/less -isr'
> -
> -cp -f config.sh config.sh.COMMON
> -
> -TARGETOS=3D$(grep myarchname config.sh.COMMON | sed "s#.*'\(.*\)'.*#\1#"=
)
> -
> -sed -r -i config.sh.COMMON \
> - =A0 =A0 =A0 -e "s#(install.*=3D')(/usr)/local(.*')#\1@DESTDIR@\2\3#g" \
> - =A0 =A0 =A0 -e 's#'$TARGETOS'#@ARCH@#g'
> diff --git a/recipes/perl/perl-5.8.8/perl-dynloader.patch b/recipes/perl/=
perl-5.8.8/perl-dynloader.patch
> deleted file mode 100644
> index e2dc774..0000000
> --- a/recipes/perl/perl-5.8.8/perl-dynloader.patch
> +++ /dev/null
> @@ -1,23 +0,0 @@
> -Allow the location that .so files are searched for for dynamic
> -loading to be changed via an environment variable. This is to allow
> -us to load .so's from the host system while building for the target
> -system.
> -
> ---- perl-5.8.8/ext/DynaLoader/XSLoader_pm.PL =A0 2007/04/20 09:03:08 =A0=
 =A0 1.1
> -+++ perl-5.8.8/ext/DynaLoader/XSLoader_pm.PL =A0 2007/04/20 09:41:28
> -@@ -65,6 +65,15 @@
> - print OUT <<'EOT';
> - =A0 =A0 my $modpname =3D join('/',@modparts);
> - =A0 =A0 my $modlibname =3D (caller())[1];
> -+ =A0 =A0# OE: Allow env to form dynamic loader to look in a different p=
lace
> -+ =A0 =A0# This is so it finds the host .so files, not the targets
> -+ =A0 =A0if (defined $ENV{PERLHOSTLIB})
> -+ =A0 =A0{
> -+ =A0 =A0 =A0 =A0my $hostlib =3D $ENV{PERLHOSTLIB};
> -+ =A0 =A0 =A0 =A0print STDERR "*** Module name IN: $modlibname\n";
> -+ =A0 =A0 =A0 =A0$modlibname =3D~ s#(?<!/)(\.\./)*lib/#$hostlib#g;
> -+ =A0 =A0 =A0 =A0print STDERR "*** Module name OUT: $modlibname\n";
> -+ =A0 =A0}
> - =A0 =A0 my $c =3D @modparts;
> - =A0 =A0 $modlibname =3D~ s,[\\/][^\\/]+$,, while $c--; =A0 =A0 =A0# Q&D=
 basename
> - =A0 =A0 my $file =3D "$modlibname/auto/$modpname/$modfname.$dl_dlext";
> diff --git a/recipes/perl/perl-5.8.8/perl-moreconfig.patch b/recipes/perl=
/perl-5.8.8/perl-moreconfig.patch
> deleted file mode 100644
> index 590c725..0000000
> --- a/recipes/perl/perl-5.8.8/perl-moreconfig.patch
> +++ /dev/null
> @@ -1,16 +0,0 @@
> -We need ld in the fake config library, but it's not included by default.=
 So
> -expand the number of items included. While this works it indicates that =
the
> -rest of the config items are not being picked up and/or are being picked=
 up
> -from the host. More investigation needed.
> -
> ---- perl-5.8.8/configpm =A0 =A0 =A0 =A02007/04/20 09:48:05 =A0 =A0 1.1
> -+++ perl-5.8.8/configpm =A0 =A0 =A0 =A02007/04/20 09:57:12
> -@@ -2,7 +2,7 @@
> - use strict;
> - use vars qw(%Config $Config_SH_expanded);
> -
> --my $how_many_common =3D 22;
> -+my $how_many_common =3D 50;
> -
> - # commonly used names to precache (and hence lookup fastest)
> - my %Common;
> diff --git a/recipes/perl/perl-5.8.8/shared-ldflags.patch b/recipes/perl/=
perl-5.8.8/shared-ldflags.patch
> deleted file mode 100644
> index b872dc9..0000000
> --- a/recipes/perl/perl-5.8.8/shared-ldflags.patch
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -diff -urN perl-5.8.8.orig/Cross/generate_config_sh perl-5.8.8/Cross/gene=
rate_config_sh
> ---- perl-5.8.8.orig/Cross/generate_config_sh =A0 2003-09-05 08:31:08.000=
000000 +0000
> -+++ perl-5.8.8/Cross/generate_config_sh =A0 =A0 =A0 =A02009-04-02 14:59:=
56.000000000 +0000
> -@@ -30,6 +30,7 @@
> - $callbacks->{'cppstdin'} =3D [\&simple_process_append, ["CC", "arm-linu=
x-gcc -E", "-E"]];
> - $callbacks->{'full_ar'} =3D [\&backtick, ["AR", "which $ENV{AR}", "/usr=
/local/arm/2.95.3/bin/arm-linux-ar"]];
> - $callbacks->{'ld'} =3D [\&simple_process, ["LD", "arm-linux-ld"]];
> -+$callbacks->{'lddlflags'} =3D [\&simple_process, ["LDDLFLAGS", ""]];
> - $callbacks->{'ldflags'} =3D [\&simple_process, ["LDFLAGS", ""]];
> - $callbacks->{'ldflags_uselargefiles'} =3D [\&simple_process, ["LDFLAGS"=
, ""]];
> - $callbacks->{'myarchname'} =3D [\&simple_process, ["SYS", "armv4l-linux=
"]];
> diff --git a/recipes/perl/perl-native_5.8.8.bb b/recipes/perl/perl-native=
_5.8.8.bb
> deleted file mode 100644
> index a7f85a3..0000000
> --- a/recipes/perl/perl-native_5.8.8.bb
> +++ /dev/null
> @@ -1,114 +0,0 @@
> -DESCRIPTION =3D "Perl is a popular scripting language."
> -HOMEPAGE =3D "http://www.perl.org/"
> -SECTION =3D "libs"
> -LICENSE =3D "Artistic|GPLv1+"
> -DEPENDS =3D "virtual/db-native gdbm-native"
> -PR =3D "r22"
> -NATIVE_INSTALL_WORKS =3D "1"
> -
> -FILESDIR =3D "${@os.path.dirname(bb.data.getVar('FILE',d,1))}/perl-${PV}=
"
> -
> -SRC_URI =3D "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-${PV}.tar.gz \
> - =A0 =A0 =A0 =A0 =A0 file://CPAN-Config.pm \
> - =A0 =A0 =A0 =A0 =A0 file://perl-5.8.8-gcc-4.2.patch \
> - =A0 =A0 =A0 =A0 =A0 file://Configure-multilib.patch \
> - =A0 =A0 =A0 =A0 =A0 file://perl-configpm-switch.patch \
> - =A0 =A0 =A0 =A0 =A0 file://native-nopacklist.patch \
> - =A0 =A0 =A0 =A0 =A0 file://native-no-gdbminc.patch \
> - =A0 =A0 =A0 =A0 =A0 file://native-perlinc.patch \
> - =A0 =A0 =A0 =A0 =A0 file://makedepend-dash.patch \
> - =A0 =A0 =A0 =A0 =A0 file://asm-pageh-fix.patch"
> -
> -S =3D "${WORKDIR}/perl-${PV}"
> -
> -inherit native
> -
> -do_configure () {
> - =A0 =A0./Configure \
> - =A0 =A0 =A0 =A0-Dcc=3D"${CC}" \
> - =A0 =A0 =A0 =A0-Dcflags=3D"${CFLAGS}" \
> - =A0 =A0 =A0 =A0-Dldflags=3D"${LDFLAGS}" \
> - =A0 =A0 =A0 =A0-Dcf_by=3D"Open Embedded" \
> - =A0 =A0 =A0 =A0-Dprefix=3D${prefix} \
> - =A0 =A0 =A0 =A0-Dvendorprefix=3D${prefix} \
> - =A0 =A0 =A0 =A0-Dvendorprefix=3D${prefix} \
> - =A0 =A0 =A0 =A0-Dsiteprefix=3D${prefix} \
> - =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0-Dprivlib=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0-Darchlib=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0-Dvendorlib=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0-Dvendorarch=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0-Dsitelib=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0-Dsitearch=3D${STAGING_LIBDIR}/perl/${PV} \
> - =A0 =A0 =A0 =A0\
> - =A0 =A0 =A0 =A0-Duseshrplib \
> - =A0 =A0 =A0 =A0-Dusethreads \
> - =A0 =A0 =A0 =A0-Duseithreads \
> - =A0 =A0 =A0 =A0-Duselargefiles \
> - =A0 =A0 =A0 -Dnoextensions=3DODBM_File \
> - =A0 =A0 =A0 =A0-Ud_dosuid \
> - =A0 =A0 =A0 =A0-Ui_db \
> - =A0 =A0 =A0 =A0-Ui_ndbm \
> - =A0 =A0 =A0 =A0-Ui_gdbm \
> - =A0 =A0 =A0 =A0-Di_shadow \
> - =A0 =A0 =A0 =A0-Di_syslog \
> - =A0 =A0 =A0 =A0-Duseperlio \
> - =A0 =A0 =A0 =A0-Dman3ext=3D3pm \
> - =A0 =A0 =A0 =A0-Uafs \
> - =A0 =A0 =A0 =A0-Ud_csh \
> - =A0 =A0 =A0 =A0-Uusesfio \
> - =A0 =A0 =A0 =A0-Uusenm -des
> - =A0 =A0sed "s!${STAGING_DIR}/bin!${STAGING_BINDIR}!;
> - =A0 =A0 =A0 =A0 s!${STAGING_DIR}/lib!${STAGING_LIBDIR}!;
> - =A0 =A0 =A0 =A0s!^installbin=3D.*!installbin=3D\'${STAGING_BINDIR}\'!;
> - =A0 =A0 =A0 =A0s!^installsitebin=3D.*!installsitebin=3D\'${STAGING_BIND=
IR}\'!" < config.sh > config.sh.new
> - =A0 =A0mv config.sh.new config.sh
> -}
> -
> -do_install() {
> - =A0 =A0 =A0 oe_runmake DESTDIR=3D"${D}" install.perl
> -
> - =A0 =A0 =A0 =A0# We need a hostperl link for building perl
> - =A0 =A0 =A0 =A0ln -sf perl${PV} ${D}${bindir}/hostperl
> - =A0 =A0 =A0 =A0# Store native config in non-versioned directory
> - =A0 =A0 =A0 =A0install -d ${D}${libdir}/perl/${PV}/CORE \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${D}${datadir}/perl/${PV}/ExtUtils
> - =A0 =A0 =A0 =A0install config.sh ${D}${libdir}/perl
> - =A0 =A0 =A0 # Fix Errno.pm for target builds
> - =A0 =A0 =A0 sed -i -r "s,^\tdie\ (\"Errno\ architecture.+)$,\twarn\ \1,=
" ${D}${libdir}/perl/${PV}/Errno.pm
> - =A0 =A0 =A0 # target configuration
> - =A0 =A0 =A0 =A0install lib/Config.pm =A0 =A0 =A0 ${D}${libdir}/perl/${P=
V}/
> - =A0 =A0 =A0 install lib/ExtUtils/typemap ${D}${datadir}/perl/${PV}/ExtU=
tils/
> - =A0 =A0 =A0 =A0# perl shared library headers
> - =A0 =A0 =A0 =A0for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h=
 regexp.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uconfig.h XSUB.h cc_runtime.h embedvar.=
h handy.h opnames.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 perliol.h pp_proto.h regnodes.h unixish=
.h config.h EXTERN.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hv.h malloc_ctl.h pad.h perlsdio.h prot=
o.h scope.h utf8.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cop.h fakesdio.h INTERN.h mg.h patchlev=
el.h perlsfio.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reentr.h sv.h utfebcdic.h cv.h fakethr.=
h intrpvar.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nostdio.h perlapi.h perlvars.h reentr.i=
nc thrdvar.h util.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dosish.h form.h iperlsys.h opcode.h per=
l.h perly.h regcomp.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thread.h warnings.h; do
> - =A0 =A0 =A0 =A0 =A0 =A0install $i ${D}${libdir}/perl/${PV}/CORE
> - =A0 =A0 =A0 =A0done
> - =A0 =A0 =A0 =A0# Make sure CPAN is configured
> - =A0 =A0 =A0 =A0sed -e "s,@SYSROOTBASE@,${base_prefix}," ${WORKDIR}/CPAN=
-Config.pm > \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${D}${libdir}/perl/${PV}/CPAN/Config.pm
> -
> - =A0 =A0 =A0 # Make sure we use /usr/bin/env perl
> - =A0 =A0 =A0 for PERLSCRIPT in `grep -rIl ${bindir}/perl ${D}${bindir}`;=
 do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 sed -i -e 's|^#!${bindir}/perl|#!/usr/bin/e=
nv perl|' $PERLSCRIPT
> - =A0 =A0 =A0 done
> -}
> -
> -do_install_append_nylon() {
> - =A0 =A0 =A0 =A0# get rid of definitions not supported by the gcc versio=
n we use for nylon...
> - =A0 =A0 =A0 =A0for i in ${D}${libdir}/perl/${PV}/Config_heavy.pl ${D}${=
libdir}/perl/config.sh; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0perl -pi -e 's/-Wdeclaration-after-state=
ment //g' ${i}
> - =A0 =A0 =A0 =A0done
> -}
> -
> -PARALLEL_MAKE =3D ""
> -
> -SRC_URI[md5sum] =3D "b8c118d4360846829beb30b02a6b91a7"
> -SRC_URI[sha256sum] =3D "e15d499321e003d12ed183601e37ee7ba5f64b278d1de301=
49ce01bd4a3f234d"
> diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
> deleted file mode 100644
> index da40972..0000000
> --- a/recipes/perl/perl_5.8.8.bb
> +++ /dev/null
> @@ -1,248 +0,0 @@
> -DESCRIPTION =3D "Perl is a popular scripting language."
> -HOMEPAGE =3D "http://www.perl.org/"
> -SECTION =3D "devel/perl"
> -LICENSE =3D "Artistic|GPLv1+"
> -PRIORITY =3D "optional"
> -# We need gnugrep (for -I)
> -DEPENDS =3D "virtual/db perl-native grep-native"
> -PR =3D "r39"
> -
> -# Major part of version
> -PVM =3D "5.8"
> -
> -SRC_URI[perl588targz.md5sum] =3D "b8c118d4360846829beb30b02a6b91a7"
> -SRC_URI[perl588targz.sha256sum] =3D "e15d499321e003d12ed183601e37ee7ba5f=
64b278d1de30149ce01bd4a3f234d"
> -
> -SRC_URI =3D "http://ftp.funet.fi/pub/CPAN/src/5.0/perl-5.8.8.tar.gz;name=
=3Dperl588targz \
> - =A0 =A0 =A0 =A0file://Makefile.patch \
> - =A0 =A0 =A0 =A0file://Makefile.SH.patch \
> - =A0 =A0 =A0 =A0file://makedepend-dash.patch \
> - =A0 =A0 =A0 =A0file://installperl.patch \
> - =A0 =A0 =A0 =A0file://perl-dynloader.patch \
> - =A0 =A0 =A0 =A0file://perl-moreconfig.patch \
> - =A0 =A0 =A0 =A0file://letgcc-find-errno.patch \
> - =A0 =A0 =A0 =A0file://generate-sh.patch \
> - =A0 =A0 =A0 =A0file://perl-5.8.8-gcc-4.2.patch \
> - =A0 =A0 =A0 =A0file://09_fix_installperl.patch \
> - =A0 =A0 =A0 =A0file://52_debian_extutils_hacks.patch \
> - =A0 =A0 =A0 =A0file://53_debian_mod_paths.patch \
> - =A0 =A0 =A0 =A0file://54_debian_perldoc-r.patch \
> - =A0 =A0 =A0 =A0file://58_debian_cpan_config_path.patch \
> - =A0 =A0 =A0 =A0file://60_debian_libnet_config_path.patch \
> - =A0 =A0 =A0 =A0file://62_debian_cpan_definstalldirs.patch \
> - =A0 =A0 =A0 =A0file://64_debian_enc2xs_inc.patch \
> - =A0 =A0 =A0 =A0file://asm-pageh-fix.patch \
> - =A0 =A0 =A0 =A0file://shared-ldflags.patch \
> - =A0 =A0 =A0 =A0file://config.sh \
> - =A0 =A0 =A0 =A0file://config.sh-32 \
> - =A0 =A0 =A0 =A0file://config.sh-32-le \
> - =A0 =A0 =A0 =A0file://config.sh-32-be \
> - =A0 =A0 =A0 =A0file://config.sh-64 \
> - =A0 =A0 =A0 =A0file://config.sh-64-le \
> - =A0 =A0 =A0 =A0file://config.sh-64-be"
> -
> -inherit siteinfo
> -
> -# Where to find the native perl
> -HOSTPERL =3D "${STAGING_BINDIR_NATIVE}/perl${PV}"
> -
> -# Where to find .so files - use the -native versions not those from the =
target build
> -export PERLHOSTLIB =3D "${STAGING_LIBDIR_NATIVE}/perl/${PV}/"
> -
> -# LDFLAGS for shared libraries
> -export LDDLFLAGS =3D "${LDFLAGS} -shared"
> -
> -do_nolargefile() {
> - =A0 =A0 =A0 sed -i -e "s,\(uselargefiles=3D\)'define',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_readdir64_r=3D\)'define',\1'undef=
',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(readdir64_r_proto=3D\)'\w+',\1'0',g=
" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "/ccflags_uselargefiles/d" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s/-Duselargefiles//" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s/-D_FILE_OFFSET_BITS=3D64//" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s/-D_LARGEFILE_SOURCE//" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${S}/Cross/config.sh-${TARGET_ARCH}-${TARGE=
T_OS}
> -}
> -
> -do_configure() {
> - =A0 =A0 =A0 =A0# Make hostperl in build directory be the native perl
> - =A0 =A0 =A0 =A0ln -sf ${HOSTPERL} hostperl
> -
> - =A0 =A0 =A0 =A0# Do out work in the cross subdir
> - =A0 =A0 =A0 =A0cd Cross
> -
> - =A0 =A0 =A0 =A0# Generate configuration
> - =A0 =A0 =A0 =A0rm -f config.sh-${TARGET_ARCH}-${TARGET_OS}
> - =A0 =A0 =A0 =A0for i in ${WORKDIR}/config.sh \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${WORKDIR}/config.sh-${SITEINFO_BITS} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${WORKDIR}/config.sh-${SITEINFO_BITS}-$=
{SITEINFO_ENDIANNESS}; do
> - =A0 =A0 =A0 =A0 =A0 =A0cat $i >> config.sh-${TARGET_ARCH}-${TARGET_OS}
> - =A0 =A0 =A0 =A0done
> -
> - =A0 =A0 =A0 =A0# Fixups for uclibc
> - =A0 =A0 =A0 =A0if [ "${TARGET_OS}" =3D "linux-uclibc" -o "${TARGET_OS}"=
 =3D "linux-uclibceabi" -o "${TARGET_OS}" =3D "linux-uclibcspe" ]; then
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -i -e "s,\(d_crypt_r=3D\)'define',\1=
'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_futimes=3D\)'defi=
ne',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(crypt_r_proto=3D\)'=
\w+',\1'0',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_getnetbyname_r=3D=
\)'define',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(getnetbyname_r_prot=
o=3D\)'\w+',\1'0',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_getnetbyaddr_r=3D=
\)'define',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(getnetbyaddr_r_prot=
o=3D\)'\w+',\1'0',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_getnetent_r=3D\)'=
define',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(getnetent_r_proto=
=3D\)'\w+',\1'0',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_sockatmark=3D\)'d=
efine',\1'undef',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,\(d_sockatmarkproto=
=3D\)'\w+',\1'0',g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0config.sh-${TARGET_ARCH}-${TARGE=
T_OS}
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 ${@base_contains('DISTRO_FEATURES', 'largefile', '', 'do_no=
largefile', d)}
> -
> - =A0 =A0 =A0 =A0# Update some paths in the configuration
> - =A0 =A0 =A0 =A0sed -i -e 's,@DESTDIR@,${D},g' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e 's,@ARCH@,${TARGET_ARCH}-${TARGET_OS},g'=
 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s%/usr/include/%${STAGING_INCDIR}/%g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0-e 's,/usr/,${exec_prefix}/,g' \
> - =A0 =A0 =A0 =A0 =A0 =A0config.sh-${TARGET_ARCH}-${TARGET_OS}
> -
> - =A0 =A0 =A0 =A0if test "${MACHINE}" !=3D "native"; then
> - =A0 =A0 =A0 =A0 =A0 =A0# These are strewn all over the source tree
> - =A0 =A0 =A0 =A0 =A0 =A0for foo in `grep -I -m1 \/usr\/include\/.*\\.h $=
{WORKDIR}/* -r | cut -f 1 -d ":"` ; do
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0echo Fixing: $foo
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0sed -e "s%/usr/include/%${STAGING_INCDIR=
}/%g" -i $foo
> - =A0 =A0 =A0 =A0 =A0 =A0done
> - =A0 =A0 =A0 =A0fi
> -
> - =A0 =A0 =A0 =A0rm -f config
> - =A0 =A0 =A0 =A0echo "ARCH =3D ${TARGET_ARCH}" > config
> - =A0 =A0 =A0 =A0echo "OS =3D ${TARGET_OS}" >> config
> -}
> -do_compile() {
> - =A0 =A0 =A0 =A0if test "${MACHINE}" !=3D "native"; then
> - =A0 =A0 =A0 =A0 =A0 =A0sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e 's|$Config{cppflags}||' ext/Errn=
o/Errno_pm.PL
> - =A0 =A0 =A0 =A0fi
> - =A0 =A0 =A0 =A0cd Cross
> - =A0 =A0 =A0 =A0oe_runmake perl LD=3D"${CCLD}"
> -}
> -do_install() {
> - =A0 =A0 =A0 oe_runmake install
> - =A0 =A0 =A0 =A0# Add perl pointing at current version
> - =A0 =A0 =A0 =A0ln -sf perl${PV} ${D}${bindir}/perl
> -
> - =A0 =A0 =A0 =A0# Fix up versioned directories
> - =A0 =A0 =A0 =A0mv ${D}/${libdir}/perl/${PVM} ${D}/${libdir}/perl/${PV}
> - =A0 =A0 =A0 =A0mv ${D}/${datadir}/perl/${PVM} ${D}/${datadir}/perl/${PV=
}
> - =A0 =A0 =A0 =A0ln -sf ${PV} ${D}/${libdir}/perl/${PVM}
> - =A0 =A0 =A0 =A0ln -sf ${PV} ${D}/${datadir}/perl/${PVM}
> -
> - =A0 =A0 =A0 =A0# Remove unwanted file
> - =A0 =A0 =A0 =A0rm -f ${D}/${libdir}/perl/${PV}/.packlist
> -
> - =A0 =A0 =A0 =A0# Fix up shared library
> - =A0 =A0 =A0 =A0mv -f ${D}/${libdir}/perl/${PV}/CORE/libperl.so ${D}/${l=
ibdir}/libperl.so.${PV}
> - =A0 =A0 =A0 =A0ln -sf libperl.so.${PV} ${D}/${libdir}/libperl.so.5
> -
> - =A0 =A0 =A0 =A0# Fix up installed configuration
> - =A0 =A0 =A0 =A0if test "${MACHINE}" !=3D "native"; then
> - =A0 =A0 =A0 =A0 =A0 =A0sed -i -e "s,${D},,g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,-isystem${STAGING_INCDIR} ,,g=
" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,${STAGING_LIBDIR},${libdir},g=
" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,${STAGING_BINDIR},${bindir},g=
" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,${STAGING_INCDIR},${includedi=
r},g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e "s,${TOOLCHAIN_PATH}${base_bindi=
r}/,,g" \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${bindir}/h2xs \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${bindir}/h2ph \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${datadir}/perl/${PV}/pod/*.pod \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${datadir}/perl/${PV}/cacheout.pl \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${datadir}/perl/${PV}/FileCache.pm \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/perl/${PV}/Config.pm \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/perl/${PV}/Config_heavy.pl=
 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/perl/${PV}/CORE/perl.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${D}${libdir}/perl/${PV}/CORE/pp.h
> - =A0 =A0 =A0 =A0fi
> -}
> -do_stage() {
> - =A0 =A0 =A0 =A0install -d ${STAGING_LIBDIR_NATIVE}/perl/${PV} \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${STAGING_LIBDIR}/perl/${PV}/CORE \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${STAGING_DATADIR}/perl/${PV}/ExtUt=
ils
> - =A0 =A0 =A0 =A0# target config, used by cpan.bbclass to extract version=
 information
> - =A0 =A0 =A0 =A0install config.sh ${STAGING_LIBDIR}/perl/
> - =A0 =A0 =A0 =A0# target configuration, used by native perl when cross-c=
ompiling
> - =A0 =A0 =A0 =A0install lib/Config_heavy.pl ${STAGING_LIBDIR_NATIVE}/per=
l/${PV}/Config_heavy-${TARGET_SYS}.pl
> - =A0 =A0 =A0 # target configuration
> - =A0 =A0 =A0 =A0install lib/Config.pm =A0 =A0 =A0 ${STAGING_LIBDIR}/perl=
/${PV}/
> - =A0 =A0 =A0 install lib/ExtUtils/typemap ${STAGING_DATADIR}/perl/${PV}/=
ExtUtils/
> - =A0 =A0 =A0 =A0# perl shared library headers
> - =A0 =A0 =A0 =A0for i in av.h embed.h gv.h keywords.h op.h perlio.h pp.h=
 regexp.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uconfig.h XSUB.h cc_runtime.h embedvar.=
h handy.h opnames.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 perliol.h pp_proto.h regnodes.h unixish=
.h config.h EXTERN.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 hv.h malloc_ctl.h pad.h perlsdio.h prot=
o.h scope.h utf8.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 cop.h fakesdio.h INTERN.h mg.h patchlev=
el.h perlsfio.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 reentr.h sv.h utfebcdic.h cv.h fakethr.=
h intrpvar.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 nostdio.h perlapi.h perlvars.h reentr.i=
nc thrdvar.h util.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dosish.h form.h iperlsys.h opcode.h per=
l.h perly.h regcomp.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thread.h warnings.h; do
> - =A0 =A0 =A0 =A0 =A0 =A0install $i ${STAGING_LIBDIR}/perl/${PV}/CORE
> - =A0 =A0 =A0 =A0done
> -}
> -
> -PACKAGES =3D "perl-dbg perl perl-misc perl-lib perl-dev perl-pod perl-do=
c"
> -FILES_${PN} =3D "${bindir}/perl ${bindir}/perl${PV}"
> -FILES_${PN}-lib =3D "${libdir}/libperl.so* ${libdir}/perl/${PVM} ${datad=
ir}/perl/${PVM}"
> -FILES_${PN}-dev =3D "${libdir}/perl/${PV}/CORE"
> -FILES_${PN}-pod =3D "${datadir}/perl/${PV}/pod \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/*/*.pod \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/*/*/*.pod \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${libdir}/perl/${PV}/*.pod"
> -FILES_perl-misc =3D "${bindir}/*"
> -FILES_${PN}-dbg +=3D "${libdir}/perl/${PV}/auto/*/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/perl/${PV}/auto/*/*/.d=
ebug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/perl/${PV}/auto/*/*/*/=
.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/perl/${PV}/auto/*/.de=
bug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/perl/${PV}/auto/*/*/.=
debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${datadir}/perl/${PV}/auto/*/*/*=
/.debug \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0${libdir}/perl/${PV}/CORE/.debug=
"
> -FILES_${PN}-doc =3D "${datadir}/perl/${PV}/*/*.txt \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/*/*/*.txt \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/Net/*.eg \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/CGI/eg \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/ExtUtils/PATC=
HING \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/ExtUtils/NOTE=
S \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/ExtUtils/type=
map \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/ExtUtils/MANI=
FEST.SKIP \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/CPAN/SIGNATUR=
E \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/CPAN/PAUSE200=
3.pub \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/B/assemble \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/B/makeliblink=
s \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/B/disassemble=
 \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/B/cc_harness =
\
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/ExtUtils/xsub=
pp \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/Encode/encode=
.h \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/unicore/mktab=
les \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/unicore/mktab=
les.lst \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ${datadir}/perl/${PV}/unicore/versi=
on"
> -
> -RPROVIDES_perl-lib =3D "perl-lib"
> -
> -require perl.inc
> -
> -# Create a perl-modules package recommending all the other perl
> -# packages (actually the non modules packages and not created too)
> -ALLOW_EMPTY_perl-modules =3D "1"
> -PACKAGES_append =3D " perl-modules "
> -RRECOMMENDS_perl-modules =3D "${@' '.join(all_perl_packages(d))}"
> -
> -python populate_packages_prepend () {
> - =A0 =A0 =A0 =A0libdir =3D bb.data.expand('${libdir}/perl/${PV}', d)
> - =A0 =A0 =A0 =A0do_split_packages(d, libdir, 'auto/(.*)(?!\.debug)/', 'p=
erl-module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, mat=
ch_path=3DTrue)
> - =A0 =A0 =A0 =A0do_split_packages(d, libdir, '(.*)\.(pm|pl|e2x)', 'perl-=
module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_p=
ath=3DTrue)
> - =A0 =A0 =A0 =A0datadir =3D bb.data.expand('${datadir}/perl/${PV}', d)
> - =A0 =A0 =A0 =A0do_split_packages(d, datadir, 'auto/(.*)(?!\.debug)/', '=
perl-module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, ma=
tch_path=3DTrue)
> - =A0 =A0 =A0 =A0do_split_packages(d, datadir, '(.*)\.(pm|pl|e2x)', 'perl=
-module-%s', 'perl module %s', recursive=3DTrue, allow_dirs=3DFalse, match_=
path=3DTrue)
> -}
> -
> -PACKAGES_DYNAMIC =3D "perl-module-*"
> -
> -require perl-rdepends_${PV}.inc
> -require perl-rprovides.inc
> -
> -PARALLEL_MAKE =3D ""
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


