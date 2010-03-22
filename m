Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mrt.karadenz@gmail.com>) id 1NtnZl-0001KM-OP
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Mar 2010 20:46:14 +0100
Received: by pvc21 with SMTP id 21so2716895pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Mar 2010 12:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:organization:to:subject
	:date:user-agent:references:in-reply-to:mime-version:content-type
	:content-transfer-encoding:message-id;
	bh=szDL4nVjbP7sfADJC5zs/soriGjWcQoFxTcUzwTOEvw=;
	b=rS8JiAaG/1BxK+U4qNEk0P+TEhm0vZseaz7TcObeJGFcThacIJHF0AG+BfmvBFATwD
	IZvPBpG81S+iKq0Nlxw5JJHsHvT2g/zEWkoSWy5i9RdICFbG+WUI0KdWtBR4jGPwFjsS
	FYIhXZiXX8HLZtTiuKIski7dy5qSYXS8eh9p0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:organization:to:subject:date:user-agent:references:in-reply-to
	:mime-version:content-type:content-transfer-encoding:message-id;
	b=dc5Utnl8OGz4UyjHBidl3UM833MNvbzMn2NQILh0Wb0SfUULRDuETppmATU5cL5M/h
	MeIV4f7kMtowCYlGlHp+3E6oT5ioODWq534so7skvn6uNv70+byQppM8SpCE5SkrfRRg
	tt9YEBeTs762rYhz0FHnt/5MFvQBFr59+crYc=
Received: by 10.142.120.2 with SMTP id s2mr1338471wfc.245.1269286984763;
	Mon, 22 Mar 2010 12:43:04 -0700 (PDT)
Received: from linux-dm4x.localnet ([88.224.192.131])
	by mx.google.com with ESMTPS id e16sm205219wfg.2.2010.03.22.12.43.02
	(version=SSLv3 cipher=RC4-MD5); Mon, 22 Mar 2010 12:43:03 -0700 (PDT)
From: Murat Karadeniz <mrt.karadenz@gmail.com>
Organization: Bilkon Bilgisayar =?utf-8?q?Kontroll=C3=BC_Cihazlar_Ltd=2E?= 
	=?utf-8?q?_=C5=9Eti=2E?=
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Mar 2010 21:43:00 +0200
User-Agent: KMail/1.12.4 (Linux/2.6.31.12-0.1-default; KDE/4.3.5; i686; ; )
References: <201003222055.23408.murat@bilkon-kontrol.com.tr>
	<20100322191054.GA28005@denix.org>
In-Reply-To: <20100322191054.GA28005@denix.org>
MIME-Version: 1.0
Message-Id: <201003222143.00252.murat@bilkon-kontrol.com.tr>
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: mrt.karadenz@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: u-boot_git recipe
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
X-List-Received-Date: Mon, 22 Mar 2010 19:46:14 -0000
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit

murat@linux-dm4x:~/system/oe/build> bitbake -k u-boot_git


NOTE: Handling BitBake files: \ (8095/8095) [100 %]      
Parsing of 8095 .bb files complete (7785 cached, 310 parsed). 7917 targets, 
331 skipped, 0 masked, 0 errors.
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0xf38524c>                                                                                      
NOTE: Resolving any missing task queue dependencies                                                                                             
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'u-
boot_git' but it wasn't found in any PACKAGE or RPROVIDES variables
Unknown Event: <bb.event.NoProvider instance at 0x1012e8ec>                                                                                     
NOTE: Runtime target 'u-boot_git' is unbuildable, removing...                                                                                   
Missing or unbuildable dependency chain was: ['u-boot_git'] 

And i m sorry, i could not understand "which branch you are using". i git 
clone  openembedded from repository. And same way i get bitbake from git repo. 
And i made a few conf as told as openembedded getting started. i m trying only 
build u-boot with oe and bitbake.

Thanks Denys and list


