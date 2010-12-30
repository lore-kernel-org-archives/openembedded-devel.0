Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cliff.brake@gmail.com>) id 1PYPp5-0003Jj-MI
	for openembedded-devel@lists.openembedded.org;
	Thu, 30 Dec 2010 22:14:12 +0100
Received: by wyb40 with SMTP id 40so11620218wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 30 Dec 2010 13:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=1wpLu8p4X4IYZttuy0bk9kNmooXxk5PBa5LNfUia3p4=;
	b=RpNL8YYaEuFCoVQ6Y5tsxVHTKyPLaI5zPctWZ1iX61h90tOj+SiuNLg7R+Ow5gkQ7+
	RkoSd5eiT+NBPg8Jt7079sYK5lVJ0iQzTw04Ymgh8J7HH9wspilrQ3zJwWJpDuxUck1U
	fMT/m8MrMnZ8qoaXy3+BiHMKZh02+MkwHoAAQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bgsMzfAbN3qyWrN+DWvMnc3vqgGO4uB20NI1a1uJixmUOMl6oetpJW795HDEI58ioD
	dHzIJGIurJTWc2oIhvoIpObaDUseG6ublG4fqyKuPlcmN8/nf5ILN6rc8y7rZigYYX7C
	22a5jlzlGF0LCOtfZPSTAKBTdw4rn2Ei4eZqc=
MIME-Version: 1.0
Received: by 10.216.142.101 with SMTP id h79mr17650390wej.49.1293743634591;
	Thu, 30 Dec 2010 13:13:54 -0800 (PST)
Received: by 10.216.254.137 with HTTP; Thu, 30 Dec 2010 13:13:54 -0800 (PST)
Date: Thu, 30 Dec 2010 16:13:54 -0500
Message-ID: <AANLkTim6CbThEpukkx42bqHNhwDH4tdoVf+hxRzdC=tX@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: testing branch 2010-12-30
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
X-List-Received-Date: Thu, 30 Dec 2010 21:14:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Last weeks testing was moderately successful:

http://cgit.openembedded.org/cgit.cgi/openembedded/tag/?id=tested_2010-12-24

for details on what is failing, there are a number of issues listed on
this page:

http://wiki.openembedded.org/index.php/Testing

master has been merged to testing-next, and we are ready for clean builds.

Thanks,
Cliff

-- 
=================
http://bec-systems.com


