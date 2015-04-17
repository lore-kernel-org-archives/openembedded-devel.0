Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 4A560605D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 20:45:31 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so138940425pdb.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 17 Apr 2015 13:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=iN0fSHq+ux8cYwAUn04Ng1SDcgxQwNAC0jUHS2YHVFw=;
	b=GdToRcc49PR9ebeN4lYDoQ8DFos2YJyNuhtNbYf6RM3D2X5lC+UTsDMDGY4GYpDc3y
	GjQ4F0lvhjt+V1ukFGL7RkpbJDYucMIo011sVH1xPEPw+abCtXax4kN4/jCTQASpWJ7Z
	KLqJpsJeNZvkRP4Pk+/O8E4aolHfqotuuSwNFq7A2q76+JkVlZeFZAf0j/mJ0uxlwkYq
	CVw9LDWysGMdoucKeknxPfSpphm4XfhEBa0FA/vS/hzNgpa/CrooMZlXUURCQF8l6AiI
	Uel71/xPmkn1WzdzW8r/YipVdnezz3DK+sYMLuJugBt9gJ811Mb/+6Kw8Uw+cyhgy9Jt
	Jrtg==
X-Received: by 10.70.102.11 with SMTP id fk11mr8513608pdb.144.1429303530832;
	Fri, 17 Apr 2015 13:45:30 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:45a2:e7e6:135c:7e84?
	([2601:c:a700:3ba7:45a2:e7e6:135c:7e84])
	by mx.google.com with ESMTPSA id
	op4sm10924090pbb.77.2015.04.17.13.45.28
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Apr 2015 13:45:29 -0700 (PDT)
Message-ID: <553170E1.2010400@gmail.com>
Date: Fri, 17 Apr 2015 13:45:21 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: "yocto@yoctoproject.org" <yocto@yoctoproject.org>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: meta-qemu-bsps
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
X-List-Received-Date: Fri, 17 Apr 2015 20:45:35 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello all,

I just put together a layer to warehouse miscellaneous qemu machine 
support. ppc64 is the there now, working on more. Contributions are welcome.

https://github.com/akuster/meta-qemu-bsps

enjoy,

Armin

