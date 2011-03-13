Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PytRu-0008LM-DY
	for openembedded-devel@lists.openembedded.org;
	Sun, 13 Mar 2011 23:07:42 +0100
Received: by pwj9 with SMTP id 9so755485pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 13 Mar 2011 15:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:content-type:content-transfer-encoding;
	bh=d1ABTwpfnv0M4HuMD/x/7xqbUH4dROE2WyPgyubpcas=;
	b=teMLusbODjS9GR8+itg7jrqdj4phv84Apt4Jzq7X0gdkyabsYn+Rmr4FuhmfrXv7dH
	0jGZZEpyxp3bhlmrhpzeU5k430F1L8G/1wURrBrvmGXnYyLONEHpeUJgiOPsmS3m1LvH
	tPcqHbLygsby/mWSZ+zGWTtEjkEUzbTK4yt1I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=fqRYaFK2D25qZ9EGyiYzSEuO1T9gOjVbloSlPw/b2xfYLgDNeKV92HAdALwiq8Apf/
	5yQkAqeUIdYEIX9G8AghaM5g/n8oW9Sta2+LZSo/V6JN380bo1hWYvISTPWtYVsUTC7X
	O3u4JaiBNt6SgeN2xSsfsthzY8D3IPWEyZ+xk=
Received: by 10.143.47.6 with SMTP id z6mr2438621wfj.227.1300053961543;
	Sun, 13 Mar 2011 15:06:01 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id w11sm9290635wfh.6.2011.03.13.15.05.59
	(version=SSLv3 cipher=OTHER); Sun, 13 Mar 2011 15:06:00 -0700 (PDT)
Message-ID: <4D7D3FBD.9070102@gmail.com>
Date: Sun, 13 Mar 2011 15:05:49 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US;
	rv:1.9.2.15) Gecko/20110303 Thunderbird/3.1.9
MIME-Version: 1.0
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: openembedded-core + angstrom boots into qemuarm
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
X-List-Received-Date: Sun, 13 Mar 2011 22:07:42 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi

I have been playing with openembedded-core , using meta-openembedded and 
angstrom layers together can be used to create a working images
I was able to boot the console-image into qemu. I did a small writeup
for anyone who is interested

http://sakrah.homelinux.org/blog/2011/03/using-openembedded-core-to-build-angstrom-for-qemu/

Have fun !

-Khem


