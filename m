Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P4hKe-0000om-00
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 23:51:56 +0200
Received: by iwn7 with SMTP id 7so1108102iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 09 Oct 2010 14:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=G0gBkJPAg9LjYoCZoX7HYiUrTDo7iyMVyA2DR9nppjA=;
	b=VpOTewESAsf3ncTFDS670r3t2QiqFToXJUdTw1RG5/b+hybYDnKYw2ljkKVEmCbADs
	Jnpp69b2HTPD+Zu4Ttd3EU70x8uGvzlJOUbJHIJHRMOZzYHrn8rMAhbVNr8W4EbXpjMY
	56hc78tIlaj1ncbCNcYP7rR4PmMWU4NAzHgXo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=K8GqsGiAO7kE2OXRzrBpWLG7euXX9HyQV4M6D6tE12K21UvX71XVVBS9sFT5Xsg9sJ
	6KYyw1g6ueRdGWk9owlaGjf15SOsNogvtAKuNR0VS+hh8mC/CKKZwUcDj0kyCmex9Tws
	9Mb8N2RSBK8mXdo9bmRg//wdJON9DDZPvnKDo=
MIME-Version: 1.0
Received: by 10.231.193.81 with SMTP id dt17mr2777891ibb.177.1286661092247;
	Sat, 09 Oct 2010 14:51:32 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Sat, 9 Oct 2010 14:51:32 -0700 (PDT)
Date: Sat, 9 Oct 2010 23:51:32 +0200
Message-ID: <AANLkTikmzD_v4YbOAMq3GX42=Tw0p-f6pWc8JXJyj5=m@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: kernel packaged staging issue
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
X-List-Received-Date: Sat, 09 Oct 2010 21:51:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Dear all,

Tried to rebuild an image from packaged staging and got the following
error for my kernel:
install: cannot stat `arch/arm/boot/uImage': No such file or directory
This is from /home/frans/oe/tmp_minimal/work/sheevaplug-oe-linux-gnueabi/linux-kirkwood-2.6.32+2.6.33-rc5-r18/temp/log.do_deploy.4309

Anyone an idea how to fix this?

Thanks a-lot, Frans


