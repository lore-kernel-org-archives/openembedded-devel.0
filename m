Return-Path: <mhalstead@linuxfoundation.org>
Received: from mail-pg0-f51.google.com (mail-pg0-f51.google.com [74.125.83.51])
	by mail.openembedded.org (Postfix) with ESMTP id E010771E02
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 20:37:24 +0000 (UTC)
Received: by mail-pg0-f51.google.com with SMTP id a123so21798530pgc.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=to:from:subject:organization:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=QHus5XEYla2MF3Y68UFRY7l5B/f5tUj3HriU7m2H6Ds=;
	b=fVMbjt5rr3ls+ZD5UYa5u4etzW393PqtgYuqZZZ1L0o50E26Io6aDMf7yrLcBgGzxJ
	78NaWSI9KcoqUpPkVUSqKqxP1V6PFD6mXpTHzQNpwXlWMlwsydL00aSGcuihmzS8b12e
	kwb0RUvm1OQ/u3Vh+TkHHMDB4mQB2PhglXRIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:organization:message-id:date
	:user-agent:mime-version:content-transfer-encoding;
	bh=QHus5XEYla2MF3Y68UFRY7l5B/f5tUj3HriU7m2H6Ds=;
	b=YYR+4N3WuPEQePa9j9hN6p5JVWJwnfWl+ILWqBWGo4RSERUI92s8+bVwBm9C39Uwt7
	PndPInHyFHXt/i1VLSDd6dxX/gMcLq1e8hkBoqsYQ2qkvUDS4hQvsh/smQYx5CY453hn
	AGyvxBuVnoIXsI0BbHnbhGWuZMiZ8z2SpsurFEj9zxJYLv70sErjlaP9JMq/2z5zisil
	2tlIgebPnQL/jaOxATMxLd4HIJS8j/PAp81U/ZtTiJ0eMq7igq2y4BuxPiJG9HBdQCSE
	YzPyjvo3weYs4I+b3uIX/FQeaZhLmtvp3Ido8PPZt8RQuyL3lJl/UdpK/WSJFp13K7OI
	AarA==
X-Gm-Message-State: AMke39khlw16TwIjKZDanIMTNUUvRv6YRSQXDjbLcxfmEHMaTbBlo9fC4wP56sRE4X11etJH
X-Received: by 10.98.152.219 with SMTP id d88mr6595850pfk.153.1487623045538;
	Mon, 20 Feb 2017 12:37:25 -0800 (PST)
Received: from yct-lpt.lan (nat-wv.mentorg.com. [192.94.38.34])
	by smtp.gmail.com with ESMTPSA id
	c204sm36646497pfb.51.2017.02.20.12.37.24
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 12:37:24 -0800 (PST)
To: openembedded-devel@lists.openembedded.org
From: Michael Halstead <mhalstead@linuxfoundation.org>
Organization: Linux Foundation
Message-ID: <1ff4cca2-6472-848d-1971-4f707577a125@linuxfoundation.org>
Date: Mon, 20 Feb 2017 12:37:23 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
Subject: List reply reverted to default setting
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Feb 2017 20:37:27 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hello subscribers,

This list is now set back to the default of replying to the poster
instead of the list. This is the configuration used on all of the other
OE lists. Please use your mail client's reply all feature in order to
reply to the list.


- -- 
Michael Halstead
Linux Foundation / SysAdmin
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYq1OCAAoJEGpkljW6QlqV1yQQAI1QAvp2LeWXQ1SvtRNWoCRy
DtQ6bnlwI1xp9yrObvZFaTKxg6domUplAbNH/aC9nkt8G9FY0cQ/dV/IpKyyKUta
GFib9AZhhQBWmi5JMWdvXt1n0aLg01MmtjHooSgaoosX737jLdqBRycXUD2F5Zd5
+7j94lspZrgwXASTSgwaSzyEvqXBo0U3tUex3v9TxejjFYyLmnsz0aloouMbwwxV
Ci1M/hnCb+lAtScSz0sE2hJPofrSrWg27wwVQHabo9d7nxPlL9UAxLRQMb5xmwlS
07HaRipTrgsKBko7Z63NO210v/fbQjOoQwsMr9MaUzH0kqQSWnSV8mTTIwqQCxi/
GcIzKsMavMJBNJdv50O/JipF2FgnV5P2pn7iWFlqys44VmKQGF2xvUsfEuccSIC8
vwF7ejVGluEmJ6IMqrCXTUR2hNofA0plHxt7LTpAVvMAmC8ypU5W0eX0FWGlBBjh
EBDVGOqVpg3uAB9bixgrPAmdPtGQj5luo6uZ3FFed300pUgIDk9OzT7HVyOBguh0
dA66KoWCkhPKuJ1SJmqc5cFQkF33/4iiwzI/1xJfkIpSIiFaLU3DSNsKt/6tlFz4
rT10Zd8w1I3cbwygfCUYueiGuQP/UO5W5Te18Z+195bg3X5edd/1sbXv2AH44D37
oro2syhCg8JheLnIWf+x
=iFxw
-----END PGP SIGNATURE-----


