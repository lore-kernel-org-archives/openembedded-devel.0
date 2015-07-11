Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id B611E6017E
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 14:56:17 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so182700653pab.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 11 Jul 2015 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=MpDFTX39Op4eDXTzWijWR/m7EknWEkhd75rsr6S4rXI=;
	b=FBVOa4AVj1VAOXwuuvi65w7DXm7tX4Hh1JtOMRBgesKVrZwy3QCT67tLE8EjVnenee
	bjjNsjdLZreLicjVmcCaHgAhysTRuc57VBksIVHqHRQhx9k9gOAv7kPtaL4HZyLEuZIQ
	BBZSir8hQLcESkjRtxQG5ixadvXOXuLc4IhRIh263KxnQjFQFUnS+SLYI3+l8czzfuPp
	a8+DHFFibL14g2f3SfKbg1ix8Kyg68ay7LdtDrMi9Z+Ks/1fjltG/y9qWsA/UwkwOWSj
	W66mJ68dRg/dkPaD1+zerw5ONdPy/OWfYd2pekEpIEM6yW8xNQU5QdNgSwViCGvAz/Pw
	SrQw==
X-Received: by 10.70.23.196 with SMTP id o4mr52859701pdf.164.1436626578122;
	Sat, 11 Jul 2015 07:56:18 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1239:10bb:84b8:7d8:8f7f?
	([2601:202:4000:1239:10bb:84b8:7d8:8f7f])
	by smtp.googlemail.com with ESMTPSA id
	db1sm13147043pdb.50.2015.07.11.07.56.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 11 Jul 2015 07:56:16 -0700 (PDT)
Message-ID: <55A12E84.5000407@gmail.com>
Date: Sat, 11 Jul 2015 07:56:04 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: meta-kali
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
X-List-Received-Date: Sat, 11 Jul 2015 14:56:21 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hello,

I have put together a layer that is based off of the Kali Linux 
(http://tools.kali.org/).  It contains penetration test tools.

git://github.com/akuster/meta-kali

- armin

