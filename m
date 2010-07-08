Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <df6.626@gmail.com>) id 1OWkFs-0007WU-9C
	for openembedded-devel@lists.openembedded.org;
	Thu, 08 Jul 2010 08:06:56 +0200
Received: by ewy7 with SMTP id 7so108325ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jul 2010 23:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=G5w4gYEpOhU5O8lhcBBcVvn+MttiaRlO7ERIRyC8Uug=;
	b=T2gbL+KkanRlcSrDYaZ/wJ4/PomE5lnEnzV7EiH9adq0va/OJAkW92RkVNvdgN+GUJ
	857GV6NAjfN5PnT+p5+TkNklbl9xAfM7m7Lnj5ICBQzFAYGkHQSkrqtsJauQfHStGotv
	Bury4rdNb/gCCVBQfVCAJTI24bZ09KJ4UnW/g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=VJbTnLhkJRFlMz4uPAiR33UuaC9LEloLTyP7jzZl5aXkzCXg11ZE/EHByM1Tua6gE2
	whj1FXq2vosePmEpS/xbxU/x88iuSEZ9r+lhvEqb/WJmhgWrHJRWyVImMcC/UgFaDJSA
	g5MnHoDJGG2PSNjAYstPz2j6bO2Ycn6hXaoQo=
Received: by 10.213.34.3 with SMTP id j3mr6789523ebd.65.1278568907358;
	Wed, 07 Jul 2010 23:01:47 -0700 (PDT)
Received: from [192.168.1.142] ([94.180.8.122])
	by mx.google.com with ESMTPS id a48sm68161941eei.13.2010.07.07.23.01.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 07 Jul 2010 23:01:46 -0700 (PDT)
Message-ID: <4C3569C8.2060703@gmail.com>
Date: Thu, 08 Jul 2010 12:01:44 +0600
From: Dmitry Vinokurov <df6.626@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.10) Gecko/20100528 Thunderbird/3.0.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.47
X-SA-Exim-Mail-From: df6.626@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Personal user repository
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
X-List-Received-Date: Thu, 08 Jul 2010 06:07:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi!

As I see in OE wiki ( 
http://wiki.openembedded.net/index.php/Branching_Policy ) developers can 
request personal user repository. I asked about it on #oe (message from 
12:05 at http://ibot.rikers.org/%23oe/20100707.html.gz) and after a 
brief conversation I was asked to raise this issue here.

Actually I'm working on adding Phytec LPC3250 board support (based on 
NXP patches for 2.6.27.8) to OE and on one PLC project based on LPC3250 
(it's in  development stage). Recently the question about hosting the 
project arised, so I wonder is it possible to host my branch on OE 
repository and give me ssh access to it or I'd use some other hosting?

Thanks.

-- 
Best Regards,
Dmitry Vinokurov
+7 905 862 17 11
<df6.626@gmail.com>



