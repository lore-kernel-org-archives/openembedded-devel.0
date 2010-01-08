Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NT9nw-0005aG-GI
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jan 2010 09:02:47 +0100
Received: by fxm4 with SMTP id 4so15896770fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Jan 2010 00:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=4jQqhubTyLyv5PDdN6o7xTOUy4gSVcKyRNdfiaItO9A=;
	b=rhV/iPGXvIjRkDvVIxPi+TLFpi4tQt2g/+9i6C/v3SB+nMIo/Vf9+CuViRMXTs3RuP
	vbBXY3jX8ec9GuoFmXVAwC4kwmTrk39/34C+y47aT38WBtxdjSzVOYbd3FrnM91yTzpq
	jm3C3eZoMupbpc27Zoa4NBoOPOU4K6RhPD4fo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=lopgVYd7uNr3/q1MorzF3LcuGLB+oH9jnAGn3yhBOVVzEGLolo0xbwy65eBfBSBYW8
	47GegI/zV4tGIlx62jI8IcBhF+tTm90y6LnEKIBeKBB6lzuuUfDhTH8Nx6sA4cC4Xq/g
	/WtJx4qXIqvDU0/g18FzV68pqjVkofWkNk6BA=
Received: by 10.86.6.37 with SMTP id 37mr454311fgf.18.1262937638876;
	Fri, 08 Jan 2010 00:00:38 -0800 (PST)
Received: from ?192.168.0.100? ([92.255.152.210])
	by mx.google.com with ESMTPS id d4sm48143697fga.21.2010.01.08.00.00.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 08 Jan 2010 00:00:37 -0800 (PST)
Message-ID: <4B46E623.9030005@gmail.com>
Date: Fri, 08 Jan 2010 13:00:35 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: How to extract OE cross toolchain?
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
X-List-Received-Date: Fri, 08 Jan 2010 08:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I've got an OE building host and some development hosts with same 
hardware platform and same GNU/Linux distribution. I wonder, is it 
possible to extract cross toolchain, builded on OE host, to deb package 
for example?

Thanks.

-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



