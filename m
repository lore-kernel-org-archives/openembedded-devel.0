Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1871B75D2D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Jul 2015 15:15:10 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so142051720qke.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 07 Jul 2015 08:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:from:date:to:subject:user-agent:mime-version
	:content-type; bh=p89Yb5SjvCcc2peVe6wIIH7SzAYN22pZpOM5FDXpPo8=;
	b=lUTITgS7u2NhIZ/Zp1utcM8XArB9cGeLNIa5K5+VZkxoLm2C/YnP7KasMuIYyU7x3g
	7cBy0j4pLwvh0DAy9zz4UpbAenzfsMmujFU0SWeIlytAVEUs3G89+0QpWusrZ9HNseQi
	k6MuJnEjYKXotDKx9x3xqmmf7p0h2nUZpfdvdRt4D8PaAPXMwoBgTMNt0em/Rx4AnwD0
	aP+OPDvHe7If1h3lPK9SmHP+sLEZXzlzOTya7ZUKNpe5M+A2Rk/kof8ZnL29h3xGvJx3
	4Ubo1z0a8sB6tVeq6kHZjjyijE/MrxvD+Gb+hbMI7qqi4FpuPWUkRg9MF54fzR/uAQbQ
	pB5w==
X-Received: by 10.140.165.150 with SMTP id l144mr7643263qhl.99.1436282110210; 
	Tue, 07 Jul 2015 08:15:10 -0700 (PDT)
Received: from localhost ([177.100.226.57]) by mx.google.com with ESMTPSA id
	o130sm11243276qhb.25.2015.07.07.08.15.07
	for <openembedded-devel@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Jul 2015 08:15:09 -0700 (PDT)
Message-ID: <559becfd.88da8c0a.a23b.ffffc578@mx.google.com>
Received: by localhost (sSMTP sendmail emulation);
	Tue, 07 Jul 2015 12:15:04 -0300
From: "Otavio Salvador" <otavio.salvador@gmail.com>
Date: Tue, 07 Jul 2015 12:15:04 -0300
To: Meta-OpenEmbedded Mailing listing
	<openembedded-devel@lists.openembedded.org>
User-Agent: mail v14.8.2
MIME-Version: 1.0
Subject: Updates to meta-browser (master) in 2015-07-07
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
X-List-Received-Date: Tue, 07 Jul 2015 15:15:11 -0000
Content-Type: text/plain; charset=US-ASCII

Hello,

I pushed following updates:

commit fdb555cdaa1ae090f97bf6ab9736e4c158509a92 (HEAD -> master, origin/master, origin/HEAD)
Author: Gary Thomas <gary@mlbassoc.com>
Date:   Tue Jun 30 14:55:30 2015 -0600

    chromium: List all PACKAGECONFIG settings to avoid warning
    
    OE-core now warns if PACKAGECONFIG is used to set an option that
    does not have a corresponding PACKAGECONFIG[option]="xxx" line.
    This recipe makes use of many such options & this patch suppresses
    those warnings by listing the options.
    
    Signed-off-by: Gary Thomas <gary@mlbassoc.com>
    Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>

Regards,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

