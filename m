Received: from mail-ew0-f44.google.com ([209.85.215.44])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jay@jay-tech.ru>) id 1POW52-0000df-Vs
	for openembedded-devel@lists.openembedded.org;
	Fri, 03 Dec 2010 14:53:45 +0100
Received: by ewy8 with SMTP id 8so5003274ewy.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 03 Dec 2010 05:52:23 -0800 (PST)
Received: by 10.213.31.78 with SMTP id x14mr588267ebc.1.1291384341520;
	Fri, 03 Dec 2010 05:52:21 -0800 (PST)
Received: from mozart.localnet (95-29-180-5.broadband.corbina.ru [95.29.180.5])
	by mx.google.com with ESMTPS id b52sm1503943eei.19.2010.12.03.05.52.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 03 Dec 2010 05:52:20 -0800 (PST)
Sender: Yury Bushmelev <jay@jay-tech.ru>
From: Yuri Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 3 Dec 2010 16:47:11 +0300
User-Agent: KMail/1.13.5 (Linux/2.6.36-ARCH; KDE/4.5.4; x86_64; ; )
MIME-Version: 1.0
Message-Id: <201012031647.11748.jay4mail@gmail.com>
X-SA-Exim-Connect-IP: 209.85.215.44
X-SA-Exim-Mail-From: jay@jay-tech.ru
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_SOFTFAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [release-2010.12] ffmpeg_svn build fails
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
X-List-Received-Date: Fri, 03 Dec 2010 13:53:45 -0000
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit

Hello!

Today's testbuilder run on release branch for angstrom-2008.1/angstrom-
gnome-image-big was failed on ffmpeg_svn:
http://tinderbox.openembedded.net/packages/1171052/

-- 
Yury Bushmelev


