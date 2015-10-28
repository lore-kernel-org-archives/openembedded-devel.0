Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 0A57E76710
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 12:28:10 +0000 (UTC)
Received: by qgem9 with SMTP id m9so4405536qge.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent;
	bh=b0OkOoTK+9H9O13g92Gu4rU2iXXlR3o3fstlYiuwIH0=;
	b=EEPCvp5i2GrGrWRf6zczdqT0RNLjvWXGa0NbVmCDw07ED12B2A8gjzIz4flkAjF7Qb
	1SxwmOL1t0kCCiGjsNkDffxJDL5XBoywKUiHYxU1bxynOtFjyK4FB1uW2NlsjgHAaoqb
	1S78uut5CpqMCmcP/jz7DRjggwlkb6hq17PtYdZdBADCgNB0gizuGFs9x5e8U3upvLy5
	L2W8GYpaOiPsd4tE39OMv2RW/De6HzuBQgTEWkKwb7wHDHGbr14tpzjtE7alNpyGY7wR
	IVnbc7LOZp4K2BhnyqJVw9X4u2+BO/hnisPVNIwvJQG0hk/+8ZLYnabCf4b0siTe69cb
	WRxg==
X-Received: by 10.140.233.130 with SMTP id e124mr59796950qhc.79.1446035290305; 
	Wed, 28 Oct 2015 05:28:10 -0700 (PDT)
Received: from localhost ([177.100.174.62])
	by smtp.gmail.com with ESMTPSA id c7sm17028272qgc.2.2015.10.28.05.28.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Oct 2015 05:28:09 -0700 (PDT)
Message-ID: <5630bf59.071e8c0a.b7e1d.3ca6@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Wed, 28 Oct 2015 10:28:04 -0200
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Wed, 28 Oct 2015 10:28:04 -0200
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.5
Subject: Updates to meta-browser (master) in 2015-10-28
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
X-List-Received-Date: Wed, 28 Oct 2015 12:28:14 -0000

Hello,

I pushed following updates:

commit c44a4ac0970938999c2533042a6629f37d7047cc (HEAD -> pending, origin/master, origin/HEAD)
Author: Max Krummenacher <max.oss.09@gmail.com>
Date:   Wed Oct 28 09:43:33 2015 +0100

    chromium: fix missing include of sys/stat.h
    
    Explicitely include a needed header to fix compile time error.
    
    sys/stat.h used to be indirectly included from another header but
    no longer is.
    
    Signed-off-by: Max Krummenacher <max.oss.09@gmail.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

